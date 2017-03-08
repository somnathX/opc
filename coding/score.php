<?php
	include("C:/xampp/htdocs/opc/controller/connection.php");

	function calculateScore($POST)
	{
		$conn = createConnection();
		$query = "SELECT `input`, `output` FROM `problems` WHERE pid = " . $POST['pid'];
		$result = mysqli_query($conn , $query);
		$response = array("score"=>'0');
		if(!$result || mysqli_num_rows($result)==0)
		{
			$response['score'] = 0;
			$response['error'] = 'Wrong Problem ID';
			return $response;
		}
		else
		{
			$row = mysqli_fetch_array($result,MYSQLI_NUM);
			$input = $row[0];
			$output = $row[1];
			$source_code = $POST['source_code'];
			$language_id = $POST['language_id'];
			$time = $POST['time'];
			$request = array("source_code"=>$source_code,"language_id"=>$language_id,
				"input"=>$input,"expected_output"=>$output,"time"=>$time);
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
				$response["error"] = "Sorry Connection Error";
			}
			else
			{
				$result = json_decode($result,true);
				$error = $result["error"];
				if(!empty($error))
				{
					$result["score"] = 0;
					return $result;
				}
				else
				{
					$result["score"] = "20";
					return $result;
				}
			}
			return $response;
		}
	}

	$POST = file_get_contents('php://input');
	$POST = json_decode($POST,true);
	$response = calculateScore($POST);
	$score = $response["score"];
	//$save = postScore($POST,$score);
	echo json_encode($response);
?>