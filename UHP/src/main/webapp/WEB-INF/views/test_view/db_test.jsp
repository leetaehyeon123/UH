<%@page import="com.uh.vo.TestVo"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%ArrayList<TestVo> list=(ArrayList<TestVo>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align: center;">
<%for(int i=0;i<list.size();i++) {%>
<h1><%=(i+1)+list.get(i).getName() %></h1>
<%} %>
</body>
</html>