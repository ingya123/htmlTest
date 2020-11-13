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
	function check(){
		if(document.getElementById("pwd").value==''){
			alert("비밀번호는 필수 입력 사항입니다")
		}else{
			modify.submit()
		}
			
	}
</script>
</head>
<body>
	<%	
		request.setCharacterEncoding("utf-8"); 
		String userId=(String)session.getAttribute("login");
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "jsp", pwd = "1234";
		Connection con = DriverManager.getConnection(url,id,pwd);
		String sql = "select * from members where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, userId);
		ResultSet rs = ps.executeQuery();
	%>
	<h1>회원정보 수정 및 삭제</h1>
	<form action="modifyinfo.jsp" id="modify" method="post">
		<table>
			<%while(rs.next()){ %>
				<tr>
					<td>아이디:</td><td><%=rs.getString("id")%></td>
				</tr>
				<tr>
					<td>비밀번호:</td><td><input type="text" name="pwd" id="pwd" value="<%=rs.getString("pwd")%>"></td>
				<tr>
					<td>이름:</td><td><input type="text" name="name" value="<%=rs.getString("name")%>"></td>
				</tr>
				<tr>
					<td>주소:</td><td><input type="text" name="addr" value="<%=rs.getString("addr")%>"></td>
				</tr>
				<tr>
					<td>전화번호:</td><td><input type="text" name="tel" value="<%=rs.getString("tel")%>"></td>
				</tr>
			<%} %>
				<tr>
					<td>
						<input type="button" value="수정" onclick="check()">
						<input type="button" value="삭제" onclick="location.href='logout.jsp'">
					</td>
				</tr>
		</table>
	</form>
</body>
</html>