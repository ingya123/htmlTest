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
		int num = 123;
		System.out.println(num);
		out.print(num);
	%>
	<hr>
	<% String message = "JSP";
		out.print("<h1>"+message+"시작입니다"+"</h1>");%>
		<h1><%out.print(message); %>끝입니다</h1>
	<hr>
		<%= message %>
	<br>
	<hr>	
		<% int a = 10,b = 20; %>
		<%=a%> + <%= b%> = <%= a+b%>
		<br>
		<% int c=a+b; out.print(a+" + "+b+" = "+c); %>
		<hr>
		<input type="text" value="10 + 20 = <%=a+b %>">
	<br><hr>
		<%	int sum=0;
			int even=0;
			int odd=0;
			for(int i=1;i<=100;i++){
				sum+=i;
				if(i%2==0)
					even+=i;
				else
					odd+=i;
			}
		%>
		1 + 2 + 3 + .... + 100 = <%=sum %><br>
		1 ~ 100 까지의 짝수의 합 : <%=even %><br>
		1 ~ 100 까지의 홀수의 합 : <%=odd %><br>
		<hr>
		<%! int cnt01 = 1; %>
		<%= cnt01++ %>
</body>
</html>