<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
  <%
    String[] hobby = request.getParameterValues("hobby");
    
  
  for(int i=0; i<hobby.length; i++){
	  out.println(hobby[i]);
  }
  
  
  %>
</body>
</html>