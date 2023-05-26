<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. post방식으로 전송되는 회원의 이름, 주소를 추출한다
	request.setCharacterEncoding("utf-8");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	String regdate = request.getParameter("regdate");
	//추가할 회원정보를 GuestDto  객체에 담는다
	GuestDto dto = new GuestDto();
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setPwd(pwd);
	dto.setRegdate(regdate);
	//2. DB에 저장한다
	boolean isSuccess = GuestDao.getInstance().insert(dto);
	//3. 응답한다
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<!-- 웹브라우저가 무시하는 주석 -->
	<%-- jsp 페이지가 무시하는 주석 (웹브라우저에 출력X)--%>
	<div class="container mt-3">
		<h1>알림</h1>
		<script>
		<%if(isSuccess){%>
			//알림창 띄우기
			alert("작성글이 등록되었습니다");
			//JavaScript로 페이지 이동
			location.href = "${pageContext.request.contextPath}/guest/list.jsp";
		<%}else{ %>
		//알림창 띄우기
		alert("작성글 등록 실패!");
		//JavaScript로 페이지 이동
		location.href = "${pageContext.request.contextPath}/guest/insertform.jsp";
		<%} %>
		</script>
	</div>
</body>
</html>