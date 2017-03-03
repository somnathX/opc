<?php
	include("C:/xampp/htdocs/opc/controller/connection.php");

	function calculateScore($POST)
	{
		$conn = createConnection();
		$query = "SELECT `input`, `output` FROM `problems` WHERE pid = " . $POST['pid'];
		$result = mysqli_query($conn , $query);
		$response = array("score"=>'0');
		if(!$result)
		{
			$response['score'] = 0;
			return ;
		}
		else
		{
			$row = mysqli_fetch_array($result,MYSQLI_NUM);
			$input = $row[0];
			$output = $row[1];
			echo $input;
			$source_code = $POST['source_code'];
			$language_id = $POST['language_id'];
			$request = array("source_code"=>$source_code,"language_id"=>$language_id,
				"input"=>$input,"expected_output"=>$output);
			$request = json_encode($request);
			//echo $request;
			$options = array(
  				'http' => array(
  					'user_agent' => 'custom user agent string',
    				'header'  => array(
    					'Content-Type: application/json',
						'Accept : application/json',
					),
    				'method'  => 'POST',
    				'content' => $request,
  				),
			);
			$url = "http://localhost/opc/controller/output.php";
			$context  = stream_context_create($options);
			$result = file_get_contents($url,false, $context);
			if(!$result)
			{
				$response["score"] = 0;

			}
			else
			{
				$result = json_decode($result,true);
				$error = $result["error"];
				if(!empty($error))
				{
					$response["error"] = "Wrong Answer";
					$response["output"] = $result["output"];
				}
				else
				{
					$response["score"] = "20";
					$response["output"] = $result["output"];
				}
			}
			return $response;
		}
	}

	function postScore($POST , $score)
	{
		$conn = createConnection();
		$query = "INSERT INTO `contest_users`(`cid`, `user_id`, `score`) VALUES (" 
		. $POST['cid'] . "," .$POST['user_id'] . "," . $score . ")";
		$result = mysqli_query($conn,$query);
		$response = array("success"=>"0");
		if(!$result)
		{
			return $response;
		}
		else
		{
			$response["success"] = 1;
		}
		return $response;
	}

	$POST = file_get_contents('php://input');
	$POST = json_decode($POST,true);
	$response = calculateScore($POST);
	$score = $response["score"];
	$response = postScore($POST,$score);
	echo json_encode($response);
?>