<%@page import="com.uh.vo.PostVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String post_board_name=request.getParameter("post_board_name");
	String page_num=request.getParameter("page_num");
	String search_mode=request.getParameter("search_mode");
	String search_str=request.getParameter("search_str");
	String car=(String)request.getAttribute("car");
	String my=request.getParameter("my");
	String main=request.getParameter("main");
	String nick=(String)session.getAttribute("nick");
	if(nick==null){
		nick="";
	}
	
	if(my==null){
		my="";
	}
	
	if(main==null){
		main="";
	}
	
    %>   
    <%
    ArrayList<PostVo> list=(ArrayList<PostVo>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
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

		.board_go_post{
		
			float:right;
			margin: 5px 5px;
	
	
		}	

		/* 게시물들 출력부 */
		.board_post_container{
			background-color: #f7f9fa;
			border: 1px solid #dae1e6;
			border-radius: 0.5%;
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
				background-color:white; 
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
			margin-top: -50px;
			
		}
		#sub_board_title:hover   { text-decoration:underline; }
	
	</style>
	<script type="text/javascript">
		function go_post(post_idx){
			location.href='post?post_idx='+post_idx+'&post_board_name=<%=post_board_name%>'+
			'&search_mode=<%=search_mode%>&search_str=<%=search_str%>&car=<%=car%>&my=<%=my%>&main=<%=main%>';	
		
		}
		function create_post(){
			location.href='post_create?post_board_name=<%=post_board_name%>&page_num=<%=page_num%>'+
			'&search_mode=<%=search_mode%>&search_str=<%=search_str%>&car=<%=car%>';
			}
		function goPage(i){
			get_board_kit(i,'<%=post_board_name%>','<%=search_mode%>','<%=search_str%>');
			}
	</script>

</head>
<body>

	<div class="board_container">
	
			<!-- 게시판 이름 -->
		<%if(my!=null&&my.equals("my")) {%>
			<div class="board_name_div"><!-- style은 board_kit.css에 정의  -->
				<span onclick="location.href='board_main?post_board_name=ALL&search_mode=post_title&search_str=<%=nick %>&my=my'" style="cursor: pointer;">내 게시글</span>		
			</div>
		<%}else if(main!=null&&main.equals("main")){%>
			<div class="board_name_div"><!-- style은 board_kit.css에 정의  -->
				<span onclick="location.href='main?main=main'" style="cursor: pointer;">레전드 놀이터!</span>			
			</div>
		<%}else{ %>
			<%if(!post_board_name.equals("ALL")) {%>
			<div class="board_name_div"><!-- style은 board_kit.css에 정의  -->
				<span onclick="location.href='board_main?post_board_name=<%= post_board_name%>'" style="cursor: pointer;"><%= post_board_name%> 게시판</span>
				<span style="font-size: 15px;"> <%=car%> > <%= post_board_name %> </span>
			</div>
			<%} else {%>
			<div class="board_name_div"><!-- style은 board_kit.css에 정의  -->
				<span onclick="location.href='board_main?post_board_name=ALL&search_mode=<%=search_mode %>&search_str=<%=search_str %>'" style="cursor: pointer;">전체 검색</span>
				<span style="font-size: 15px;">  > <%=search_str %> </span>
			</div>
			<%}%>
		<%}%>
	
		
		
		<%if(!post_board_name.equals("ALL")){ %>
		<input class="board_go_post" type="button" value="글작성" onclick="create_post()">
		<%}%>
		
		
			
	
		
	
		
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
		
					<%for(int i=0;i<list.size();i++){ %>
					
					
						<% String title=list.get(i).getPost_title();%>
						<%if(!search_str.equals("null")){ %>
						<% title=title.replaceAll(search_str, "<span style='background-color: #cffcd8;'>"+search_str+"</span>");%>
						<%} %>				
						
						
						<%if(list.get(i).getPost_title().equals("삭제된게시글입니다.")) {%>
						<tr class="board_post_tr" style="background-color: #e3e3e3; cursor:default;" onclick="alert('삭제된게시물');">
						<%}else{ %>
						<tr class="board_post_tr" onclick="go_post(<%=list.get(i).getPost_idx()%>)">
						<%}%>
						
						
						
							<td><%=list.get(i).getPost_idx()%></td>
							<td><img src='resources/imgs/board_img/<%=list.get(i).getPost_img()!=null?"YesImg.png":"NoImg.png" %>' width="35" height="35" style="float: left;"></td>
							<%if(!post_board_name.equals("ALL")){ %>
								<td style="text-align: left;"><%=title%></td>
							<%}else{ %>
								<td style="text-align: left;">
								<span id="sub_board_title" style="font-size: 15px;color: blue;" 
								onclick="event.cancelBubble=true;location.href='board_main?post_board_name=<%=list.get(i).getPost_board_name()%>'">
									<%=list.get(i).getPost_board_name()%> > 
								</span>
								<%=title%></td>
							<%}%>
							<td><%=list.get(i).getPost_member_nick()%></td>
							<td><%=list.get(i).getPost_date()%></td>
							<td><%=list.get(i).getPost_view()%></td>
							<td><%=list.get(i).getLike_count() %></td>
							<td>0</td>
						</tr>
					<%} %>
			
			
		
			</table>	
			<%if(list.size()==0){ %>
				 <h1 style="text-align: center;">검색 결과가 없습니다.</h1>
				<% }%>
			
		</div>
		
		
		<!-- 게시판 페이지 -->
		<div class="board_page_num_div">
			${ pageMenu }
		</div>
		
	
		<!-- 게시판 내 검색창 div -->
		<div class="board_search_div" >	
		<%if(!post_board_name.equals("ALL")){ %>
			<input class="board_go_post" type="button" value="글작성" onclick="create_post()">
		<%}else{%>
			<input class="board_go_post" type="button" value="글작성" onclick="create_post()" style="visibility: hidden;">
		<%}%>
		<br><br>
	
					<form action="board_main">
						<input type="hidden" name="post_board_name" value='<%=post_board_name%>'>
						<input type="hidden" name="page_num" value='<%=page_num%>'>
						<select class="search_combo" name="search_mode" >
				    		<option value="post_title">제목</option>
				    		<option value="post_member_nick">작성자</option>
						</select>
						<input class="search_input" name="search_str" type="text" placeholder="search in board" autocomplete="off" onkeydown="search_this(this)">
					
					</form>						
		</div>
		
		
		
	</div>
	
</body>
</html>