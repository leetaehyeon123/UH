<%@page import="com.uh.vo.BoardVo"%>
<%@page import="com.uh.vo.PostVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    PostVo post_vo=(PostVo)request.getAttribute("post_vo"); 
    %>

<%
String member_idx = (String)request.getAttribute("member_idx") ; // 회원 고유번호	
String board_category=request.getParameter("car");
String post_idx=request.getParameter("post_idx");
String page_num=request.getParameter("page_num");
String post_board_name=request.getParameter("post_board_name");
String search_mode=request.getParameter("search_mode");
String search_str=request.getParameter("search_str");
String nick=(String)session.getAttribute("nick");
String my=request.getParameter("my");
String main=request.getParameter("main");
int like=(int)request.getAttribute("like");


if(post_board_name==null){
	
	response.sendRedirect("main");
}
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>
		
		.post_container{
			width:1000px; 
			margin-left:10px;
		}
		
			.post_board_name_div{	
				font-size: 43px;	
				font-family: 'Do Hyeon', sans-serif;	
				padding: 0 0 15px 0;
				margin-left: 20px;
			}
			.post_info_container{
				background-color: #f7f9fa;
				border: 1px solid #dae1e6; 
				height: 100px;
				padding: 10px 10px;
			}
				.post_info_span1{
					font-size:40px; 					
				}
				.post_info_span2{
					font-size:25px;
					float: left;
				}
				.post_info_span3{
					font-size:25px;
					float: right;
					
				}
			
			.post_context_container{
				background-color: white;
				border: 1px solid #dae1e6;
				height: 800px;
			}
			
			.post_like_container{
					background-color: #f7f9fa;
			border: 1px solid #dae1e6; 							
			}
				.post_like_div{
					text-align: center;
					width:100px;
					padding:15px;
					margin: 15px auto;
					border:1px solid black;
					border-radius: 10%;
					cursor: pointer;
					background-color: <%=(like==0?"white":" rgb(165, 222, 250)")%>;
					
				}
					.post_like_img{
						 width:100px;
						 height:75px;
					}
					.post_like_num{
						font-size: 25px;
						color: blue;
					}
				
				
			.post_reply_container{
				background-color:white;
				border: 1px solid #dae1e6; 
			}
			
			.post_board_container{
			}
				/* 게시판 부분 임포트 과정에서 생기는 요소 */
				.board_name_div{
					display: none;
				}
				.board_container{
					margin-left:0px !important;			
				}

</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/JSs/ajax/ajax.js"></script>
	<script type="text/javascript">
	window.onload=get_board_kit(<%=page_num%>,'<%=post_board_name%>','<%=search_mode%>','<%=search_str%>');
	
		function get_board_kit(page_num,post_board_name,search_mode,search_str){
			$.ajax({ 
			type: 'get' , 
			url: 'board_kit?page_num='+page_num+'&post_board_name='+post_board_name+'&search_mode='+search_mode+'&search_str='+search_str+'&my=<%=my%>&main=<%=main%>', 
			success: function(data) {
				$("#post_board_container").html(data); 
				} 
			}); 
		}
		function goUpdate(){
			location.href='post_update?page_num=<%=page_num%>&post_board_name='+
			'<%=post_board_name%>&search_mode=<%=search_mode%>&search_str=<%=search_str%>&car=<%=board_category%>&post_idx=<%=post_idx%>';
			//page_num,post_board_name,search_mode,search_str,car,post_idx
			}
		function goDelete(){
			location.href='post_delete.do?page_num=<%=page_num%>&post_board_name='+
			'<%=post_board_name%>&search_mode=<%=search_mode%>&search_str=<%=search_str%>&car=<%=board_category%>&post_idx=<%=post_idx%>';
			//page_num,post_board_name,search_mode,search_str,car,post_idx
			}
		
		/* 좋아요 */
		function golike(){
			<%if(nick.equals("")){%>
				location.href='notSignIn';
			<%}else{%>
				var like_color=$('#post_like_div').css('backgroundColor');
				/* rgb(255, 255, 255) 흰색  rgb(165, 222, 250) 파랑*/
				if(like_color=='rgb(255, 255, 255)'){ /* 안눌려있다면. */
					$('#post_like_div').css('backgroundColor','rgb(165, 222, 250)');
					ajaxDo('like_up?post_idx=<%=post_idx%>&nick=<%=nick%>','');
					like_count();
				}else{/* 눌려있다면 */
					$('#post_like_div').css('backgroundColor','rgb(255, 255, 255)');
					ajaxDo('like_down?post_idx=<%=post_idx%>&nick=<%=nick%>','');
					like_count();
				}
			<%}%>
		}
</script>
	
<body>

<!-- top bar  -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JSs/bar_js/get_top_bar.js"></script><div id="top_bar" ></div>

<div class="context_main" style="margin: auto;width: 1260px;" >
	<!-- left bar -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JSs/bar_js/get_left_bar.js"></script><div id="left_bar" ></div>
	
	<div class="context_container" >
	<!-- 
	  context-container은 bar들이 자리를 차지고하고 남은 공간.즉 페이지의 내용이 들어갈 공간이다.
	  bar를 참조하는 페이지라면 꼭 내용을 class="context-container"로 설정한 div안에 담아준다.
	   추가적인 스타일은 left_bar.css에 정의 되어있다. 
	   크롬 화면창 크기가 작아질 때 float:left인 div가 내려가는 현상은 min-width 속성값을 조정하여 내용이 짤려 내려가지 않도록 하면 된다.
	 -->

	<div class="post_container">
	
				<!-- 게시판 이름 -->
		<%if(my!=null&&my.equals("my")) {%>
			<div class="post_board_name_div"><!-- style은 board_kit.css에 정의  -->
				<span onclick="location.href='board_main?post_board_name=ALL&search_mode=post_title&search_str=<%=nick %>'" style="cursor: pointer;">내 게시글</span>		
			</div>
		<%}else if(main!=null&&main.equals("main")){%>
			<div class="post_board_name_div" style="cursor: pointer;"><!-- style은 board_kit.css에 정의  -->
				<span onclick="location.href='main'" >레전드 놀이터!</span>			
			</div>
		<%}else{ %>
			<%if(!post_board_name.equals("ALL")) {%>
			<div class="post_board_name_div"><!-- style은 board_kit.css에 정의  -->
				<span onclick="location.href='board_main?post_board_name=<%= post_board_name%>'" style="cursor: pointer;"><%= post_board_name%> 게시판</span>
				<span style="font-size: 15px;"> <%=board_category%> > <%= post_board_name %> </span>
			</div>
			<%} else {%>
			<div class="post_board_name_div"><!-- style은 board_kit.css에 정의  -->
				<span onclick="location.href='board_main?post_board_name=ALL&search_mode=<%=search_mode %>&search_str=<%=search_str %>'" style="cursor: pointer;">전체 검색</span>
				<span style="font-size: 15px;">  > <%=search_str %> </span>
			</div>
			<%}%>
		<%}%>
		
		
		
		
		
		
		
		
		
			
			<div class="post_info_container"  >
				<span class="post_info_span1"><%=post_vo.getPost_title()%></span>
				<br><br>
				<span class="post_info_span2"><%=post_vo.getPost_member_nick()%> | <%=post_vo.getPost_date()%></span>
				<span class="post_info_span3">조회  <%=post_vo.getPost_view()%> | 추천 <span id='like_count'></span> |댓글 30</span>
			</div>
			<%if(nick.equals(post_vo.getPost_member_nick())&&nick!=null){ %>
			<div id="update_delete_div" style="width: 100%"> 
				<input type="button" value="삭제" style="float: right;" onclick="goDelete()">
				<input type="button" value="수정" style="float: right;" onclick="goUpdate()">
			</div>
			<%} %>
			<div class="post_context_container" >
				<p><%=post_vo.getPost_con() %></p>
			</div>
			
			
			<!-- 좋아요 -->
			<div class="post_like_container">
				<div id="post_like_div" class="post_like_div" onclick="golike()">
					<img class="post_like_img" src="resources/imgs/post_img/like.png">
					<br>
					<span  class="post_like_num"></span>
				</div>
			</div>
			
			
			<div class="post_reply_container" id="post_reply_container"></div>
				
				
			</div>
			<div class="post_board_container" id="post_board_container"></div>
	</div>
	
	
	</div>
</div>
<script type="text/javascript">
	like_count();
	function like_count(){
		var lc=ajaxDo('like_count?post_idx=<%=post_idx%>','');
		$('#like_count').text(lc);
		$('.post_like_num').text(lc);
		}
	window.onload=get_board_kit(<%=page_num%>,'<%=post_board_name%>','<%=search_mode%>','<%=search_str%>');
	window.onload=reply_select('<%=member_idx%>',<%=post_idx%>,<%=page_num%>,'<%=post_board_name%>','<%=search_mode%>','<%=search_str%>');
	
	function get_board_kit(page_num,post_board_name,search_mode,search_str){
		$.ajax({ 
		type: 'get',
		url: 'board_kit?page_num='+page_num+'&post_board_name='+post_board_name+'&search_mode='+search_mode+'&search_str='+search_str,
		success: function(data) {
			$("#post_board_container").html(data);
			} 
		}); 
	}
		

	function reply_select(member_idx, post_idx, page_num, post_board_name, search_mode, search_str) {
		$.ajax({
			type:'get',
			async:false,
			url:'reply_select.do?member_idx=' + member_idx + '&post_idx=' + post_idx + "&page_num=" + page_num + "&post_board_name=" + post_board_name + "&search_mode=" + search_mode + "&search_str=" + search_str,
			success: function(data) {
				$("#post_reply_container").html(data);
			}
				
		});
		
	}
</script>
</body>
</html>