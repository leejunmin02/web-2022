<%@page import="org.apache.tomcat.dbcp.dbcp2.PStmtKey"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
%>
<%
	//클라이언트에서 전달된 데이터
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	//1. jdbc 드라이브 로드
	Class.forName("org.mariadb.jdbc.Driver");
	//2. 커넥션 객체 얻기
	String uri = "jdbc:mariadb://localhost:3306/jmdb";
	String user = "junmin";
	String password = "1111";
	Connection con = DriverManager.getConnection(uri, user, password);
	
	//3. SQL문
	String sql = "insert into login(id, pwd) values(?,?)";
	//4. SQL 실행
	//Statement stmt = con.createStatement();
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pwd);
	//int i = stmt.executeUpdate(sql);
	//5. 객체 해지
	pstmt.close();
	con.close();
	
	response.sendRedirect("dncon-login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>