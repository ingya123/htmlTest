<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dao" class="members.MemberDAO"/>
	<%dao.deleteMember(request.getParameter("id")); %>
	<script type="text/javascript">
		alert("아이디가 삭제되었습니다.")
		location.href="logOut.jsp"
	</script>
</body>
</html>