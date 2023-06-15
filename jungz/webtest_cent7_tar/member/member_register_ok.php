<?php
		//error_reporting(E_ALL);
		//ini_set("display_errors", 1);

		session_start();
		require("../dbconn.php");

		$id=$_POST["user_id"];
		$name=$_POST["name"];
		$pw1=$_POST["user_pw1"];
		$pw2=$_POST["user_pw2"];
		$age=$_POST["age"];
		$nick=$_POST["nick"];
		$email=$_POST["email"];

		if(!$nick) $nick=$name;
		if(!$age) $age=0;

		$strSQL = "select u_id from member where u_id = '".$id."'";
		#$rs = mysql_query($strSQL,$conn);
		$rs = mysqli_query($conn,$strSQL);
		//$rs_arr = mysql_fetch_array($rs);
		$rs_arr = mysqli_fetch_array($rs);

		if($rs_arr){
			echo "<script>
				alert('중복 ID!! 회원가입 실패!!');
				history.back();
			</script>";
		}else{
			$strSQL = "insert into member set u_id='$id', u_pass='$pw1', u_name='$name', nickname='$nick', age=$age, email='$email', reg_date=now()";
			#mysql_query($strSQL,$conn);
			mysqli_query($conn,$strSQL);
		//$rs_arr = mysql_fetch_array($rs);
		$rs_arr = mysqli_fetch_array($rs);
			echo "<script>
				alert('회원 가입을 축하드립니다!!');
				location.replace('../index.php');
			</script>";
		}
		mysql_close($conn);

?>
