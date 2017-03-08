<?php
	include("C:/xampp/htdocs/opc/controller/connection.php");

	function saveuser($POST)
	{
		$conn = createConnection();
		$query = "Insert into contest_user (cid , user_id) VALUES (" . $POST['cid'] .
		" , " . $POST['user_id'] . ")";
		$result = mysqli_query($conn,$query);
		$response = array("success"=>"0");
		if(!$result)
		{
				$response["success"] = 0;
		}
		else
		{
				$response["success"] = 1;
		}
		return $response;
	}
	$POST = file_get_contents('php://input');
	$POST = json_decode($POST,true);
	$response = saveuser($POST);
	echo json_encode($response);
?>