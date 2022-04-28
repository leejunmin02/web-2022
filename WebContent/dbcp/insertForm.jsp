<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>로그인</title>
  <meta charset="utf-8">
<body>

<div class="container">
  <h2>회원가입 화면</h2>
  <form action="insertPro.jsp" method="post">
    <div class="form-group">
      <label for="id">아이디 :</label>
      <input type="text" class="form-control" placeholder="20자 이하" name="id">
    </div> 
       
    <div class="form-group">
      <label for="pwd">비밀번호 :</label>
      <input type="password" class="form-control" placeholder="20자 이하" name="pwd">
    </div>
    
    <div class="form-group">
      <label for="name">이름  :</label>
      <input type="text" class="form-control" placeholder="Ex)홍길동" name="name">
      
    <div class="form-group">
      <label for="chacter">성격유형 :</label>
      <input type="text" class="form-control" placeholder="Ex)MBTI" name="chacter">
    </div>    
    
    <div class="form-group">
      <label for="udate">생년월일 :</label>
      <input type="date" class="form-control" name="udate">
    </div>
    
    <div class="form-group">
      <label for="pNumber">전화번호 :</label>
      <input type="text" class="form-control" placeholder="Ex)010-1234-5678" name="pNumber">
    </div>
    
       <div class="form-group">
      <label for="email">이메일 :</label>
      <input type="email" class="form-control" placeholder="50자이하" name="email">
    </div>    
    
    <div class="form-group">
      <label for="gender">성별 :</label>
      <input type="radio" class="form-control" name = "gender" value="남자" checked>남자
      <input type="radio" class="form-control" name = "gender" value="여자">여자
    </div>
    

    <button type="submit" class="btn btn-primary">전송</button>
  </form>
</div>

</body>
</html>