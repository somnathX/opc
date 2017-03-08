<?php
	include("../controller/connection.php");
	function saveEditorial($POST)
	{
		$conn = createConnection();
		$query = "INSERT INTO `editorials`(`pid`, `content`) VALUES (" . $POST['pid'] .
		",'" . mysqli_real_escape_string($conn,$POST['source_code']). "')";
		$response = array("success"=>"");
		$result = mysqli_query($conn,$query);
		if(!$result)
		{
			echo mysqli_error($conn);
			$response["success"] = 0;
		}
		else
			$response["success"] = 1;
		return $response;
	}

	$POST = file_get_contents('php://input');
	$POST = json_decode($POST,true);
	$response = saveEditorial($POST);
	echo json_encode($response);
?>