<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 닉네임을 읽어와서 
	request.setCharacterEncoding("utf-8");
	String nick = request.getParameter("nick");
	
	//HttpSesseion 객체의 setAttribute(key, value) 메소드를 이용해서 문자열(닉네임) 저장하기
	session.setAttribute("nick", nick);
	
	/*
		HttpSession객체의 setAttribute()메소드를 이용해서 저장한 데이터는
		1. 강제로 삭제하거나
		2. 웹브라우저를 닫거나
		3. 웹브라우저를 닫지 않았지만 30분동안(조정가능) 새로운 요청을 하지 않으면
		=> 지워짐 
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test/save.jsp</title>
</head>
<body>
	<p><strong><%=nick %></strong>(이)라는 닉네임을 저장하겠습니다</p>
	<p>30분동안 아무런 요청을 하지않거나 웹브라우저를 닫으면 자동 삭제됩니다</p>
	<a href="../index.jsp">인덱스로 이동하기</a>
</body>
</html>