<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//insertform으로 전송되는 글을 읽어옴
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	//작성자는 session에서 읽어옴
	String writer = (String)session.getAttribute("id");
	//읽어온 정보를 Dto에 담음
	CafeDto dto = new CafeDto();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setWriter(writer);
	//Dao를 이용하여 DB에 저장
	boolean isSuccess = CafeDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/cafe/private/insert.jsp</title>
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<%if(isSuccess){ %>
			<p>
				저장되었습니다.
				<a href="${pageContext.request.contextPath}/cafe/list.jsp">게시글 목록</a>
			</p>
		<%}else{ %>
			<p>
				저장에 실패하였습니다.
				<a href="insertform.jsp">다시 작성</a>
			</p>
		<%} %>
	</div>
</body>
</html>