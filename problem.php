<?php
	
	class Problem{
		private $pid;
		private $pname;
		private $statement;
		private $error; //boolean
		private $errorType;
		private $con;
		const SERVER = "localhost";
		const USER = "root";
		const PASS = "";
		const DB = "njrcode";

		function __construct()
		{
			$pid = "";
			$pname = "";
			$statement = "";
		}

		function getPid()
		{
			return $this->pid;
		}

		function setPid($pid)
		{
			$this->pid = $pid;
		}

		function getName()
		{
			return $this->pname;
		}

		function setName($pname)
		{
			$this->pname = $pname;
		}

		function getStatement()
		{
			return $this->statement;
		}

		function setStatement($statement)
		{
			$this->statement = $statement;
		}


		function getError()
		{
			return $this->error;
		}

		function setError($error)
		{
			$this->error = $error;
		}

		function getErrorType()
		{
			return $this->errorType;
		}

		function setErrorType($errorType)
		{
			$this->errorType = $errorType;
		}

		function getConnection()
		{
			return $this->conn;
		}

		function setConnection($conn)
		{
			$this->conn = $conn;
		}

		function createConnection()
		{
			$conn = mysqli_connect(self::SERVER, self::USER, self::PASS,self::DB);
			if (!$conn) {
    			$this->setError("Not Connected Try Again");
    			$this->setErrorType(true);
			} 
			else
			{
				//echo "Connected";
				$this->setConnection($conn);
			}
		}

		function createStatement()
		{
			$conn = $this->getConnection();
			$query = "SELECT `statement` FROM `problems` WHERE pid = " .$this->pid ;
			$result = mysqli_query($conn, $query);
			if (mysqli_num_rows($result) > 0) {
   			 	$row = mysqli_fetch_assoc($result);
   			 	$data = $row["statement"];
   			 	//echo $data;
        		$this->setStatement($data);
        		//echo $this->getStatement();
			} 	
			else
			{
				echo "In Statement";
				$this->setErrorType(true);
				$this->setError("Id Not Found");
			}
		}

		function closeConnection()
		{
			$con = $this->getConnection();
			mysqli_close($conn);
		}

	}
?>
