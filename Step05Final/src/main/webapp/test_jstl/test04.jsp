<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//test 를 위해 sample data를 request 영역에 담기
	request.setAttribute("score", 86);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jstl/test04.jsp</title>
</head>
<body>
	<c:if test="true">
		<p>True입니다</p>
	</c:if>
	<c:if test="${ 10%2 eq 0 }">
		<p>10은 짝수입니다</p>
	</c:if>
	<c:if test="${ 11%2 eq 0 }">
		<p>11은 짝수입니다</p>
	</c:if>
	<c:if test="${ score%2 eq 0 }">
		<p>${score } 점수는 짝수입니다</p>
	</c:if>	
	<p>획득한 점수는 <strong>${score }</strong>입니다</p>
	<p>
		따라서 이번 학기 학점은
		<c:choose>
			<c:when test="${score ge 90 }">A</c:when>
			<c:when test="${score ge 80 }">B</c:when>
			<c:when test="${score ge 70 }">C</c:when>
			<c:when test="${score ge 60 }">D</c:when>
			<c:otherwise>F</c:otherwise>	
		</c:choose>
		입니다
	</p>
	<p>
		<strong>${score }</strong>은
		<c:choose>
			<c:when test="${score%2 eq 0 }">
				짝수
			</c:when>
			<c:otherwise>
				홀수
			</c:otherwise>
		</c:choose>
		입니다
	</p>
	
	<%
		String id = (String)session.getAttribute("id");
	%>
	
	<%if(id == null){ %>
		<p>로그인이 필요합니다</p>
	<%}else{ %>
		<p><strong><%=id %></strong>님 로그인 중...</p>
	<%} %>
	<c:choose>
		<c:when test="${empty id }">
			<p>로그인이 필요합니다</p>
		</c:when>
		<c:otherwise>
		<strong><%=id %></strong>님 로그인 중...
		</c:otherwise>
	</c:choose>
	
</body>	
</html>