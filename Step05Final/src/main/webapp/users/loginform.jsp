<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET 방식 파라미터 url이라는 이름으로 전달되는 값이 있는지 읽어와본다
	String url = request.getParameter("url");
	//만일 넘어오는 값이 없다면
	if(url == null){
		//로그인 후에 인덱스 페이지로 갈 수 있도록 한다
		String cPath = request.getContextPath();
		url = cPath+"/index.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/users/loginform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="login" name="current"/>
	</jsp:include>
	<div class="container mt-3">
		<h1>로그인 폼</h1>
		<form action="login.jsp" method="post">
			<!-- 폼에 입력한 정보 외에 추가로 같이 전송할 값이 있으면 input="hidden"을 활용 -->
			<input type="hidden" name="url" value="<%=url%>">
			<div>
				<label class="form-label" for="id">아이디</label>
				<input class="form-control" type="text" name="id" id="id">
			</div>
			<div>
				<label class="form-label" for="pwd">비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd">
			</div>
			<button class="btn btn-secondary mt-3" type="submit">로그인</button>
		</form>
	</div>
</body>
</html>