<%@page import="members.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dto" class="members.MemberDTO"/>
	<jsp:useBean id="dao" class="members.MemberDAO"/>
	<jsp:setProperty property="*" name="dto"/>
	<%
		String checkId = dao.checkId(dto.getId());
		if(checkId!=null){%>
			<script type="text/javascript">
				alert("이미 존재하는 아이디 입니다.")
				location.href="memberSingup.jsp"
			</script>
		<%}else{
			dao.singupMember(dto);
			session.setAttribute("login", dto.getId());%>
			<script type="text/javascript">
				alert("회원가입 성공")
				location.href="memberInfo.jsp"
			</script>
		<%} %>
		
	
</body>
</html>