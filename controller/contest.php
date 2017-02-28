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

	function fetchProblem($conn,$cid)
	{
		$query = "SELECT pid FROM `problems` WHERE cid = " . $cid ;
		$result = mysqli_query($conn,$query);
		$response = array("error"=>"" , "total"=>"" , "problems"=>array());
		if(!$result)
		{
			$response["error"] = true;
			$response["errorType"] = "Query not executed";
		}
		else
		{
			$count = 0;
			if(mysqli_num_rows($result) > 0)
			{
				while($row = mysqli_fetch_array($result))
				{
					$count += 1;
					$pid = $row["pid"];
					array_push($response["problems"], $pid);
				}
				$response["total"] = $count;
			}
		}
		return $response;
	}

	

	function getContest($conn)
	{
		$response = array("error"=>"" ,"errorType"=>"","present"=>array() , 
		"past"=>array() , "future"=>array());
		$query = "select * from `contest` ";
		$result = mysqli_query($conn,$query);
		if(!$result)
		{
			$response["error"] = 1;
			$response["errorType"] = "Query not executed";
		}
		else
		{
			if(mysqli_num_rows($result) > 0)
			{
				date_default_timezone_set('Asia/Calcutta'); 
				while($row = mysqli_fetch_array($result))
				{
					$start = date_create($row['start_time']);
					$end = date_create($row['end_time']);
					$date = new DateTime("now");
					$problem = fetchproblem($conn,$row["cid"]);
				//echo $row['start_time'] . "    " . $row['end_time'] . " ";
					if($start < $date)
					{
						if($end < $date)
						{
							$new = array("id"=>$row['cid'],
							"name"=>$row['name'] , "description"=>$row['description'] ,
							"start_time"=>$row["start_time"] , "problem"=>$problem);
							array_push($response["past"] , $new);
						}
						else
						{
							$new = array("id"=>$row['cid'],
							"name"=>$row['name'] , "description"=>$row['description'] ,
							"start_time"=>$row["start_time"] , "problem"=>$problem);
							array_push($response["present"] , $new);
						}
					}
					else
					{	
						$new = array("id"=>$row['cid'],
						"name"=>$row['name'] , "description"=>$row['description'] ,
						"start_time"=>$row["start_time"] , "problem"=>$problem);
						array_push($response["future"] , $new);
					}
				}		
				//print_r (json_encode($response));	
			}
		}
		return $response;
	}

	$response = array("error"=>"" ,"errorType"=>"","present"=>array() , 
		"past"=>array() , "future"=>array());
	$conn = createConnection();
	if(!$conn)
	{
		$response["error"] = 1;
		$response["errorType"] = "Database not connected";
		return ;
	}
	$response = getContest($conn);
	print_r (json_encode($response));
?>