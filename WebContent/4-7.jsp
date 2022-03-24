<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
    request.setCharacterEncoding("utf-8");
 String[] lang = request.getParameterValues("lang");
 
 
 for(int i=0; i<lang.length; i++){
	  out.println(lang[i]);
 }   
 
 	  out.println("<br>");
   String[] hobby = request.getParameterValues("hobby");
    
  
  for(int i=0; i<hobby.length; i++){
	  out.println(hobby[i]);
  }
  
  
  %>
</body>
</html>