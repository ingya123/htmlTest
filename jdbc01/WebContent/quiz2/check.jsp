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
		String userId=(String)request.getParameter("id");
		String userPwd=(String)request.getParameter("pwd");
		if(userId.equals("")){
			userId=null;
		} 
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "jsp", pwd = "1234";
		Connection con = DriverManager.getConnection(url,id,pwd);
		String sql = "select name,pwd from members where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, userId);
		ResultSet rs = ps.executeQuery();
	%>
	<%while(rs.next()){
			if(userPwd.equals(rs.getString("pwd"))){
				session.setAttribute("login", userId);
			%>
	<script type="text/javascript">
				alert("<%=rs.getString("name")%>님, 반갑습니다.");
					location.href="main.jsp";
				</script>
	<% }else{%>	
	
	<script type="text/javascript">
					alert("비밀번호 임마 다르잖아")
					location.href="login.jsp"
					</script>
		<%}}%>		
							
	<script type="text/javascript">
			alert("일치하는 아이디가 없습니다")
			location.href="login.jsp"
		</script>

</body>
</html>