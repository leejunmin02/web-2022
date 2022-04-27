<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"
    %>
<%
	String id = request.getParameter("id");
	//DBCP로 변경
	Context initCtx = new InitialContext(); //Context객체 생성
	Context envCtx = (Context)initCtx.lookup("java:comp/env");//JNDI에 등록된 Naming 자원들을 모두 가져옴
	DataSource ds = (DataSource)envCtx.lookup("jdbc/jmlee");//DataSource 객체 얻어냄
	Connection con = ds.getConnection();//Connection 객체 얻어냄
	//3. 연결 설정
	String sql = "select * from login where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);

	ResultSet rs = pstmt.executeQuery();

	String name = "";
	String pwd = "";
	if(rs.next()){
		name = rs.getString("name");
		pwd = rs.getString("pwd");
	}

	rs.close();
	pstmt.close();
	con.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>회원 변경</title>
  <meta charset="utf-8">
<body>

<div class="container">
  <h2>회원 변경</h2>
	<form action="updatePro.jsp" method="post">
    <div class="form-group">
      <label for="id">id:</label>
      <input type="text" class="form-control" id="id" name="id" value ="<%=id %>">
    </div>    
    <div class="form-group">
      <label for="name">name:</label>
      <input type="text" class="form-control" id="name" name="name" value ="<%=name %>">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" name="pwd" value ="<%=pwd %>">
    </div>
	<button type="submit" class="btn btn-primary">변경 저장</button>
	<button type="button" class="btn btn-primary" onclick="">사용자 삭제</button>
    <button type="button" class="btn btn-primary" onclick="locatin.href='list.jsp'">사용자 조회</button>
  </form>
</div>


</body>
</html>
