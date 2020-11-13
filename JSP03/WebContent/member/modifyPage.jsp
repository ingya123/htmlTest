<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../default/header.jsp"%>
	<jsp:useBean id="dto" class="members.MemberDTO"/>
	<jsp:useBean id="dao" class="members.MemberDAO"/>
	<%dto= dao.slectMember(request.getParameter("id")); %>
	<form action="modify.jsp" id="inPage" method="post">
		<input type="hidden" value="<%=dto.getId()%>" name="id">
		이 름 <input type="text" value="<%=dto.getName()%>" name="name"><br>
		주 소 <input type="text" value="<%=dto.getAddr()%>" name="addr"><br>
		전화번호<input type="text" value="<%=dto.getTel()%>" name="tel"><br>
		<input type="submit" value="완료">
		<input type="reset" value="취소">
	</form>
<%@include file="../default/footer.jsp"%>
</body>
</html>