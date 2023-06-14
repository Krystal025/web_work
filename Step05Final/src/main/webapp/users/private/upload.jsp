<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인된 아이디
	String id = (String)session.getAttribute("id");
	
	//1. 파일을 저장할 서버에서의 실제 경로 구성하기
	String realPath = application.getRealPath("/upload");
	//2. 아래의 MultipartRequest 객체가 예외 없이 잘 생성되면 webapp/upload폴더에 파일이 자동으로 저장됨
	MultipartRequest mr = new MultipartRequest(request,
			realPath,
			1024*1024*50,
			"utf-8",
			new DefaultFileRenamePolicy());
	//3. MultipartRequest객체의 메소드를 이용해서 폼 전송된 내용을 추출해야함
	String saveFileName = mr.getFilesystemName("image");//저장된 파일명
	//DB에 저장할 이미지 경로 구성하기
	String imagePath = "/upload/"+saveFileName;
	//DB에 수정반영 
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setProfile(imagePath);
	UsersDao.getInstance().updateProfile(dto);
	//리다이렉트 응답하기
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/users/private/info.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/users/private/upload.jsp</title>
</head>
<body>

</body>
</html>