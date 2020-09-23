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
	background-color: #36FFFF;
	color: white;
	}
	.body{
	text-align:center;
	}
	
</style>
<body class="body">
	<p>　</p>
	<p>　</p>
	<p>　</p>
	<p>　</p>

    <input type="text" name="id" style="width:300px;height:25px;font-size:30px ;" placeholder="아이디">
    <p>비밀번호</p>
    <input type="password" name="password" style="width:300px;height:25px;font-size:30px;">
    <p>　</p>
    <button class="button" name="login button" style="width:300px;height:40px; font-size:25px;">로그인</button><br>
    <pre><a href="">ID찾기 </a><a href="">비밀번호 찾기 </a><a href="http://localhost:9101/uhBoard/singup">회원가입 </a></pre><br>
    <img  src="resources/imgs/login_img/kakao.png" width="400" height="60" onclick="kakaoLogin()"><br>
	<img  src="resources/imgs/login_img/google.png" width="400" height="60" onclick="googleLogin()"><br>
	<img  src="resources/imgs/login_img/naver.png" width="400" height="60" onclick="naverLogin()"><br>
	<img  src="resources/imgs/login_img/facebook.png" width="400" height="60" onclick="facebookLogin()">



</body>
</html>