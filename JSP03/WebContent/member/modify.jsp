<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="dto" class="members.MemberDTO"/>
	<jsp:useBean id="dao" class="members.MemberDAO"/>
	<jsp:setProperty property="*" name="dto"/>
	<%
		System.out.println(dto.getId());
		System.out.println(dto.getName());
		dao.memberModify(dto);
	%>
	<script type="text/javascript">
		location.href="infoPage.jsp?id=<%=dto.getId()%>"
	</script>

</body>
</html>