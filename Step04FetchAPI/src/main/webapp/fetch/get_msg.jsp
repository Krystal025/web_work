<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DB에서 읽어온 더보기 메세지 목록이라고 가정 
	List<String> list = new ArrayList<>();
	list.add("희진");
	list.add("수정");
	list.add("영현");
%>
<%for(String tmp:list){%>
	<li><%=tmp %></li>
<%}%>