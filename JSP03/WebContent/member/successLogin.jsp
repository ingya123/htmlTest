<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.5.1.min.js"></script>
<script src="jquery-1.12.1-ui.js"></script>

</head>
<body>
	<%@ include file="../default/header.jsp" %>
	<h1>로그인 성공</h1>
	<%String se = (String)session.getAttribute("login"); 
		if(se!=null){
		}else{
			session.invalidate();
		%>
		<script type="text/javascript">
			
			
		</script>	
		<%}%>
	
	<%@ include file="../default/footer.jsp" %>
</body>
</html>