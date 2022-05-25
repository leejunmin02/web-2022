<%@page import="cs.dit.loginDto"%>
<%@page import="cs.dit.loginDao"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
		import = "java.sql.*"    
%>
<%
	request.setCharacterEncoding("utf-8");

	//클라이언트에서 전달된 데이터
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	
	loginDao dao = new loginDao();
	loginDto dto = new loginDto(id, name, pwd);
	dao.insert(dto);
	
	response.sendRedirect("list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%=i %>개의 데이터가 입력되었습니다!
</body>
</html>