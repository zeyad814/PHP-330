<?php 

define('DB_HOST','localhost');
define('DB_USER','root');
define('DB_PASS','');
define('DB_NAME','pms_330');


try{

	$conn  = mysqli_connect(DB_HOST,DB_USER,DB_PASS,DB_NAME);

}catch(Exception $e){
	
	file_put_contents('../log.log',$e->getMessage()."\n",FILE_APPEND);
	header('location:../mentainance.php');

}

