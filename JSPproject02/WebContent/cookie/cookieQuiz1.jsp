<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 style="color: skyblue">CARE LAB</h1>
	<font>저희 사이트에 방문해 주셔서 감사합니다.</font>
	<%
		boolean signal = false;
		Cookie[] cookieArr = request.getCookies(); 
		if(cookieArr != null){
			for(Cookie c:cookieArr){
				if(c.getValue().equals("sweet")){
					signal = true;
		}}}%>
		<%if(signal==false){ %>
			<script type="text/javascript">
				window.open("quizpopup.jsp","","width=300,height=200,top=500,left=500");
			</script>
		<%} %>
</body>
</html>