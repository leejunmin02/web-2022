<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"   
%>
   <%
  
   // Context 객체얻기
   Context initCtx = new InitialContext();
   // "java:comp/env" 에 해당하는 객체를 찾아서 envCtx에 삽입
   Context envCtx = (Context)initCtx.lookup ("java:comp/env");
   // "jdbc/taeyun" 에 해당하는 객체를 찾아서 ds에 삽입
   DataSource ds = (DataSource)envCtx.lookup("jdbc/taeyun");
   // 커넥션 풀로 부터 커넥션 객체를 얻어냄
   Connection con = ds.getConnection();
   
      //3. 연결 설정
   String sql = "select * from mbtiborad order by num";
   Statement stmt = con.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>borad 데이터 조회</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
   <h2 style = "text-align:center">게시판 목록 조회</h2>
<div class="container">
   <table class="table table-bordered">
      <tr>
         <th>게시판번호</th>
         <th>게시판 유형</th>
         <th>게시판 제목</th>
         <th>작성날짜</th>
         <th>조회수</th>
         <th>글쓴이</th>
      </tr>
      <tr>
<%   
      //4. 반환데이터 출력
   while(rs.next()){
      String num = rs.getString("num");
      String btitle = rs.getString("btitle");
      String bname = rs.getString("bname");
      String bdate = rs.getString("bdate");
      String boradview = rs.getString("boradview");
      String boradtype = rs.getString("boradtype");

%>
         <td><%=num %></td>
         <td><%=boradtype %></td>
         <td><a href="boradForm.jsp?btitle=<%=btitle %>"><%=btitle %></a></td>
         <td><%=bdate %></td>
         <td><%=boradview %></td>
         <td><%=bname %></td>
         

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





