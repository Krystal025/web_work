<%@page import="java.net.URLEncoder"%>
<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼으로 전송된 아이디, 비밀번호를 읽어옴 
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	//2. UsersDto에 담아서
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	//3. UsersDao에 전달해서 유효한 정보인지 확인한 후 
	boolean isValid = UsersDao.getInstance().isValid(dto);
	/*4. 유효한 정보면 로그인처리하고 응답한다
		 유효한 정보가 아니면 아이디 혹은 비밀번호가 틀려요 라고 응답한다 
		 
		 [로그인 처리]
		session scope에 "id"라는 키값으로 로그인된 아이디를 저장하면 됨
		여기서 session scope란 HttpSession 객체의 setAttribute()메소드를 
		이용해서 값을 저장하는 영역을 말한다 */
	if(isValid){
		//session scope에 id라는 키값으로 로그인된 아이디 담기
		session.setAttribute("id", id);
	}
	
	//로그인 후 가야한 목적지 정보
	String url = request.getParameter("url");
	//로그인 실패를 대비해서 목적지 정보를 인코딩한 결과도 준비 
	String encodedUrl = URLEncoder.encode(url);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/users/login.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
	<%if(isValid){ %>
		<p class="alert alert-success">
			<strong><%=dto.getId() %></strong>님 로그인 되었습니다.
			<a href="<%=url%>">확인</a>
		</p>
	<%}else{ %>
		<p class="alert alert-danger">
			아이디 혹은 비밀번호가 틀렸습니다. 
			<a href="${pageContext.request.contextPath}/users/login_form.jsp?url=<%=encodedUrl%>">다시시도</a>
		</p>
	<%} %>
	</div>
</body>
</html>