<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- top bar  -->
<jsp:include page="../bar_view/top_bar.jsp"/>


<div class="context_main" style="margin: auto;width: 1050px;" >
	<!-- left bar -->
	<jsp:include page="../bar_view/left_bar.jsp"/>
	
	
	<div class="context_container" >
	<!-- 
	 context-container은 bar들이 자리를 차지고하고 남은 공간.즉 페이지의 내용이 들어갈 공간이다.
	 bar를 참조하는 페이지라면 꼭 내용을 class="context-container"로 설정한 div안에 담아준다.
	  추가적인 스타일은 left_bar.css에 정의 되어있다. 
	  크롬 화면창 크기가 작아질 때 float:left인 div가 내려가는 현상은 min-width 속성값을 조정하여 내용이 짤려 내려가지 않도록 하면 된다.
	 -->
		<h1>페이지 내용 담는 컨테이너</h1>
		<h1>1메인 내용 1메인 내용1메인 예시 예시</h1>
		<div style="width: 100%; height: 500px;">
			<div style="width: 250px; height: 500px; border: 1px solid green;float: left; margin:5px;"><h1>메인</h1></div>
			<div style="width: 250px; height: 500px; border: 1px solid green; float: left; margin:5px;"><h1>메인</h1></div>
			<div style="width: 250px; height: 500px; border: 1px solid green; float:left; margin:5px;"><h1>메인</h1></div>
		</div>
		<h1>메인</h1>
		<h1>메인</h1>
		<h1>메인</h1>
		<h1>메인</h1>
		<h1>메인</h1>
		<h1>메인</h1>
		<h1>메인</h1>
		<h1>메인</h1>
		<h1>메인</h1>
		<h1>메인</h1>
		<h1>메인</h1>
		<h1>메인</h1>
		<h1>메인</h1>
		<h1>메인</h1>
		<h1>메인</h1>
		<h1>메인</h1>
		<h1>메인</h1>
	
	
	</div>
</div>

</body>
</html>