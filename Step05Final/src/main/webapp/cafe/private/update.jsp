<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	CafeDto dto = new CafeDto();
	
	int num = Integer.parseInt(request.getParameter("num"));
	dto.setNum(num);
	
	dto.setTitle(title);
	String title = request.getParameter("title");
	
	dto.setContent(content);
	String content = request.getParameter("content");
 --%>
<jsp:useBean id="dto" class="test.cafe.dto.CafeDto"/>
<jsp:setProperty property="num" name="dto"/>
<jsp:setProperty property="title" name="dto"/>
<jsp:setProperty property="content" name="dto"/>
<%
	//jsp 액션태그로 생성한 CafeDto객체에 담긴 글 내용에 수정을 반영
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
				<a class="alert-link" href="${pageContext.request.contextPath}/cafe/detail.jsp?num=<%=dto.getNum()%>">게시글 목록</a>
			</p>
		<%}else{ %>
			<p class="alert alert-danger">
				수정에 실패하였습니다.
				<a class="alert-link" href="updateform.jsp?num=<%=dto.getNum()%>">다시 수정</a>
			</p>
		<%} %>
	</div>
</body>
</html>