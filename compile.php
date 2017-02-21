<?php

	class Compile{
		private $token;
		private $error; //(boolean)
		private $errorType;
		private $input;
		private $output;
		private $languageId;
		private $sourceCode;
		const URL = "https://api.judge0.com/submissions/";

		function __construct($sourceCode,$languageId,$input,$output,$token,$error,
			$errorType) {
   			$this->sourceCode = $sourceCode; //from input
   			$this->languageId = $languageId; //from input
   			$this->input = $input;//from input
   			$this->output = $output;
   			$this->token = $token;
   			$this->error = $error;
   			$this->errorType = $errorType;
		}

		function getToken(){
			return $this->token;
		}

		function setToken($token){
			$this->token = $token;
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


		function createToken()
		{
			$data = Array("source_code"=>$this->sourceCode,
				"language_id"=>$this->languageId,"input"=>$this->input);
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

		function checkStatus()
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
				$result = file_get_contents($newurl, false, $context);
				$result = json_decode($result,true);
				if($result['status']['id'] <= 2)
				{
					$this->checkStatus();
				}
				else if($result['status']['id'] == 3)
				{
 					$this->setOutput($result['stdout']);
				}
				else
				{
					$this->setError(true);
					$this->setErrorType($result['status']['description']);
				}
			}
		}

		function checkError()
		{
			//require status of code
			//if no error put result to true and return output
			//else return error in code
		}


	}

	$POST = file_get_contents('php://input');
	$POST = json_decode($POST,true);
	$flag = 0;
	if(isset($POST['source_code']))
		$source_code = $POST['source_code'];
	else
	{
		echo "source_code not exist";
		return "source_code not exist";
	}
	if(isset($POST['language_id']))
		$language_id = $POST['language_id'];
	else
	{
		echo "Language ID not exist"
		return "Language ID not exist";
	}
	$input = "";
	if(isset($POST['input']))
		$input = $POST['input'];
	$output = null;
	$token = null;
	$error = false;
	$errorType = null;
	$comp = new Compile($source_code, $language_id, $input ,$output , $token ,
		$error, $errorType);
	$comp->createToken();
	if($comp->getError()==true)
	{
		return $comp->getErrorType();
	}
	$comp->checkStatus();
	if($comp->getError()==true)
	{
		echo $comp->getErrorType();
		return $comp->getErrorType();
	}
	else
		return $comp->getOutput();
?>