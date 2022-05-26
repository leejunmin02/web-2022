<%@page import="javax.servlet.http.Cookie"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="cs.dit.loginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  loginDto dto = new loginDto("gildong", "홍길동", "1111");
  pageContext.setAttribute("dto", dto);  
  
  String list[] = {"moon", "sun", "jupiter", "mars", "venus", "mercury"};
  pageContext.setAttribute("list", list);
  
  List<String> namelist = new LinkedList<String>();
  namelist.add("홍길동");
  namelist.add("임꺽정");
  namelist.add("일지매");
  pageContext.setAttribute("namelist", namelist);
  
  Cookie mycookie = new Cookie("v", "happy");
  response.addCookie(mycookie);
  
  session.setAttribute("a", "happy day");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 실습</title>
</head>
<body>
   쿠키: ${cookie.v.value}<br>
   세션: ${a}님 반갑습니다!<br>
   문자열 : ${"반갑습니다!!!"}<br>
   연산자 : ${100+1234}<br>
   연산자 : ${100>67}<br>
   내장객체(param) : ${param.name}<br>
  empty연산 : ${empty param.name}<br>
   삼항연산 : ${!empty param.name ? param.name : "매개변수가 비어있어요"}
  <hr>
  ID : ${dto.id}<br> 
  NAME : ${dto.name}<br>
  PWD : ${dto.pwd}<br>
 <hr>
  프로토콜 : ${pageContext.request.protocol}<br>
  서버명 : ${pageContext.request.serverName}<br>
 <hr>
 ${list[3]}<br>   
</body>
</html>