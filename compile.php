<?php

	class Compile{
		private $token;
		private $error;
		private $input;
		private $output;
		private $language_id;
		private $source_code;
		const $url = "https://api.judge0.com/submissions/";

		function __construct($source_code,$language_id,$input) {
   			$this->source_code = $source_code; //from input
   			$this->language_id = $language_id; //from input
   			$this->input = $input;//from input
		}

		function getToken()
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