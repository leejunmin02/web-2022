<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
%>
	작성자: <%=request.getParameter("name")%><br>
	제목: <%=request.getParameter("title")%><br>
	내용: <%=request.getParameter("contents")%><br>
	
</body>
</html>