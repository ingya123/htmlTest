<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:useBean id="dao" class="members.MemberDAO"/>
<script type="text/javascript">
	function signup(){
		
		if(document.getElementById('id').value==""){
			alert("아이디를 입력해주세요")
		}else if(document.getElementById('pwd').value==""){
			alert("비밀번호를 입력해주세요")
		}else if(document.getElementById('pwd').value
				!=document.getElementById('repwd').value){
			alert("비밀번호가 일치하지 않습니다")
		}else{
			signups.submit()
		}
	}
	
</script>
</head>
<body>
	<%@include file="../default/header.jsp"%>
	
		<form id="signups" action="signup.jsp">
			<table>
				<caption><h2>회원가입</h2></caption>
				<tr><td>아이디 </td><td><input type="text" name="id" id="id"></td></tr>
				<tr><td>비밀번호 </td><td><input type="text" name="pwd" id="pwd"></td></tr>
				<tr><td>비밀번호 확인 </td><td><input type="text" id="repwd"></td></tr>
				<tr><td>이름 </td><td><input type="text" name="name" id="name"></td></tr>
				<tr><td>주소 </td><td><input type="text" name="addr" id="addr"></td></tr>
				<tr><td>번호 </td><td><input type="text" name="tel" id="tel"></td></tr>
				<tr><td><input type="button" onclick="signup()" value="회원가입"></td></tr>
			</table>
		</form>
	<%@include file="../default/footer.jsp"%>
</body>
</html>