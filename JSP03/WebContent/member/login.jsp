<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn {
	height: 48px;
	width: 70px;
}
</style>
<script type="text/javascript">
	function login(){
		loginPage.submit()
	}
</script>
</head>
<body>
	<%@include file="../default/header.jsp"%>
	<h3>로그인 페이지 입니다</h3>
	<form action="loginChk.jsp" id="loginPage">
		<table>
			<tr>
				<td><input type="text" placeholder="아이디" name="id"></td>
				<td rowspan="2"><input type="button" onclick="login()" class="btn" value="로그인">
				</td>
			</tr>
			<tr>
				<td><input type="password" placeholder="비밀번호" name="pwd"></td>
			</tr>
		</table>
		<a href="memberSingup.jsp">회원가입</a>
	</form>
	<%@include file="../default/footer.jsp"%>
</body>
</html>