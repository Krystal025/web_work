<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 삭제할 파일의 번호 
	int num = Integer.parseInt(request.getParameter("num"));
	//2. 삭제할 파일의 정보를 DB에서 읽어옴 
	FileDto dto=FileDao.getInstance().getData(num);
	//로그인된 아이디와 글의 작성자가 일치하는지 확인하기
	String id = (String)session.getAttribute("id");
	if(!dto.getWriter().equals(id)){
		//에러 응답하기
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "다른 사람의 파일을 지울 수 없습니다");
		//메소드를 여기서 끝내기
		return;
	}
	//3. 파일시스템에서 해당파일의 정보를 삭제 (webapp/upload폴더에서 삭제)
	String path = application.getRealPath("/upload")+File.separator+dto.getSaveFileName();
	File f = new File(path);
	f.delete();
	//4. DB에서 해당파일의 정보를 삭제 
	FileDao.getInstance().delete(num);
	//5. 응답 
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/file/list.jsp");	
%>
