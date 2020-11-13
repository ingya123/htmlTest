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
<script type="text/javascript">
	function backBtn(){
		
	}
	
</script>
</head>
<body>
	<%
		String stuNum = (String)request.getParameter("stuNum"); 
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "jsp", pwd = "1234";
		Connection con = DriverManager.getConnection(url,id,pwd);
		String sql = "select * from student where stunum="+stuNum;
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
	%>
		<h1>인적 사항</h1>
		<%while(rs.next()){ %>
			학번:<%=rs.getString("stunum") %><br><br>
			이름:<%=rs.getString("name") %><br><br>
			국,영,수:<%=rs.getString("kor") %>,
					<%=rs.getString("eng") %>,
					<%=rs.getString("math") %><br><br>
		<%} %>
		<input type="button" value="뒤로" onclick="location.href='studentInfo.jsp'">
</body>
</html>