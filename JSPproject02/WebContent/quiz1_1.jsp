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
	<%request.setCharacterEncoding("utf-8"); %>
	<%	
		out.print("name:"+request.getParameter("name")+"<br>");
		out.print("gender:"+request.getParameter("gender")+"<br>");
		Enumeration paramEnum = request.getParameterNames();
		while(paramEnum.hasMoreElements()){
			String n = (String)paramEnum.nextElement();
			if(n.equals("season")){
				out.print(n+":"+request.getParameter(n)+"<br>");
			}
			
		}
	
	%>
	

</body>
</html>