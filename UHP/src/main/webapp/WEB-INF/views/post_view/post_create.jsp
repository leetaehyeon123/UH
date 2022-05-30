<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%
 	String post_board_name=request.getParameter("post_board_name");
	String page_num=request.getParameter("page_num");
	String search_mode=request.getParameter("search_mode");
	String search_str=request.getParameter("search_str");
	 String board_category=request.getParameter("car");
    %>   
    
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>board</title>

<script>

	$(document).on('click', '#btnSave', function(e){

		e.preventDefault();

		

		$("#form").submit();

	});

	

	$(document).on('click', '#btnList', function(e){

		e.preventDefault();

		

		location.href="${pageContext.request.contextPath}/board/getBoardList";

	});

</script>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>

body {

  padding-top: 70px;

  padding-bottom: 30px;

}
.board{
margin-top:3px;
	
}
.NAME{
width:200px; 
height:30px
}
.TITLE{
width:800px; 
height:30px;
}
.Text{
	width:800px;
 	height:600px;
}
.Btn1{
	width: 70px; 
	
	}
		.board_name_div{		/* board_main 에서 사용 , post_main에서 미사용 */
			font-size: 43px;	
			font-family: 'Do Hyeon', sans-serif;	
			padding: 0 0 15px 0;
			margin-left: 20px;
		}
	
</style>

<script type="text/javascript">

	
	function set_br(thiss){
		var text=thiss.post_con.value;
		thiss.post_con.value=text.replace(/(\n|\r\n)/g, '<br>');
	}
</script>
</head>

<body>
<!-- top bar  -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JSs/bar_js/get_top_bar.js"></script><div id="top_bar" ></div>

<div class="context_main" style="margin: auto;width: 1050px;" >

	<!-- left bar -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JSs/bar_js/get_left_bar.js"></script><div id="left_bar" ></div>
	
	
	<div class="context_container" >
	
	<div class="board_name_div"><!-- style은 board_kit.css에 정의  -->
			<span onclick="location.href='board_main?post_board_name=<%= post_board_name%>'" style="cursor: pointer;"><%= post_board_name%> 게시판</span>
			<span style="font-size: 15px;"> <%=board_category %> > <%= post_board_name %> </span>
		</div>
		
	<form action="insert.do" onsubmit="set_br(this)">
		<input type="hidden" name=post_board_name value='<%= post_board_name%>'>
		<input type="hidden" name=page_num value='<%=page_num%>'>
		<input type="hidden" name=search_mode value='<%=search_mode%>'>
		<input type="hidden" name=search_str value='<%=search_str%>'>
			<div class = "board">
		        <fieldset>
						
					
						<div>
							제목<br>
							<input name="post_title" type="text" class="TITLE" placeholder="제목을 입력해 주세요">
						</div>
						
						<div>
							내용<br>
							<textarea name="post_con" class="Text" placeholder="내용을 입력해 주세요" ></textarea>
						</div>			
		      </fieldset>
		  </div>

			<div style="text-align:center">
				<button type="submit" class="Btn1" >글작성</button>
				<button type="button" class="Btn1" >취소</button>
			</div>
			
			</form>
</body>
</html>



