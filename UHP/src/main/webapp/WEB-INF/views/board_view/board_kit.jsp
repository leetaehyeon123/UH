<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
	

		.board_container{
			width: 900px;
			margin-left: 100px;
		}
		.board_name_div{
			border:1px solid blue;			
			font-size: 40px;			
		}
		.board_div{
			border:1px solid blue;	
			
		}
		.board_post_div{
			border:1px solid black;
			height: 150px;
			width: 
		}
		.board_page_num_div{
			border:1px solid blue;	
			text-align: center;
		}
		.board_search_div{
			border:1px solid blue;

		}
	</style>
</head>
<body>
	<div class="board_container">
	
		<div class="board_name_div">
			뭐뭐뭐 게시판
		</div>
		
		
		<div class="board_div">
			<%for(int i=0;i<20;i++){ %>
			<div class="board_post_div">
				<img class="board_post_img" src="resources/imgs/board_img/cat3.jpg" width="200px" height="120px"><!-- 게시글 사진 -->
					<div>
					
					
					</div>
			</div>
			<%} %>
		</div>
		
		
		<div class="board_page_num_div">
			<p>처음 1 2 3 4 5 6 끝</p>
		</div>
		
		<div class="board_search_div">
			<P>검 색 기 능</P>
		</div>
		
		
		
	</div>
</body>
</html>