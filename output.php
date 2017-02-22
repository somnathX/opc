<?php
	include("compile.php");
	$POST = file_get_contents('php://input');
	$POST = json_decode($POST,true);
	$flag = 0;
	if(isset($POST['source_code']))
		$source_code = $POST['source_code'];
	else
	{
		echo "source_code not exist";
		return ;
	}
	if(isset($POST['language_id']))
		$language_id = $POST['language_id'];
	else
	{
		echo "Language ID not exist";
		return ;
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