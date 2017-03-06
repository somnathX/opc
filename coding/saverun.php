<?php
	include("C:/xampp/htdocs/opc/controller/connection.php");
	include("C:/xampp/htdocs/opc/controller/languages.php");
	
	function submitRun($data,$result)
	{
		$conn = createConnection();
		$language = mysqli_real_escape_string($conn,getLanguage($data["language_id"]));
		$response = array("success"=>"");
		$time = mysqli_real_escape_string($conn,$result['time']);
		$submit = mysqli_real_escape_string($conn,$result['submission']);
		$score = mysqli_real_escape_string($conn,$result['score']);
		$query = "INSERT INTO `runs`(`pid`, `user_id`, `language`, `time`, `result`, `access`, `submittime`) VALUES (" .$data["pid"] . "," . $data["user_id"] . 
		    ",'" . $language . "','" .$time . "','" . $score . 
		    "', 'public','".$submit. "')"; 
		$result = mysqli_query($conn,$query);
		if(!$result)
		{
			echo "In Run";
			$response["success"] = 0;
		}
		else
			$response["success"] = 1;
		closeConnection($conn);
		return $response;
	}

	function submitSubCode($data,$result)
	{
		$error = $result['error'];
		$output = $result['output'];
		$response = array("success"=>"");
		$query = "select rid from runs where pid = " .$data["pid"] . " and user_id = ".
		$data["user_id"] . " group by rid order by rid desc";
		$conn = createConnection();
		$result = mysqli_query($conn,$query);
		if(!$result)
		{
			echo "In Submit First";
			$response["success"] = 0;
		}
		else
		{
			$row = mysqli_fetch_array($result,MYSQLI_NUM);
			$rid = $row[0];
			$source_code = mysqli_real_escape_string($conn,$data['source_code']);
			$error = mysqli_escape_string($conn,$error);
			$output = mysqli_escape_string($conn,$output);
			$query = "INSERT INTO `subs_code`(`rid`, `name`, `code`, `error`, `output`) VALUES (". $rid . ",'Main','" . $source_code . "','" .$error. "','" 
			. $output . "')";
			$result = mysqli_query($conn,$query);
			if(!$result)
			{
				echo "Not Valid";
				$response["success"] = 0;
			}
			else
				$response["success"] = 1;	
		}
		closeConnection($conn);
		return $response;
	}

	function getOutput($data)
	{
		$options = array(
  			'http' => array(
  			'user_agent' => 'custom user agent string',
    		'header'  => array(
    			'Content-Type: application/json',
				'Accept : application/json',
				),
    			'method'  => 'POST',
    			'content' => $data,
  			),
		);
		$url = "http://localhost/opc/coding/score.php";
		$context  = stream_context_create($options);
		$result = file_get_contents($url,false, $context);
		if(!$result)
		{
			return array("gerror"=>"please enter true data");
		}
		else
		{
			return json_decode($result,true);
		}
	}

	function postScore($POST , $score)
	{
		$conn = createConnection();
		$query = "Select max(result) from runs where pid = " .$POST['pid'] ."and user_id = ". $POST['user_id'] ."group by result , submittime order by submittime desc";
		/*$query = "INSERT INTO `contest_users`(`cid`, `user_id`, `score`) VALUES (" 
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
		return $response;*/
	}

	$POST = file_get_contents('php://input');
	$result = getOutput($POST);
	if(isset($result["gerror"]))
	{
		return json_encode(array("successful"=>0));
	}
	$data = json_decode($POST,true);
	$response = submitRun($data,$result);
	if($response["success"] == 0)
		echo json_encode($response);
	$response =submitSubCode($data,$result);
	echo json_encode($result);
?>