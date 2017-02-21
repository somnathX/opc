<?php
	function getToken($POST)
	{	
		//$string = json_encode($POST);
		$url = "https://api.judge0.com/submissions/";
		$options = array(
  			'http' => array(
  			'user_agent' => 'custom user agent string',
    		'header'  => array(
    			'Content-Type: application/json',
				'Accept : application/json',
				),
    		'method'  => 'POST',
    		'content' => $POST,
  			),
		);
		$context  = stream_context_create($options);
		$result = file_get_contents($url,false, $context);
		if(!$result)
			echo "Error";
		else
		{
			$result = json_decode($result,true);
			return $result['token'];
		}
	}

	function checkStatus($token)
	{
		
	}

	function checkOutput($result)
	{
		if($result['status']['id'] == 3)
			return $result['stdout'];
		else
			return "Compilation error";
	}

	$POST = file_get_contents('php://input');
	$token = getToken($POST);
	//echo $token;
	$status = checkStatus($token);
	$output = checkOutput($status);
	echo $output;
?>