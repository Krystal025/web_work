<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 글의 번호(와 비밀번호)를 알아냄 
	int num = Integer.parseInt(request.getParameter("num"));
	String pwd = request.getParameter("pwd");
	//(비밀번호가 일치하면)DB에서 삭제
	GuestDto dto = null;
	boolean isSuccess = GuestDao.getInstance().delete(dto);
	//응답 
	String cPath = request.getContextPath();
	
	response.sendRedirect(cPath+"/guest/list.jsp");
%>    
