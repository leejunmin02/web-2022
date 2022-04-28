<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
      import = "java.sql.*"    
%>
<%
   request.setCharacterEncoding("utf-8");

   //클라이언트에서 전달된 데이터
   String num = request.getParameter("num");
   String btitle = request.getParameter("btitle");
   String bname = request.getParameter("bname");
   String bdate = request.getParameter("bdate");
   String boradview = request.getParameter("boradview");
   String boradtype = request.getParameter("boradtype");
   String borad = request.getParameter("borad");
   String cmt = request.getParameter("cmt");
   
   
   

   
  //DBCP로 변경
  Context initCtx = new InitialContext();
  Context envCtx = (Context)initCtx.lookup ("java:comp/env");
  DataSource ds = (DataSource)envCtx.lookup("jdbc/taeyun");
  Connection con = ds.getConnection();
  
   //3. SQL문 
   String sql = "insert into mbtiborad(num, btitle, bname, bdate, boradview, boradtype, borad, cmt) values(?, ?, ?, ?, ?, ?, ?, ?)";
   
   //4. SQL 실행
   //Statement stmt = con.createStatement();
   PreparedStatement pstmt = con.prepareStatement(sql);
   pstmt.setInt(1, 2);
   pstmt.setString(2, btitle);
   pstmt.setString(3, bname);
   pstmt.setString(4, null);
   pstmt.setString(5, null);
   pstmt.setString(6, boradtype);
   pstmt.setString(7, borad);
   pstmt.setString(8, null);
   
   
   int i = pstmt.executeUpdate();
   
   
   //5.객체 해지
   pstmt.close();
   con.close();
   
   response.sendRedirect("listborad.jsp");
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