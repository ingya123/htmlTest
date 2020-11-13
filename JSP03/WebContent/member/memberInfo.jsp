<%@page import="members.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.name{text-decoration: none; color: black;}
</style>
</head>
<body>
<%@include file="../default/header.jsp"%>
	<%if(session.getAttribute("login")==null){ %>
		<script type="text/javascript">
			alert("로그인 후 이용해주세요.")
			location.href="login.jsp"
		</script>
	<%} %>
	<jsp:useBean id="dto" class="members.MemberDTO"/>
	<jsp:useBean id="dao" class="members.MemberDAO"/>
	<%ArrayList<MemberDTO> members = dao.memberList(); %>
	
	<table border="1">
	<caption><h2>회원 목록</h2></caption>
		<tr><th>이름</th><th>주소</th><th>전화번호</th>
		<%for(MemberDTO m : members){ %>
			<tr>
				<td><a href="infoPage.jsp?id=<%=m.getId() %>" class="name"><%=m.getName() %></a></td>
				<td><%=m.getAddr() %></td>
				<td><%=m.getTel() %></td>
			</tr>
		<%} %>
	</table>
<%@include file="../default/footer.jsp"%>
</body>
</html>