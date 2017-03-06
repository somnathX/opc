<?php
	include("compile.php");
	$POST = file_get_contents('php://input');
	$POST = json_decode($POST,true);
	$flag = 0;
	if(isset($POST['source_code']))
		$source_code = $POST['source_code'];
	else
	{
		$send =  array("error"=>"source_code not exist");
		echo json_encode($send);
		return;
	}
	if(isset($POST['language_id']))
		$language_id = $POST['language_id'];
	else
	{
		$send =  array("error"=>"language_id not exist");
		echo json_encode($send);
		return ;
	}
	$input = "";
	if(isset($POST['input']))
		$input = $POST['input'];
	$expected_output = "";
	if(isset($POST['expected_output']))
		$expected_output = $POST['expected_output'];
	$time = 10;
	if(isset($POST['time']))
		$time= $POST['time'];
	$output = null;
	$token = null;
	$error = false;
	$errorType = "";
	$submission = 0;
	$comp = new Compile($source_code, $language_id, $input ,$output ,$expected_output,$token ,$error, $errorType , $time , $submission);
	$comp->createToken();
	$send=array();
	if($comp->getError()==true)
	{
		$send = array("error"=>$comp->getErrorType(),"output"=>$comp->getOutput(),
			"time"=>$comp->getTime() , "submission"=>$comp->getSubmission());
		echo json_encode($send);
		return;
	}
	$comp->createStatus();
	if($comp->getError()==true)
	{
		$send = array("error"=>$comp->getErrorType(),"output"=>$comp->getOutput(),
				"time"=>$comp->getTime() ,"submission"=>$comp->getSubmission());
		echo json_encode($send);
		return ;
	}
	$comp->createResult();
	if($comp->getError()==true)
	{
		$send = array("error"=>$comp->getErrorType(),"output"=>$comp->getOutput(),
				"time"=>$comp->getTime() ,"submission"=>$comp->getSubmission());
		echo json_encode($send);
		return ;
	}
	else
	{
		$send = array("error"=>$comp->getErrorType(),"output"=>$comp->getOutput(),
			"time"=>$comp->getTime() ,"submission"=>$comp->getSubmission());
		echo json_encode($send);
		return ;
	}
?>