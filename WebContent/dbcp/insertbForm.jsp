<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>로그인</title>
  <meta charset="utf-8">
<body>

<div class="container">
  <h2>글쓰기 화면</h2>
  <form action="insertbPro.jsp" method="post">
    <div class="form-group">
      <label for="id">제목</label>
      <input type="text" class="form-control" placeholder="50자 이하" name="btitle">
    </div> 
    <div class="form-group">
      <label for="id">글쓴이</label>
      <input type="text" class="form-control" placeholder="50자 이하" name="bname">
    </div> 
       <p>
    <div class="form-group">
      <label for="udate">게시판 유형 :</label>
      		<select name = "boradtype">
           		<option value="성격 유형별 게시판" selected>성격 유형별 게시판</option>
            	<option value="다같이 수다 게시판">다같이 수다 게시판</option>
            	<option value="건의사항 게시판">건의사항 게시판</option>
            </select>
    </div>
    <p>
    <div class="form-group">
      <label for="pNumber">게시판 내용</label>
    </div>
    <p>
    <textarea cols="50" rows="20" name="borad"></textarea>
    <p>
    <button type="submit" class="btn btn-primary">저장</button>
  </form>
</div>

</body>
</html>