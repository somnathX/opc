<?php
	include("languages.php");
	$pid = $_GET['pid'];
	$server = "localhost";
	$user = "root";
	$pass = "";
	$db = "njrcode";
	$conn = mysqli_connect($server , $user ,$pass , $db);
	$response = array("error"=>false , "errorType"=>"");
	if (!$conn) {
    	$response["errorType"] = "database no connected";
    	$response["error"] = true;
	} 
	else
	{
		$query = "SELECT * FROM `problems` WHERE pid = " . $pid ;
		$result = mysqli_query($conn, $query);
		if (mysqli_num_rows($result) > 0) {
   			 $row = mysqli_fetch_assoc($result);
   			 $response["code"] = $row["code"];
   			 $response["name"] = $row["name"];
   			 $response["type"] = $row["type"];
   			 $response["contest"] = $row["contest"];
   			 $response["status"] = $row["status"];
   			 $response["pgroup"] = $row["pgroup"];
   			 $response["statement"] = $row["statement"];
   			 $response["input"] = $row["input"];
   			 $response["output"] = $row["output"];
   			 $response["timelimit"] = $row["timelimit"];
   			 $resonse["score"] = $row["score"];
   			 $str = "";
   			 $len = strlen($row["languages"]);
   			 for($i = 0 ; $i < $len ; $i++)
   			 {
   			 	$ch = substr($row["languages"], $i, 1);
   				if(is_numeric($ch))
   				{
   					if($i < $len-1 && is_numeric(substr($row["languages"], $i+1, 1)))
   					{
   						$ch = $ch. substr($row["languages"], $i+1, 1);
   						$i+=1;
   					}
   					$str = $str . getLanguage($ch) .' , ';
   				}
   			 }
   			 $response["languages"] = $str;
   			 $response["options"] = $row["options"];
   			 $response["displayio"] = $row["displayio"];
   			 $response["maxfilesize"] = $row["maxfilesize"];
   			 $response["solved"] = $row["solved"];
   			 $response["total"] = $row["total"];
		} 	
		else
		{
			$response["errorType"] = "pid not present please sent true id";
    		$response["error"] = true;
		}

	}
	$response = json_encode($response);
	echo $response;
?>