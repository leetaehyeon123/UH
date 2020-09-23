<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nosifer&display=swap" rel="stylesheet">
<link href="resources/CSSs/bar_css/top_bar.css" rel="stylesheet">

</head>
<body>

<!-- top_bar 화면 구성 div가  서로 위치값에 영향을 받지 않는 position: absolute 으로 설정이 되어 있으므로
	같은 크기의 빈 div를 넣어 주어 margin의 역할을 한다. -->
<div class="top_bar_div" ></div>


<!-- top_bar 화면 구성 div -->
<div class="top_bar_div top_bar_container" >


	<!-- 로고  -->
	<div class="logo" >
	legend
	</div>


	<!-- 검색창 구성 div -->
	<div class="search_div">
	<form>
		<select class="search_combo" name="search_mod" >
    		<option value="게시판">게시판</option>
    		<option value="작성자">작성자</option>
    		<option value="제목">제목</option>
		</select>
		<input class="search_input" type="text" placeholder="search on enter">
	</form>
	</div>
	
	
	
</div>	
	
	


</body>
</html>