<%@page import="javax.swing.JOptionPane"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 글의 번호(와 비밀번호)를 알아냄 
	int num = Integer.parseInt(request.getParameter("num"));
	String pwd = request.getParameter("pwd");
	//(비밀번호가 일치하면)DB에서 삭제
	GuestDto dto = new GuestDto();
	dto.setNum(num);
	dto.setPwd(pwd);
	boolean isSuccess = GuestDao.getInstance().delete(dto);
	//응답 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/insertform.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<%if(isSuccess){%>
		<%
		//삭제 성공시 : list.jsp로 리다이렉트 이동시키기
		String cPath = request.getContextPath();
		response.sendRedirect(cPath+"/guest/list.jsp");	
		%>
	<%}else{ %>
		<script>
			alert("비밀번호가 일치하지 않습니다");
			location.href="${pageContext.request.contextPath}/guest/list.jsp";
		</script>
	<%} %>
</body>
</html>