<?php
	include("C:/xampp/htdocs/opc/controller/connection.php");
	include("C:/xampp/htdocs/opc/controller/languages.php");
	function submitRun($data,$result)
	{
		$language = getLanguage($data["language_id"]);
		$response = array("success"=>"");
		$dt = new DateTime();
		$submit = $dt->format('Y-m-d H:i:s');
		$conn = createConnection();
		$query = "INSERT INTO `runs`(`pid`, `user_id`, `language`, `time`, `result`, `access`, `submittime`) VALUES (" .$data["pid"] . "," . $data["user_id"] . 
		    ",'" . $language . "','" .$data["time"] . "','" . $data["result"] . 
		    "', 'public' , '".$submit. "')"; 
		$result = mysqli_query($conn,$query);
		if(!$result)
			$response["success"] = 0;
		else
			$response["success"] = 1;
		closeConnection($conn);
		return $response;
	}

	function submitSubCode($data,$result)
	{
		$error = $result->error;
		$output = $result->output;
		$response = array("successful"=>"");
		$query = "select rid from runs where pid = " .$data["pid"] . " and user_id = ".
		$data["user_id"] . " group by rid order by rid desc";
		$conn = createConnection();
		$result = mysqli_query($conn,$query);
		if(!$result)
			$response["success"] = 0;
		else
		{
			$row = mysqli_fetch_array($result,MYSQLI_NUM);
			$rid = $row[0];
			$query = "INSERT INTO `subs_code`(`rid`, `name`, `code`, `error`, `output`) VALUES (". $rid . ",'Main','" . $data["source_code"] . "','" .$error. 
				"','" . $output . "')";
			$result = mysqli_query($conn,$query);
			if(!$result)
				$response["success"] = 0;
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
		$url = "http://localhost/opc/controller/output.php";
		$context  = stream_context_create($options);
		$result = file_get_contents($url,false, $context);
		if(!$result)
		{
			return array("error"=>"please enter true data");
		}
		else
		{
			return json_decode($result);
		}
	}

	$POST = file_get_contents('php://input');
	$result = getOutput($POST);
	$data = json_decode($POST,true);
	$response = submitRun($data,$result);
	if($response["success"] == 0)
		echo json_encode($response);
	$response =submitSubCode($data,$result);
	echo json_encode($response);
?>