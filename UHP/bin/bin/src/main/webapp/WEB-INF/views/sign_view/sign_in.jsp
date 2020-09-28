<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
</script>
<style>
	.button{
	background-color:#6CFFFF;
	color: white;
	}
	.body{
	text-align:center;
	}
	
</style>
<body class="body" bgcolor="">
	<div style="width:450px; margin: 0 auto;">
	<p>　</p>
	<h1 style="font-family:궁서 ">로그인</h1>
	<p>　</p>

    <div style="float: left">
    
    <input type="text" name="id" placeholder="ID" style="width:300px;height:30px;font-size:30px; font-family:Comic Sans MS;">
    <br><br>
    <input type="password" name="password" placeholder="password" style="width:300px;height:30px;font-size:30px;font-family:Comic Sans MS;">
    </div>
    <input type="button" class="button" name="login button" value="로그인" style="width:90px;height:90px; font-size:25px; "><br>
    <pre>
    <a href="" style =" text-decoration:none;color: blue; font-family:Comic Sans MS;">ID찾기 </a><a href="" style =" text-decoration:none;color: blue; font-family:Comic Sans MS;">비밀번호 찾기 </a><a href="http://localhost:9101/uhBoard/singup" style =" text-decoration:none;color: blue; font-family:Comic Sans MS;">회원가입 </a>
    </pre>
    <br>
    <img  src="resources/imgs/login_img/kakao.png" width="400" height="80" onclick="kakaoLogin()"><br>
	<img  src="resources/imgs/login_img/google.png" width="400" height="80" onclick="googleLogin()"><br>
	<img  src="resources/imgs/login_img/naver.png" width="400" height="80" onclick="naverLogin()"><br>
	<img  src="resources/imgs/login_img/facebook.png" width="400" height="80" onclick="facebookLogin()">
	</div>



</body>
</html>