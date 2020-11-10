<%@page import="java.util.Enumeration"%>
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
	
		Enumeration paramEnum = request.getParameterNames();
		while(paramEnum.hasMoreElements()){
			String n = (String)paramEnum.nextElement();
			out.print(n+"<br>");
		}
	
		String[] chk = request.getParameterValues("chk");
		if(chk != null) {
			for(int i=0;i<chk.length;i++){
				out.print(chk[i]);
			}
			out.print("<hr>");
			for(String s:chk){
				out.print(s);
			}
		}else{%>
			<table border='1'>
			<tr><th>값 없음</th></tr>
			</table>
		<% }%>

</body>
</html>