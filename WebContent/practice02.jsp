<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
  String[] list = {"moon", "sun", "mercury", "venus", "earth"};
  pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 실습</title>
</head>
<body>
  <c:forEach var="a" items="${list}">
    ${a}<br>
  </c:forEach><br>
  ${list[0]}<br>
  
  <c:out value="안녕하세요"></c:out> ${"안녕하세요" }<br>
  <c:set var="id" value="gildong"/>
  <c:set var="income" value="2000000"/>
  ${id}의 수입은 ${income}입니다<br>
  <c:out value="${id}의 수입은 ${income}입니다"></c:out><br>
  
  <c:if test="${income >= 2000000}" var="a">
  <c:out value="${income}"></c:out>입니다!<br>
  </c:if>
  ${a}<br>
  <c:if test="${empty param.score}">
   매개변수값이 비어있습니다
  </c:if>
  <c:if test="${!empty param.score}">
  <c:out value="${param.score}"></c:out>
  </c:if>

  ${empty param.score ? "매개변수값이 비어있습니다"	 : param.score}<br>
  
  <c:forEach var="i" begin="1" end="5">
  ${i}<br>
  </c:forEach>
  <br>
  
  
    
</body>
</html>