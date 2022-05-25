<%@page import="cs.dit.loginDao"%>
<%@page import="cs.dit.loginDto"%>
<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리 
	request.setCharacterEncoding("utf-8");
	//id, pwd 가져오기
	String id =request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//db연동으로 테이블에서 가져온 id와 pwd가 일치하는지 확인
	loginDao dao = new loginDao();
	int check = dao.checkUser(id, pwd);
	
	if(check == 1){
		out.println("Welcome!");
	}
	else if(check == 0){
		out.println("회원가입을 먼저 하세요!");
	}
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