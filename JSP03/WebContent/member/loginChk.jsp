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
	
	<%String chekPw = dao.memberCheck(dto.getId()); %>
	
	<%if(chekPw==null){ %>
		<script type="text/javascript">
			alert("등록되지 않은 아이디 입니다.")
			location.href="login.jsp"
		</script>
	<%}else if(chekPw.equals(dto.getPwd())){%>
		<script type="text/javascript">
			<%session.setAttribute("login", dto.getId());	%>
			location.href="successLogin.jsp"
		</script>
	<%}else{ %>
		<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다")
		location.href="login.jsp"
		</script>
	<%} %>
</body>
</html>