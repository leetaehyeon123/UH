<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String board_name="자전거"; 
    String board_category="스포츠";
    %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="resources/CSSs/bar_css/top_bar.css" rel="stylesheet">
	<style type="text/css">
	
		.board_container{
			width: 1000px;
			margin-left: 10px;
		}
		
		/* 게시판 이름 */
		.board_name_div{		/* board_main 에서 사용 , post_main에서 미사용 */
			font-size: 43px;	
			font-family: 'Do Hyeon', sans-serif;	
			padding: 0 0 15px 0;
			margin-left: 20px;
		}
		
		/* 게시물들 출력부 */
		.board_post_container{
			border:1px solid black;	
		}
				/* table부 */
			table{
				border-collapse: collapse;
			}
			.board_post_header_tr{
				height: 42px;
	
			}
			th{
				font-size: 23px;	
				
			}
			.board_post_tr{
				text-align: center;
				scope:rowgroup;
				height: 38px;
			}
			.board_post_tr:hover{
				background-color:#f0e1d5; 
				cursor: pointer;
			}
			
			td{
				font-size: 20px;
				overflow:hidden;
				white-space : nowrap;
				text-overflow: ellipsis;
			}
		
		
		/* 페이지 번호부 */
		.board_page_num_div{
			font-family: 'Do Hyeon', sans-serif;	
			text-align: center;
			font-size: 30px;
			padding: 10px 0 15px 0;
		}
		/* 게시판에서 검색부 */
		.board_search_div{
			padding: 0 0 30px 0;
			text-align: center;
			
		}
	
	</style>
</head>
<body>

	<div class="board_container">
			<!-- 게시판 이름 -->
		<div class="board_name_div"><!-- style은 board_kit.css에 정의  -->
			<%=board_name%> 게시판
			<span style="font-size: 15px;"> <%=board_category %> > <%=board_name %> </span>
		</div>
		
	
		
		<!-- 게시 글들 담는 div -->
		<div class="board_post_container">
			<table style="width: 100%; table-layout:fixed;border: 0px;">
				<tr class="board_post_header_tr">
					<th width=80>글번호</th>
					<th width="37"></th>
					<th width="400">제목</th>
					<th width="120">글쓴이</th>
					<th width="170">작성일</th>
					<th width="50">조회</th>
					<th width="50">추천</th>
					<th width="50">댓글</th>
				</tr>
				<%for(int i=0;i<30;i++){ %>
					<tr class="board_post_tr">
						<td><%=i+1%></td>
						<td><img src='resources/imgs/board_img/<%=i%4==0?"YesImg.png":"NoImg.png" %>' width="35" height="35" style="float: left;"></td>
						<td style="text-align: left;">제목 입니다.!!!</td>
						<td>우주최강이태현</td>
						<td>2020/10/13</td>
						<td>1000</td>
						<td>50</td>
						<td>12</td>
					</tr>
				<%} %>
			
			</table>		
		</div>
		
		<!-- 게시판 페이지 -->
		<div class="board_page_num_div">
			처음  이전  1  2  3  4  5  6  7  8  9  10  다음  마지막
		</div>
		
		
		<!-- 게시판 내 검색창 div -->
		<div class="board_search_div" >				
					<form>
						<input type="hidden" name="board_name" value="">
						<input type="hidden" name="board_page" value="">
						<select class="search_combo" name="search_mod" >
				    		<option value="작성자">작성자</option>
				    		<option value="제목">제목</option>
						</select>
						<input class="search_input" type="text" placeholder="search in board">
					</form>			
		</div>
		
		
		
	</div>
	
</body>
</html>