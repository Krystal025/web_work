<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 회원 가입정보를 읽어와서 
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	//2. Dto 에 담아서 
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	//3. Dao 를 이용해서 DB에 저장하고 
	boolean isSuccess = UsersDao.getInstance().insert(dto);
	//4. 응답한다 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/users/signup.jsp</title>
</head>
<body>
	<div class="container mt-3">
		<h1>알림</h1>
		<%if(isSuccess){ %>
			<p>
				<strong><%=id %></strong>님 가입되었습니다.
				<a href="loginform.jsp">로그인 하러가기</a>
			</p>
		<%}else{ %>
			<p>
				가입이 실패되었습니다. 
				<a href="signup_form.jsp">다시 가입하러 가기</a>
			</p>
		<%} %>
	</div>
</body>
</html>