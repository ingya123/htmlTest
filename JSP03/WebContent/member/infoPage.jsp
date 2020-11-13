<%@page import="members.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function modify(){
		modifys.submit()
	}
	function remove(){
		
	}
</script>
</head>
<body>
<%@include file="../default/header.jsp"%>
	<jsp:useBean id="dto" class="members.MemberDTO"/>
	<jsp:useBean id="dao" class="members.MemberDAO"/>
	<%
		String id = request.getParameter("id");
		MemberDTO m = dao.slectMember(id);
		
	%>
	<form action="modifyPage.jsp" id="modifys">
		<input type="hidden" value="<%=m.getId()%>" name="id">
		<input type="hidden" value="<%=m.getName()%>" name="name">
		<input type="hidden" value="<%=m.getAddr()%>" name="addr">
		<input type="hidden" value="<%=m.getTel()%>" name="tel">
		<table>
			<caption><h2>개인 정보</h2></caption>
			<tr><th>아이디</th><td><%=m.getId() %></td></tr>
			<tr><th>비밀번호</th><td><%=m.getPwd() %></td></tr>
			<tr><th>이름</th><td><%=m.getName() %></td></tr>
			<tr><th>주소</th><td><%=m.getAddr() %></td></tr>
			<tr><th>전화번호</th><td><%=m.getTel() %></td></tr>
			<tr>
				
				<td><input type="submit" value="수정"></td>
				<td><input type="button" value="삭제" onclick="location.href='memberDel.jsp?id=<%=m.getId()%>'"></td>
			</tr>
		</table>
	</form>
<%@include file="../default/footer.jsp"%>
</body>
</html>