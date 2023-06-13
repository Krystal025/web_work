<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//CafeDto 객체를 생성해서 글하나의 정보를 담고
	CafeDto dto = new CafeDto();
	dto.setNum(1);
	dto.setWriter("김수정");
	dto.setTitle("수정공주 페이지");
	
	//"dto"라는 키값으로 request scopedp ekarl
	request.setAttribute("dto", dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_el/test03.jsp</title>
</head>
<body>
	<div class="container">
		<%
			CafeDto result = (CafeDto)request.getAttribute("dto");
		%>
		<p>글번호 : <strong><%=result.getNum() %></strong></p>
		<p>작성자 : <strong><%=result.getWriter() %></strong></p>
		<p>제목 : <strong><%=result.getTitle() %></strong></p>
		
		<h3>EL을 이용해서 위의 작업하기</h3>
		<p>글번호 : <strong>${requestScope.dto.getNum() }</strong></p>
		<p>작성자 : <strong>${dto.getWriter() }</strong></p>
		<%--필드명만 적으면 자동으로 getter메소드를 호출해줌 --%>
		<p>제목 : <strong>${dto.title }</strong></p>
	</div>
</body>
</html>