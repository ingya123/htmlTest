<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>delSession<br>
	<h1>세션이 삭제 되었습니다</h1>
	<%
		//session.removeAttribute("age");
		//session.setMaxInactiveInterval(5);
		session.invalidate();
	%>
	<a href="getSession.jsp">setSession(세션확인)이동</a>
	<a href="setSession.jsp">delSession(세션설정)이동</a>

</body>
</html>