<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function kakaoLogin(){
	location.href='<%=request.getAttribute("kakaoLoginUrl")%>'
}
function googleLogin(){
	location.href='<%=request.getAttribute("googleLoginUrl")%>'
}
function naverLogin(){
	location.href='<%=request.getAttribute("naverLoginUrl")%>'
}
function facebookLogin(){
	location.href='<%=request.getAttribute("faceLoginUrl")%>'
}
</script>
<style>
	.button{
	color: black;
	}
	.body{
	text-align:center;
	}
	.find_up{
		padding: 30px;
	}
	.line_border{
		width: 300px;
		border: 1px solid #dae1e6;
		margin: 10px auto;
	}
	
</style>
<body class="body" bgcolor="">
<!-- top bar  -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JSs/bar_js/get_top_bar.js"></script><div id="top_bar" ></div>

<div class="context_main" style="margin: auto; width: 600px;" >

	<div style="width:550px; margin: 30px auto; padding:60px 10px;border: 1px solid #dae1e6;">	


 
<form action="sign_in.do">
    <input type="text" name="id" placeholder="ID" style="width:300px;height:30px;font-size:30px; font-family:Comic Sans MS;margin-bottom: 10px;">
    <br>
    <input type="password" name="password" placeholder="password" style="width:300px;;height:30px;font-size:30px;font-family:Comic Sans MS;margin-bottom: 10px;">

    <input type="submit" class="button"  value="로그인" style="width:300px; font-size:25px;font-family:Comic Sans MS; "><br>
</form> 

   	<div class="find_up">
    <a href='find_id' style =" text-decoration:none;color: blue; font-family:Comic Sans MS;">ID,PW찾기 </a>
    |
    <a href="sign_agree" style =" text-decoration:none;color: blue; font-family:Comic Sans MS;">회원가입 </a>
 	</div>
 	
    <br>
    <div class="line_border"></div>
    <img  src="resources/imgs/login_img/kakao.png" width="400" height="80" onclick="kakaoLogin()"><br>
	<img  src="resources/imgs/login_img/google.png" width="400" height="80" onclick="googleLogin()"><br>
	<img  src="resources/imgs/login_img/naver.png" width="400" height="80" onclick="naverLogin()"><br>
	<img  src="resources/imgs/login_img/facebook.png" width="400" height="80" onclick="facebookLogin()">
	</div>
</div>


</body>
</html>