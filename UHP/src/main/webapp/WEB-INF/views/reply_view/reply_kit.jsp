<%@page import="com.uh.vo.ReplyVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>

<%
	
	String member_idx = request.getParameter("member_idx"); // 회원 idx
	String post_idx = request.getParameter("post_idx"); // 게시물 번호
	String post_board_name = request.getParameter("post_board_name"); //게시판 이름
	String page_num = request.getParameter("page_num"); // 페이지 번호
	String search_mode = request.getParameter("search_mode");
	String search_str = request.getParameter("search_str");
    
%> 

<%
	ArrayList<ReplyVo> reply_list = (ArrayList<ReplyVo>)request.getAttribute("reply_list");
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.board_reply_content_btn{
		text-align: right;
		margin-bottom: 10px;
		margin-right: 5px;
	}
	.text_counting{
		color: #aaa;
		float: left;
		margin-left: 5px;
	}
	.reply_text{
		resize: none;
	}
	.reply_date{
		font-size: 10px;
		 color: gray;
		 text-align: right;
		 
	}
}
</style>

<script type="text/javascript">
	$('.reply_text').on('keydown', function() {
		
		var content = $(this).val();
		$('#text_counting').html("("+content.length+" / 최대 200자)");    //글자수 실시간 카운팅
		
		if($(this).val().length > 200) {
			alert("글자수 제한이 있습니다.");
			$(this).val($(this).val().substring(0, 200));
			
		}

			
	});
	
	function reply_insert(f) {
		if(f.post_reply_text.value.trim() == ""){
			alert("내용을 입력해주세요");
			return false;
		}else{
			var text = f.post_reply_text.value;
			f.post_reply_text.value=text.replace(/(\n|\r\n)/g, '<br>');
		}
		
	}
	
	function reply_insert(f) {
		<%if(session.getAttribute("nick")==null||session.getAttribute("nick").equals("")){%>
			location.href='notSignIn';
		<%}else{%>
		if($("#reply_text").val().trim() == ""){
			alert("내용을 입력해주세요");
			return;
		}else{
			$.ajax({
				type:'get',
				async:false,
				url:'reply_insert.do?post_idx=' + <%=post_idx%> + '&reply_con=' + $('#reply_text').val(),
				success: function(data) {
					
				}
			}); // ajax
			
			reply_select('<%=member_idx%>',<%=post_idx%>, <%=page_num%>, '<%=post_board_name%>', '<%=search_mode%>', '<%=search_str%>');
		}
		<%}%>
	}
	
	
	function look(i) {
		var test1 = document.getElementById('btn'+i);
		var test2 = document.getElementById('btnn'+i);
		var test3 = document.getElementById('btnns'+i);
		test1.style.display = 'inline';
		test2.style.display = 'inline';
		test3.style.display = 'inline';
	}
	
	function out(i) {
		var test1 = document.getElementById('btn'+i);
		var test2 = document.getElementById('btnn'+i);
		var test3 = document.getElementById('btnns'+i);
		test1.style.display = 'none';
		test2.style.display = 'none';
		test3.style.display = 'none';
	}
</script>

<script src="resources/JSs/reply_js/reply.js"></script> <!-- js 파일 로드 -->

</head>

<body>
<div class="board_reply_container">
	<div style="width:100%; ">
		<form action="reply_insert.do" method="post">
		
			<input type="hidden" name=member_idx value='<%= member_idx %>'>
			<input type="hidden" name=post_idx value='<%= post_idx %>'>
			
			<input type="hidden" name=page_num value='<%= page_num %>'>
			<input type="hidden" name=post_board_name value='<%= post_board_name %>'>
			<input type="hidden" name=search_mode value='<%=search_mode%>'>
			<input type="hidden" name=search_str value='<%=search_str%>'>
			
			<div class="board_reply_content" style="margin-bottom: 10px;">
				<textarea class="reply_text" name="reply_text" id="reply_text" rows="5" cols="139" placeholder="댓글"></textarea>
			</div>
			
			
			<div class="board_reply_content_btn" >
				<span class="text_counting" id="text_counting">(0 / 최대 200자)</span>
				<input class="btnreply" type="button" value="등록" onclick="reply_insert(this)" style="width:100px; height:40px;"/>
				<hr>
			</div>
		</form>		
				
		<div>
			<table>
			<% if(reply_list.size() != 0){ %>
				<%for (int i=0; i<reply_list.size(); i++) {%>
					<tr>
						<td><%= reply_list.get(i).getReply_member_nick() %></td>
						<td style="width: 75%;white-space:normal; word-break:break-all;"><%= reply_list.get(i).getReply_con()%></td>
						<td style="width: 10%" class="reply_date">
							<%= reply_list.get(i).getReply_date() %>
							<input class="btndap<%= i %>" type="button" value="답글" onclick="look(<%= i %>)" />
						</td>		
					</tr>
					
					<tr>
						<td></td>
						<td>
							<textarea id="btn<%= i %>" class="btn<%= i %>" style="display: none" class="reply_text" cols="50" rows="1" placeholder="답글입력"></textarea>
							<input id="btnn<%= i %>" class="btnn<%= i %>" style="display: none" type="button" value="답글달기">
							<input id="btnns<%= i %>" class="btnn<%= i %>" style="display: none" type="button" value="취소" onclick="out(<%= i %>)">
						</td>
						<td></td>
					</tr>
				<%} %>	
			<%} %>	
			<br>
			</table>
			<br><br><br>
			
		</div>			 		
	</div>
</div>	
</body>
</html>