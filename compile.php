<?php

	class Compile{
		private $token;
		private $error;
		private $input;
		private $output;
		private $languageId;
		private $sourceCode;
		const url = "https://api.judge0.com/submissions/";

		function __construct($source_code,$language_id,$input,$output,$token,$error) {
   			$this->source_code = $source_code; //from input
   			$this->language_id = $language_id; //from input
   			$this->input = $input;//from input
   			$this->output = $output;
   			$this->token = $token;
   			$this->error = $error;
		}

		function getToken()
		{
			return $this->token;
		}

		function setToken($token)
		{
			$this->token = $token;
		}

		function getInput()
		{
			return $this->input;
		}

		function setInput($input)
		{
			$this->input = $input;
		}

		function getOutput()
		{
			return $this->output;
		}

		function setOutput($output)
		{
			$this->output = $output;
		}

		function getSourceCode()
		{
			return $this->sourceCode ;
		}

		function setSourceCode($sourceCode)
		{
			$this->sourceCode = $sourceCode;
		}


		function getLanguageID()
		{
			return $this->languageId;
		}

		function setLanguageId($languageId)
		{
			$this->languageId = $languageId;
		}

		function getError()
		{
			return $this->error;
		}

		function setError($error)
		{
			$this->error = $error;
		}


		function createToken()
		{
			$data = Array("source_code"=>$source_code,
				"language_id"=>$language_id,"input"=>$input);
			//Call url to get token
		}

		function checkStatus()
		{
			// call url+token to get code status
			//required token
		}

		function checkError()
		{
			//require status of code
			//if no error put result to true and return output
			//else return error in code
		}


	}

?>