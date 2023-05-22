<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//DB 연동 가능한지 테스트
	new DbcpBean(); //객체 생성했을 때 예외가 발생하지 않고 "Connection 얻어오기 성공"이 콘솔창에 출력되면 됨
%>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<div class="container">
		<h1>인덱스 페이지 입니다</h1>
	</div>
</body>
</html>