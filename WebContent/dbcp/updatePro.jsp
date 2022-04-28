<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
      import = "java.sql.*"    
%>
<%
   request.setCharacterEncoding("utf-8");

   //클라이언트에서 전달된 데이터
   String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");
   String name = request.getParameter("name");
   String chacter = request.getParameter("chacter");
   String udate = request.getParameter("udate");
   String pNumber = request.getParameter("pNumber");
   String email = request.getParameter("email");
   String gender = request.getParameter("gender");
   
   // Context 객체얻기
   Context initCtx = new InitialContext();
   // "java:comp/env" 에 해당하는 객체를 찾아서 envCtx에 삽입
   Context envCtx = (Context)initCtx.lookup ("java:comp/env");
   // "jdbc/taeyun" 에 해당하는 객체를 찾아서 ds에 삽입
   DataSource ds = (DataSource)envCtx.lookup("jdbc/taeyun");
   // 커넥션 풀로 부터 커넥션 객체를 얻어냄
   Connection con = ds.getConnection();


   
   //3. SQL문 
   String sql = "UPDATE mbtilogin SET pwd =?, name =?, chacter =?, udate =?, pNumber =?, email=?, gender =? WHERE id =?";
   
   //4. SQL 실행
   //Statement stmt = con.createStatement();
   PreparedStatement pstmt = con.prepareStatement(sql);
   pstmt.setString(1, pwd);
   pstmt.setString(2, name);
   pstmt.setString(3, chacter);
   pstmt.setString(4, udate);
   pstmt.setString(5, pNumber);
   pstmt.setString(6, email);
   pstmt.setString(7, gender);
   pstmt.setString(8, id);
   
   int i = pstmt.executeUpdate();
   
   
   //5.객체 해지
   pstmt.close();
   con.close();
   
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