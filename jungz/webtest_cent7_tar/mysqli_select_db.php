<?php

$connect= mysqli_connect("localhost","root","P@ssw0rd","WebTest");
$db_conn = mysqli_select_db($connect,"WebTest");

if(!$db_conn)  {
	  echo "데이터베이스 선택 실패";
	  exit;}
else	{
	  echo "WebTest 데이터베이스 선택 성공";}
?>
