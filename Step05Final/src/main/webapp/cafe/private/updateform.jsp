<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//수정할 글의 번호를 얻어옴
	int num = Integer.parseInt(request.getParameter("num"));
	//번호를 이용하여 제목과 내용을 얻어옴 
	CafeDto dto = CafeDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/cafe/private/updateform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>작성글 수정</h1>
		<form action="update.jsp" method="post" enctype="multipart/form-data">
			<div class="mb-1">>
		  		<label class="form-label" for="title">제목</label>
		  		<input class="form-control" type="text" name="title" id="title" value="<%=dto.getTitle()%>"/>
		  	</div>
		  	<div class="mb-1">>
		  		<label class="form-label" for="content">내용</label>
		  		<textarea class="form-control" name="content" id="content" rows="10">
		  		<%=dto.getContent() %>
		  		</textarea>
		  	</div>
		  	<button class="btn btn-primary" type="submit">수정</button>
		  	<button class="btn btn-warning" type="reset">취소</button>
		</form>
	</div>
</body>
</html>