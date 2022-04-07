<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.net.httpserver.Authenticator.Result"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
%>
<%     	//1. jdvc 드라이버 로드
	Class.forName("org.mariadb.jdbc.Driver");
	
	//2. 연결통로(Connection)얻기
	String uri = "jdbc:mariadb://localhost:3306/jmdb";
	String user = "junmin";
	String password = "1111";
	Connection con = DriverManager.getConnection(uri, user, password);
	
	//3. 연결 설정
	String sql = "select * from login";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	out.println("성공");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
		<th>id</th>
		<th>pwd</th>
	</tr>
	<tr>

<%	
	//4. 반환데이터 출력
	while(rs.next()){
	String id = rs.getString("id");
	String pwd = rs.getString("pwd");
%>
	<td><%=id %></td>
	<td><%=pwd %></td>
	</tr>
<% 	
	}
	
	
%>
</table>
</body>
</html>