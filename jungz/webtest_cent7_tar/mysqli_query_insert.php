<?php
//filename :  mysqli_query.php
//테이블에 값을 입력하고 싶다 

//DB연결 > DB선택 
$connect = mysqli_connect("localhost","root","P@ssw0rd","WebTest");
//$db_conn = mysqli_select_db($connect,"WebTest");


//테이블에 데이터를 입력후 입력 성공 실패 여부를 확인 
//$sql ="create table client(name char(12),id char(12) not null,email varchar(40),sex varchar(4),point int,grade char(10));
$sql="insert into client values('김영재','test01','test01@kh00.kh','fe',100,'ACE');";
$result = mysqli_query($connect,$sql);

//실행결과의 성공/실패 여부에 따라서
if(!$result)
{
    echo "데이터입력실패";
}
else
{
    echo "데이터입력성공";
}

//DB연결 종료
mysql_close($connect);

?>
