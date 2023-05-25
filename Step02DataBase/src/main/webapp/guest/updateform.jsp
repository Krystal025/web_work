<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//1. 수정할 글의 번호를 얻어냄 
	int num = Integer.parseInt(request.getParameter("num"));
	//2. 번호를 이용해서 DB에 저장된 수정할 글의 정보를 불러옴 
	GuestDto dto = GuestDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/updateform.jsp</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<h1>글 내용 수정</h1>
		<form action="update.jsp" method="get">
			<div class="mb-1">
				<label class="form-label" for="num">번호</label> <input
					class="form-control" type="text" id="num" name="num"
					value="<%=dto.getNum()%>" readonly/>
			</div>
			<div class="mb-1">
				<label class="form-label" for="readonly">등록일</label> <input
					class="form-control" type="text" id="regdate" name="regdate"
					value="<%=dto.getRegdate()%>" readonly/>
			</div>
			<div class="mb-1">
				<label class="form-label" for="writer">작성자</label> <input
					class="form-control" type="text" id="writer" name="writer"
					value="<%=dto.getWriter()%>" />
			</div>
			<div class="mb-1">
				<label class="form-label" for="content">내용</label>
				<textarea class="form-control" id="content" name="content">
				<%=dto.getContent()%>
				</textarea>
			</div>
			<div class="mb-1">
				<label class="form-label" for="pwd">비밀번호</label> <input
					class="form-control" type="password" id="pwd" name="pwd"
					value="<%=dto.getPwd()%>" />
			</div>
			<button class="btn btn-primary" type="submit">수정</button>
			<button class="btn btn-warning" type="reset">취소</button>
		</form>
	</div>
</body>
</html>