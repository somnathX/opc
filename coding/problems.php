<?php
	function createConnection()
	{
		$server = "localhost";
		$user = "root";
		$pass = "";
		$db = "njrcode";
		$conn = mysqli_connect($server , $user ,$pass , $db);
		return $conn;
	}

	function getContest($conn)
	{
		$response = array("error"=>"" ,"errorType"=>"","cid"=>array());
		$query = "SELECT cid FROM `contest` WHERE start_time < NOW() and 
				end_time < NOW()";
		$result = mysqli_query($conn,$query);
		if(!$result)
		{
			$response["error"] = true;
			$response["errorType"] = "Query not executed";
			return $response;
		}
		else
		{
			if(mysqli_num_rows($result) > 0)
			{
				while($row = mysqli_fetch_array($result))
				{
					$new = $row["cid"];
					array_push($response["cid"],$new);
				}		
			}
		}
		return ($response);
	}

	function getProblems($conn,$temp)
	{
		$size = sizeof($temp);
		$response = array();
		for($i = 0 ; $i < $size ; $i++)
		{
			$cid = $temp[$i];
			$query = "SELECT pid , name , type , score , code , solved FROM `problems` WHERE cid = " . $cid ;
			$result = mysqli_query($conn,$query);
			if(!$result)
			{
				return $response;
			}
			if(mysqli_num_rows($result) > 0)
			{
				while($row = mysqli_fetch_array($result))
				{
					$new = array("pid"=>$row["pid"],"name"=>$row["name"],
						"type"=>$row["type"],"score"=>$row["score"],"code"=>$row["code"]
						,"solved"=>$row["solved"]);
					array_push($response,$new);
				}
			}
		}
		return ($response);
		
	}

	$response = array("error"=>"","errorType"=>"","problems"=>array());
	$conn = createConnection();
	if(!$conn)
	{
		$response["error"] = true;
		$response["errorType"] = "Database not connected";
		return $response;
	}
	$contestId = getContest($conn);
	if($contestId["error"] == true)
	{
		$response["error"] = true;
		$response["errorType"] = $contestId["errorType"];
		return $response;
	}
	$response["problems"] = getProblems($conn,$contestId["cid"]);
	print_r (json_encode($response));
?>