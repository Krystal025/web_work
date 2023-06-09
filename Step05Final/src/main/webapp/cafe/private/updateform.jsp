<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/cafe/private/updateform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>작성글 수정</h1>
		<form action="update.jsp" method="post" enctype="multipart/form-data">
			<div>
		  		<label for="title">제목</label>
		  		<input type="text" name="title" id="title"/>
		  	</div>
		  	<div>
		  		<label for="content">내용</label>
		  		<textarea name="content" id="content" rows="10"></textarea>
		  	</div>
		  	<button type="submit">수정</button>
		</form>
	</div>
</body>
</html>