<%@page import="com.uh.vo.BoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%ArrayList<BoardVo> list=(ArrayList<BoardVo>)request.getAttribute("list"); %>
    <%String search_str=request.getParameter("search_str"); %>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#search_span{
		font-size: 25px;
	}
</style>
</head>
<body>
<div  class="search_bar" style=" width: 100%;  background-color: #f7f9fa;" >

	<%if(list.size()==0||search_str.equals("")){ %>
			<span id="search_span" class="search_bar">검색결과 없음</span>
		<%}else{ %>
			<%for(int i=0; i<list.size();i++){ %>
			
				<% String board_name=list.get(i).getBoard_name();%>
				
						<% board_name=board_name.replaceAll(search_str, "<span style='background-color: #cffcd8;'>"+search_str+"</span>");%>
		
				<span id="search_span" class="search_bar"><a href='board_main?post_board_name=<%=list.get(i).getBoard_name() %>'><%=board_name %></a></span><br>
		<%} %>
	<%} %>	
</div>

</body>
</html>