<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.5.1.min.js"></script>
<script src="jquery-1.12.1-ui.js"></script>
<style type="text/css">
	h1{text-align: center; color: pink; 
	 font-family: fantasy; font-size: 50px;}
	.headerH1{text-align: right;}
	a{padding-left: 20px;}
</style>
<script type="text/javascript">
			function init(){
				<%String check = (String)session.getAttribute("login");%>
				if(<%=check%>==null){
					$(document).ready(function(){
						$(".loginBtn").text("로그인")
					})
				}else{
					$(document).ready(function(){
						$(".loginBtn").text("로그아웃")
					})
				}
			}
		</script>

</head>
<body onload="init()">
	<% 
	String url="";
	if(session.getAttribute("login")==null){
		url = "../member/login.jsp"; 
	 }else{
		url = "../member/logOut.jsp";
	 }%>
	
<h1>HEADER</h1>
<hr>
<div class="headerH1">

	<a href="../member/index.jsp">Home</a> 
	<a href="memberInfo.jsp">회원 정보</a>
	<a href="<%=url%>" class="loginBtn" id="loginBtn">로그인</a></div>
<hr>
</body>
</html>