<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 글의 번호를 얻어옴
	int num = Integer.parseInt(request.getParameter("num"));
	//DB에서 삭제 
	boolean isSuccess = CafeDao.getInstance().delete(num);
	//리다이렉트 응답 
	String cPath = request.getContextPath();
	response.sendRedirect(cPath + "/cafe/list.jsp");
%>
