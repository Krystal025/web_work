<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/insertform.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<h1>글 작성란</h1>
		<form action="insert.jsp" method="post">
			<div class="mb-1">
				<label for="writer" class="form-label">작성자</label> <input
					class="form-control" type="text" id="writer" name="writer">
			</div>
			<div class="mb-1">
				<label for="pwd" class="form-label">비밀번호</label> <input
					class="form-control" type="password" id="pwd" name="pwd">
			</div>
			<div class="mb-1">
				<label for="content" class="form-label">내용</label>
				<textarea class="form-control" type="text" id="content" name="content" cols="30" rows="10" placeholder="내용을 작성하세요">
				</textarea>
			</div>
			<button class="btn btn-success" type="submit">등록</button>
		</form>
	</div>
</body>
</html>