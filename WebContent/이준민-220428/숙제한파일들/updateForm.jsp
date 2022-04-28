<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"   
%> 
<%
	String id = request.getParameter("id");
    
	// Context 객체얻기
	Context initCtx = new InitialContext();
	// "java:comp/env" 에 해당하는 객체를 찾아서 envCtx에 삽입
	Context envCtx = (Context)initCtx.lookup ("java:comp/env");
	// "jdbc/taeyun" 에 해당하는 객체를 찾아서 ds에 삽입
	DataSource ds = (DataSource)envCtx.lookup("jdbc/taeyun");
	// 커넥션 풀로 부터 커넥션 객체를 얻어냄
	Connection con = ds.getConnection();

      //3. 연결 설정
   String sql = "select * from mbtilogin where id=?";
   PreparedStatement pstmt = con.prepareStatement(sql);
   pstmt.setString(1, id);
   ResultSet rs = pstmt.executeQuery();
   String name = "";
   String pwd = "";
   String chacter = "";
   String udate = "";
   String pNumber = "";
   String email = "";
   String gender = "";
   
   
   if(rs.next()){
		 pwd = rs.getString("pwd");
		 name = rs.getString("name");
	     chacter = rs.getString("chacter");
	     udate = rs.getString("udate");
	     pNumber = rs.getString("pNumber");
	     email = rs.getString("email");
	     gender = rs.getString("gender");
	      
	      
   }
   
   rs.close();
   pstmt.close();
   con.close();
%>
<!DOCTYPE html>
<html lang ="en">
<head>
	<meta charset="UTF-8">
	<title>회원정보 변경</title>
</head>
<body>
<div class="container">
  <h2>회원정보 업데이트</h2>
  <form action="updatePro.jsp" method="post">  
        <div class="form-group">
      <label for="id">아이디 :</label>
      <input type="text" class="form-control" name="id" value ="<%=id %>">
    </div> 
       
    <div class="form-group">
      <label for="pwd">비밀번호 :</label>
      <input type="password" class="form-control" name="pwd" value ="<%=pwd %>">
    </div>
    
    <div class="form-group">
      <label for="name">이름  :</label>
      <input type="text" class="form-control" name="name" value ="<%=name %>">
      </div>
    <div class="form-group">
      <label for="chacter">성격유형 :</label>
      <input type="text" class="form-control" name="chacter" value ="<%=chacter %>">
    </div>    
    
    <div class="form-group">
      <label for="udate">생년월일 :</label>
      <input type="date" class="form-control" name="udate" value ="<%=udate %>">
    </div>
    
    <div class="form-group">
      <label for="pNumber">전화번호 :</label>
      <input type="text" class="form-control" name="pNumber" value ="<%=pNumber %>">
    </div>
    
       <div class="form-group">
      <label for="email">이메일 :</label>
      <input type="email" class="form-control" name="email" value ="<%=email %>">
    </div>    
 <%   if(gender.equals("남자")){%>
    <div class="form-group">
      <label for="gender">성별 :</label>
      <input type="radio" class="form-control" name = "gender" value="남자" checked>남자
      <input type="radio" class="form-control" name = "gender" value="여자">여자
    </div>
<%}
else{ %>
    <div class="form-group">
      <label for="gender">성별 :</label>
      <input type="radio" class="form-control" name = "gender" value="남자" >남자
      <input type="radio" class="form-control" name = "gender" value="여자" checked>여자
    </div>
<%}%>
    <button type="submit" class="btn btn-primary">저장</button>
    <button type="button" class="btn btn-primary" onclick="location.href='deldatePro.jsp?id=<%=id%>'">삭제</button>
    <button type="button" class="btn btn-primary" onclick="location.herf='list.jsp'">조회</button>
  </form>
</div>

	
</body>
</html>