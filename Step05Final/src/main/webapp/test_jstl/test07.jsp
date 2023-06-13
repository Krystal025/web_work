<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
   //sample 데이터
   request.setAttribute("msg", "abcde구라1234");
   request.setAttribute("str", "<div></div> 는 문단을 나타내는 요소 입니다.");
   request.setAttribute("content", "하나\n두울\n세엣");
   request.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jstl/test07.jsp</title>
</head>
<body>
	<h1>JSTL function (EL코드 블럭 안에서 사용하는 함수) 활용</h1>
	<p>"수정"이 포함되어있는지 여부 : ${fn:contains(msg, '수정')}</p>
	<c:if test="${fn:contains(msg, '수정')}">
		<p>메세지에 "수정"이 포함되어 있군요!</p>
	</c:if>
	<p>${str}</p>
	<p>${fn:escapeXml(str)}</p>
	<p>${content }</p>
	<%--content문자열에서 개행기호를 <br>로 바꿔서 출력 --%>
	<p>${fn:replace(content, newLine, '<br>') }</p>
</body>
</html>