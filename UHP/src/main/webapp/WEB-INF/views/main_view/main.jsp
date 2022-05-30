<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String page_num=request.getParameter("page_num");


%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="resources/JSs/ajax/ajax.js"></script>
	<script type="text/javascript">
	window.onload=ajaxLoad('board_kit?&page_num=null&post_board_name=ALL&search_mode=post_title&search_str=&main=main','#board_kit_container');

	

		function get_board_kit(page_num,post_board_name,search_mode,search_str){
			$.ajax({ 
			type: 'get' , 
			url: 'board_kit?page_num='+page_num+'&post_board_name='+post_board_name+'&search_mode='+search_mode+'&search_str='+search_str+'&main=main' , 
			success: function(data) { 
				$("#board_kit_container").html(data); 
				} 
			}); 
		}

	</script>
</head>

<body>

<!-- top bar  -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JSs/bar_js/get_top_bar.js"></script><div id="top_bar" ></div>

<div class="context_main" style="margin: auto; width: 1260px;" >
<!-- left bar -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JSs/bar_js/get_left_bar.js"></script><div id="left_bar" ></div>
	

<div class="context_container" >
<!-- 
 context-container은 bar들이 자리를 차지고하고 남은 공간.즉 페이지의 내용이 들어갈 공간이다.
 bar를 참조하는 페이지라면 꼭 내용을 class="context-container"로 설정한 div안에 담아준다.
  추가적인 스타일은 left_bar.css에 정의 되어있다. 
  크롬 화면창 크기가 작아질 때 float:left인 div가 내려가는 현상은 min-width 속성값을 조정하여 내용이 짤려 내려가지 않도록 하면 된다.
 -->
	
	
<div id="board_kit_container"></div>



</div>

</div>



</body>
</html>