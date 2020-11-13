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
		String userId=(String)session.getAttribute("login");
		String userPwd = (String)request.getParameter("pwd");
		String name = (String)request.getParameter("name");
		String addr = (String)request.getParameter("addr");
		String tel = (String)request.getParameter("tel");
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "jsp", pwd = "1234";
		Connection con = DriverManager.getConnection(url,id,pwd);
		String sql = "update members set pwd=?,name=?,addr=?,tel=? where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, userPwd);
		ps.setString(2, name);
		ps.setString(3, addr);
		ps.setString(4, tel);
		ps.setString(5, userId);
		ResultSet rs = ps.executeQuery();
	%>
	<script type="text/javascript">
		alert("수정이 완료되었습니다")
		location="main.jsp"
	</script>
</body>
</html>