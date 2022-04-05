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
%>
	이름: <%=request.getParameter("name")%><br>
	ID: <%=request.getParameter("id")%><br>
	PWD: <%=request.getParameter("pwd")%><br>
	생년월일: <%=request.getParameter("Bday")%><br>
	성별: <%=request.getParameter("gender")%><br>
	자기소개: <%=request.getParameter("AboutMe")%><br>
	관심언어: 
	<%
		for(int i = 0; i < lang.length; i++){
			out.println(lang[i]+" ");
		}
	%>
	

</body>
</html>