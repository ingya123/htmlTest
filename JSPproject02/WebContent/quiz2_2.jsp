<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 입니다</h1>
	<h3>공지사항 입니다.</h3>
	jsp application을 이용한 조회수 올리기 문제 입니다<br><br>
	<a href="quiz2_1.jsp">돌아가기</a>
	
	<%		
			if(application.getAttribute("hits")==null){ 
				application.setAttribute("hits", 1);
			}else{
				int a = (int)application.getAttribute("hits")+1;
				application.setAttribute("hits", a);
			}
		%>
</body>
</html>