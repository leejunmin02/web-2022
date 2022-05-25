<%@page import="cs.dit.loginDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cs.dit.loginDao"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"   
%>
<%
  loginDao dao = new loginDao();
  ArrayList<loginDto> dtos = dao.list();
  pageContext.setAttribute("dtos", dtos);
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login 데이터 조회</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
	<table class="table table-bordered">
		<tr>
			<th>id</th>
			<th>name</th>
			<th>pwd</th>
		</tr>
		<tr>
		${dtos[0].id}<br>
		${dtos[0].name}<br>
		${dtos[0].pwd}<br>
<%	
	for(loginDto dto : dtos){
		
	
%>
			<td><a href="updateForm.jsp?id=<%=dto.getId() %>"><%=dto.getId() %></a></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getPwd() %></td>
		</tr>
<%
	}
%>
	</table>
</div>
<%
	
		
	
	%>
</body>
</html>






