<?php
   $con=mysqli_connect("localhost", "root", "P@ssw0rd", "") or die("MariaDB 접속 실패 !!");
         
   $sql="CREATE DATABASE phpDB";	// 변수$sql에 phpDB 생성 쿼리 입력
   $ret = mysqli_query($con, $sql);	// 변수$ret에 쿼리 실행 내장함수로 ($con, $sql) 실행
   
   if($ret) {	// mysqli_query가 성공적으로 실행되면 Ture 값이 반환됨
	   echo "sqlDB가 성공적으로 생성됨.";
   }
   else {
	   echo "sqlDB 생성 실패!!!"."<br>";
	   echo "실패 원인 :".mysqli_error($con);
   }
   
   mysqli_close($con);
?>
