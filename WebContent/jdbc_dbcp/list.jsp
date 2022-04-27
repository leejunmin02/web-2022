<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"   
%>
<%
	//DBCP로 변경
	Context initCtx = new InitialContext(); //Context객체 생성
	Context envCtx = (Context)initCtx.lookup("java:comp/env");//JNDI에 등록된 Naming 자원들을 모두 가져옴
	DataSource ds = (DataSource)envCtx.lookup("jdbc/jmlee");//DataSource 객체 얻어냄
	Connection con = ds.getConnection();//Connection 객체 얻어냄
	
	//3. 연결 설정
	String sql = "select * from login order by id";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
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
<%	
		//4. 반환데이터 출력
	while(rs.next()){
		String id = rs.getString("id");
		String name = rs.getString("name");
		String pwd = rs.getString("pwd");
%>
			<td><a href="updateForm.jsp?id=<%=id %>"><%=id %></a></td>
			<td><%=name %></td>
			<td><%=pwd %></td>
		</tr>
<%
	}
%>
	</table>
</div>
<%
	
		//5. 객체 해지
		rs.close();
		stmt.close();
		con.close();
	
	%>
</body>
</html>






