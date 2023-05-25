<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>       
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>index.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%-- /include/navbar.jsp 페이지에게 이 부분만 응답하도록 한다 
		include되는 jsp페이지에 파라미터를 전달할수도 있다--%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="current"/>
	</jsp:include>
	<div class="container mt-3">
		<h1>인덱스 페이지</h1>
		<p>${pageContext.request.contextPath}</p>	
		<ul>
			<li><a href="${pageContext.request.contextPath}/member/list.jsp" class="text-reset text-decoration-none">
			회원 목록보기</a></li>
			<li><a href="/Step02DataBase/guest/list.jsp" class="text-reset text-decoration-none">
			방명록 목록보기</a></li>
		</ul>
	</div>
</body>
</html>