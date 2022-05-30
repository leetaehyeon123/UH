<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nosifer&display=swap" rel="stylesheet">
<link href="resources/CSSs/bar_css/top_bar.css" rel="stylesheet">
<style type="text/css">

</style>
</head>
<body>

<!-- top_bar 화면 구성 div가  서로 위치값에 영향을 받지 않는 position: absolute 으로 설정이 되어 있으므로
	같은 크기의 빈 div를 넣어 주어 margin의 역할을 한다. -->
<div class="top_bar_div" ></div>


<!-- top_bar 화면 구성 div -->
<div class="top_bar_div top_bar_container" >


	<!-- 로고  -->
	<div class="logo" >
	<span onclick="location.href='main'">legend</span>
	</div>


	<!-- 검색창 구성 div -->
	<div class="search_div">
	<form action="board_main" onsubmit="return isBoard(this);">
		<input type="hidden" name="post_board_name" value="ALL">
		<select id="search_combo" class="search_combo" name="search_mode" >
    		<option value="board">게시판</option>
    		<option value="post_title">제목</option>
    		<option value="post_member_nick">작성자</option>   		
		</select>
		<input id="search_input" name="search_str" class="search_input" type="text" placeholder="search" autocomplete="off" onkeyup="get_search_bar(this)">
	</form>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JSs/bar_js/get_search_bar.js"></script>	
		<div style="width:350px;   margin:5px auto 5px auto;">
				<select class="search_combo" style=" float: left; visibility: hidden;">
					<option value="board">게시판</option>
		    		<option value="post_title">제목</option>
		    		<option value="post_member_nick">작성자</option>
	   			 </select>
					<div class="search_bar" id="search_bar" style="margin-left:4px;width: 263px ;max-height:200px;overflow-y: auto; overflow-x:hidden; float: left;display: none;border: 0.5px solid black;">
					</div>
		
	</div>
	</div>
	
	
	
</div>	
	
	


</body>
</html>