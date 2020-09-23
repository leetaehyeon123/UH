<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		.board_container{
			width: 700px;
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
			height: 120px;
		}
		.board_post_img{
			float:left;
			margin: 5px;
		}
		.board_post_text_div{
			margin:5px 0px 0px 175px;
		}
		.board_post_title_div,.board_post_sub_div{
			border:1px solid red;
			height: 50%;
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
		
		
		<div class="board_div"><!-- 게시 글들 담는 div -->
		
			<%for(int i=0;i<20;i++){ %>
			
			<div class="board_post_div">
			
				<img class="board_post_img" src="resources/imgs/board_img/cat3.jpg" width="160px" height="110px"><!-- 게시글 사진 -->
				
					<div class="board_post_text_div">
					
							<div class="board_post_title_div">
								<p>이글의 제목입니다.</p>
							</div>
						
					 		<div class="board_post_sub_div">
					 			<p> 작성자  2020/10/13  추천 12  조회수 361 </p>
					 		</div>
					
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