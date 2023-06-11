<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//읽어올 때 한글이 깨지지 않도록 함
	request.setCharacterEncoding("utf-8");  //꼭 필요한지 확인!
	//updateform으로 전송되는 값 읽어옴
	int num = Integer.parseInt(request.getParameter("num"));
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<h1>알림</h1>
		<%if(isSuccess){ %>
			<p class="alert alert-success">
				수정되었습니다.
				<a class="alert-link" href="${pageContext.request.contextPath}/cafe/list.jsp">게시글 목록</a>
			</p>
		<%}else{ %>
			<p class="alert alert-danger">
				수정에 실패하였습니다!
				<a class="alert-link" href="updateform.jsp?num=<%=num%>">다시 수정</a>
			</p>
		<%} %>
	</div>
</body>
</html>