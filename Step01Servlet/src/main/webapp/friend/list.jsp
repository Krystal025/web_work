<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/friend/list.jsp</title>
</head>
<body>
<%
	List<String> names = new ArrayList<>();
	names.add("김구라");
	names.add("해골");
	names.add("원숭이");
%>
	<h1>친구 목록입니다</h1>
	
	<ul>
	<%for(String tmp:names){%>
		<li><%=tmp%></li>	
	<%} %>
	</ul>
</body>
</html>