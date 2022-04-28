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
   String sql = "select * from mbtilogin order by id";
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
   <h2 style = "text-align:center">회원 목록 조회</h2>
<div class="container">
   <table class="table table-bordered">
      <tr>
         <th>아이디</th>
         <th>비밀번호</th>
         <th>이름</th>
         <th>성격유형</th>
         <th>생년월일</th>
         <th>전화번호</th>
         <th>이메일</th>
         <th>성별</th>
      </tr>
      <tr>
<%   
      //4. 반환데이터 출력
   while(rs.next()){
      String id = rs.getString("id");
      String pwd = rs.getString("pwd");
      String name = rs.getString("name");
      String chacter = rs.getString("chacter");
      String udate = rs.getString("udate");
      String pNumber = rs.getString("pNumber");
      String email = rs.getString("email");
      String gender = rs.getString("gender");
      
      
%>
         <td><a href="updateForm.jsp?id=<%=id %>"><%=id %></a></td>
         <td><%=pwd %></td>
         <td><%=name %></td>
         <td><%=chacter %></td>
         <td><%=udate %></td>
         <td><%=pNumber %></td>
         <td><%=email %></td>
         <td><%=gender %></td>
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





