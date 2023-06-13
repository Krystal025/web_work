<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="java.util.List"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한 페이지에 몇개의 행씩 표시할 것인지
	final int PAGE_ROW_COUNT = 5;
	//하단 페이지 버튼을 몇개씩 표시할 것인지 
	final int PAGE_DISPLAY_COUNT = 5;

	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정 (넘어오는 값이 없으면 1페이지를 보여줌)
	int pageNum = 1;
	
	//페이지 번호가 파라미터로 전달되는지 읽어와 봄
	String strPageNum = request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어온다면
	if(strPageNum != null){
		//숫자로 바꿔서 보여줄 페이지 번호로 지정
		pageNum = Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum = 1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum = pageNum*PAGE_ROW_COUNT;
	
	//하단 시작 페이지 번호
	int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum = startPageNum+PAGE_DISPLAY_COUNT-1;
	//전체 글의 갯수
	int totalRow = CafeDao.getInstance().getCount();
	//전체 페이지의 갯수 
	int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값임
	if(endPageNum > totalPageCount){
		endPageNum = totalPageCount; //보정 
	}
	//FileDto에 startRowNum과 endRowNum을 담음 
	CafeDto dto = new CafeDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);	

	List<CafeDto> list = CafeDao.getInstance().getList(dto);
	//로그인된 아이디 읽어옴 (로그인이 되어있지 않으면 null) 
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/cafe/list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>게시글 목록</h1>
		<a href="private/insertform.jsp">새글 작성</a>
		<table class="table table-striped">
			<thead class="table-dark">
			 <tr>
			 	<th>글번호</th>
			 	<th>작성자</th>
			 	<th>제목</th>
			 	<th>조회수</th>
			 	<th>등록일</th>
			 </tr>
			</thead>
			<tbody>
			<%for(CafeDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td>
					<a href="detail.jsp?num=<%=tmp.getNum()%>">
					<%=tmp.getTitle() %>
					</a>	
				</td>
				<td><%=tmp.getViewCount() %></td>
				<td><%=tmp.getRegdate() %></td>
			</tr>
			<%} %>
			</tbody>
		</table>
		<nav>
			<ul class="pagination mt-5">
			<%--startPageNum이 1이 아닌 경우에만 Prev 링크를 제공--%>
			<%if(startPageNum != 1){ %>
				<li class="page-item">
					<a class="page-link" href="list.jsp?pageNum=<%= startPageNum-1%>">Prev</a>
				</li>
			<%} %>
			<%for(int i=startPageNum; i<=endPageNum; i++){ %>
				<li class="page-item <%=i==pageNum ? "active" : "" %>">
					<a class="page-link" href="list.jsp?pageNum=<%=i%>"><%=i %></a>
				</li>
			<%} %>
			<%--마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next링크 제공--%>
			<%if(endPageNum < totalPageCount){ %>
				<li class="page-item">
					<a class="page-link" href="list.jsp?pageNum=<%= endPageNum+1%>">Next</a>
				</li>
			<%} %>
			</ul>
		</nav>
	</div>
</body>
</html>