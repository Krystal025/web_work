<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//updateform으로 전송되는 값 읽어옴  
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	//읽어온 정보를 Dto에 담음
	CafeDto dto = new CafeDto();
	dto.setTitle(title);
	dto.setContent(content);
	//Dao를 이용하여 DB에 저장
	boolean isSuccess = CafeDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/cafe/private/update.jsp</title>
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<%if(isSuccess){ %>
			<p>
				수정되었습니다.
				<a href="${pageContext.request.contextPath}/cafe/list.jsp">게시글 목록</a>
			</p>
		<%}else{ %>
			<p>
				수정에 실패하였습니다.
				<a href="updateform.jsp">다시 수정</a>
			</p>
		<%} %>
	</div>
</body>
</html>