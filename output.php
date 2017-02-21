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
		$url = "https://api.judge0.com/submissions/" . $token;
		//print_r ($url);
		$options = array(
  			'http' => array(
    		'header'  => array(
				'Accept : application/json',
				),
    		'method'  => 'GET',
  			),
		);
		$context  = stream_context_create($options);
		$result = file_get_contents($url, false, $context);
		$result = json_decode($result,true);
		if($result['status']['id'] <= 2)
		{
			$result = checkStatus($token);
			//$result = json_decode($result,true);
			//echo $result;
		}
		//print_r ($result);
		//return $result;
	}

	function checkOutput($result)
	{
		if(strcmp($result['status']['id'],"3"))
			return $result['stdout'];
	}

	$POST = file_get_contents('php://input');
	$token = getToken($POST);
	//echo $token;
	$status = checkStatus($token);
	
?>