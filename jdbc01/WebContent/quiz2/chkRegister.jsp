<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("utf-8"); 
		String userId = (String)request.getParameter("id");
		String userPwd = (String)request.getParameter("pwd");
		String name = (String)request.getParameter("name");
		String addr = (String)request.getParameter("addr");
		String tel = (String)request.getParameter("tel");
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "jsp", pwd = "1234";
		Connection con = DriverManager.getConnection(url,id,pwd);
		String sql = "insert into members values(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, userId);
		ps.setString(2, userPwd);
		ps.setString(3, name);
		ps.setString(4, addr);
		ps.setString(5, tel);
		try{
			ResultSet rs = ps.executeQuery();
			session.setAttribute("login", userId);
		}catch(Exception e){%>
		<script type="text/javascript">
			alert("이미 존재하는 아이디 입니다");
			location.href="register.jsp"
		</script>
		<%} %>
		<script type="text/javascript">
			alert("회원가입을 축하합니다");
			location.href="main.jsp"
		</script>
	
</body>
</html>