<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check(){
		if(document.getElementById("id").value==''){
			alert("아이디는 필수 입력 사항입니다")
		}else if(document.getElementById("pwd").value==''){
			alert("비밀번호는 필수 입력 사항입니다")
		}else if(document.getElementById("pwd").value
			   !=document.getElementById("repwd").value){
			checkPw()
		}else{
			signup.submit()
		}
			
	}
	function checkPw(){
		document.getElementById("repwd").focus()
		document.getElementById("check").innerHTML="불일치!"
			
	}
</script>
</head>
<body>
	<form id="signup" action="chkRegister.jsp" method="post">
		<input type="text" placeholder="아이디" id="id" name="id">(*필수항목)<br>
		<input type="password" placeholder="비밀번호" id="pwd" name="pwd">(*필수항목)<br>
		<input type="password" placeholder="비밀번호 확인" id="repwd">
				<font id="check">(*필수항목)</font><br>
		<input type="text" placeholder="이름" name="name"><br>
		<input type="text" placeholder="주소" name="addr"><br>
		<input type="text" placeholder="전화번호" name="tel"><br>
		<input type="button" value="회원가입" onclick="check()"><br>
	</form>
</body>
</html>