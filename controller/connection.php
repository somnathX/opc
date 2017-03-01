<?php
	
	function createConnection()
	{
		$server = "localhost";
		$user = "root";
		$pass = "";
		$db = "njrcode";
		$conn = mysqli_connect($server , $user ,$pass , $db);
		return $conn;
	}

	function closeConnection($conn)
	{
		mysqli_close($conn);
	}
?>
