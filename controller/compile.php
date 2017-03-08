<?php

	class Compile{
		private $token;
		private $error; //(boolean)
		private $expectedOutput;
		private $errorType;
		private $input;
		private $output;
		private $languageId;
		private $sourceCode;
		private $result; //array of result
		private $time;
		private $submission;
		const URL = "https://api.judge0.com/submissions/";

		function __construct($sourceCode,$languageId,$input,$output,$expectedOutput,
			$token,$error,$errorType , $time , $submission) {
   			$this->sourceCode = $sourceCode; //from input
   			$this->languageId = $languageId; //from input
   			$this->input = $input;//from input
   			$this->output = $output;
   			$this->token = $token;
   			$this->error = $error;
   			$this->errorType = $errorType;
   			$this->expectedOutput = $expectedOutput;
   			$this->time = $time;
   			$this->submission = $submission;
		}

		function getToken(){
			return $this->token;
		}

		function setToken($token){
			$this->token = $token;
		}

		function getSubmission(){
			return $this->submission;
		}

		function setSubmission($submission)
		{
			$this->submission = $submission;
		}

		function getTime()
		{
			return $this->time;
		}

		function setTime($time)
		{
			$this->time = $time;
		}

		function getInput(){
			return $this->input;
		}

		function setInput($input){
			$this->input = $input;
		}

		function getOutput(){
			return $this->output;
		}

		function setOutput($output){
			$this->output = $output;
		}

		function getSourceCode(){
			return $this->sourceCode ;
		}

		function setSourceCode($sourceCode){
			$this->sourceCode = $sourceCode;
		}


		function getlanguageID(){
			return $this->languageId;
		}

		function setLanguageId($languageId){
			$this->languageId = $languageId;
		}

		function getError(){
			return $this->error;
		}

		function setError($error){
			$this->error = $error;
		}

		function getErrorType(){
			return $this->errorType;
		}

		function setErrorType($errorType){
			$this->errorType = $errorType;
		}

		function setExpectedOutput($expectedOutput){
			$this->expectedOutput = $expectedOutput;
		}

		function getExpectedOutput(){
			return $this->expectedOutput ;
		}

		function setResult($result){
			$this->result = $result;
		}

		function getResult(){
			return $this->result;
		}


		function createToken()
		{
			$data = Array("source_code"=>$this->sourceCode,
				"language_id"=>$this->languageId,"input"=>$this->input);
			if(strlen($this->expectedOutput))
				$data['expected_output'] = $this->expectedOutput;
			$data['wall_time_limit'] = $this->time;
			//print_r($data);
			$data = json_encode($data);
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
			$context  = stream_context_create($options);
			$result = file_get_contents(self::URL,false, $context);
			if(!$result)
			{
				$this->setError(true);
				$this->setErrorType("Wrong Input");
			}
			else
			{
				$result = json_decode($result,true);
				$this->setToken($result['token']);
			}
		}

		function createStatus()
		{
			if($this->getError()==true)
			{
					echo "Contains Error";
					return;
			}
			else
			{
				$token = $this->getToken();
				$newurl = (self::URL) . $token;
				$options = array(
  					'http' => array(
    				'header'  => array(
						'Accept : application/json',
						),
    				'method'  => 'GET',
  					),
				);
				$context  = stream_context_create($options);
				$response = file_get_contents($newurl, false, $context);
				$response = json_decode($response,true);
				if($response['status']['id'] <= 2)
				{
					$this->createStatus();
				}
				else
				{
					$this->setResult($response);
				}
			}
		}

		function createResult()
		{
			$response = $this->getResult();
			if($response['status']['id'] == 3)
			{
				$this->setError(false);
				$this->setOutput($response['stdout']);
				$this->setTime($response['wall_time_limit']);
				$this->setSubmission($response['created_at']);
			}
			else if($response['status']['id'] == 4)
			{
				$this->setError(true);
				$this->setOutput($response['stdout']);
				$this->setErrorType($response['status']['description']);
				$this->setTime($response['wall_time_limit']);
				$this->setSubmission($response['created_at']);
			}
			else
			{
				$this->setError(true);
				$this->setTime($response['wall_time_limit']);
				$error = $response['status']['description'] . $response['stderr'];
				$this->setErrorType($error);
				$this->setSubmission($response['created_at']);
			}
		}

	}
?>