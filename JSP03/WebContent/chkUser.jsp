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
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String user = request.getParameter("user");
	if(user.equals("user")){%>
		<jsp:forward page="userPage.jsp">
			<jsp:param value="user...." name="name"/>
		</jsp:forward>
	<%}else{%>
		<jsp:forward page="adminPage.jsp">
			<jsp:param value="addmin..." name="name"/>
		</jsp:forward>
	<%} %>


</body>
</html>