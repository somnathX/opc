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
	$send=array();
	if($comp->getError()==true)
	{
		$send = array("error"=>$comp->getErrorType());
		echo json_encode($send);
		return;
	}
	$comp->checkStatus();
	if($comp->getError()==true)
	{
		$send = array("error"=>$comp->getErrorType());
		echo json_encode($send);
		return ;
	}
	else
	{
		$send = array("output"=>$comp->getOutput());
		echo json_encode($send);
		return ;
	}
?>