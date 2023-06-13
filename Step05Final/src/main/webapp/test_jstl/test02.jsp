<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//테스트를 위해 sample 데이터를 request scope에 담는다
	List<String> names = new ArrayList<>();
	names.add("김희진");
	names.add("김수정");
	names.add("김영현");
	//"list"라는 키값으로 request scope에 ArrayList객체 담아두기
	request.setAttribute("list", names);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jstl/test02.jsp</title>
</head>
<body>
	<%
		//request영역에 "list"라는 키값으로 저장된 값을 읽어와서 원래 type으로 casting
		List<String> list = (List<String>)request.getAttribute("list");
	%>
	<h1>친구 목록</h1>
	<ul>
		<%for(String tmp:list) {%>
			<li><%=tmp %></li>
		<%} %>
	</ul>
	<ul>
		<c:forEach var="tmp" items="${requestScope.list }">
			<li>${tmp }</li>
		</c:forEach>
	</ul>
	<h1>친구 목록 인덱스</h1>
		<ul>
		<c:forEach var="tmp" items="${requestScope.list }" varStatus="status">
			<li>${tmp } <strong>${status.index }</strong></li>
		</c:forEach>
	</ul>
	<h1>친구 목록 순서</h1>
		<ul>
		<c:forEach var="tmp" items="${requestScope.list }" varStatus="status">
			<li>${tmp } <strong>${status.count }</strong></li>
		</c:forEach>
	</ul>
	<h1>친구 목록 첫번째 순서인지 여부</h1>
		<ul>
		<c:forEach var="tmp" items="${requestScope.list }" varStatus="status">
			<li>${tmp } <strong>${status.first }</strong></li>
		</c:forEach>
	</ul>
	<h1>친구 목록 마지막 순서인지 여부</h1>
		<ul>
		<c:forEach var="tmp" items="${requestScope.list }" varStatus="status">
			<li>${tmp } <strong>${status.last }</strong></li>
		</c:forEach>
	</ul>
</body>
</html>