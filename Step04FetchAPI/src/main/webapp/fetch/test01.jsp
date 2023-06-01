<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/fetch/test01.jsp</title>
</head>
<body>
	<h1>Fetch 함수 테스트</h1>
	<button id="myBtn">눌러보세요</button>
	<a href="${pageContext.request.contextPath}/index.jsp">눌러보세요</a>
	<script>
		document.querySelector("#myBtn").addEventListener("click", ()=>{
			
			const msg = prompt("메세지 입력");
			console.log("입력완료!");
			console.log("------");
			
			fetch("${pageContext.request.contextPath}/index.jsp")
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				console.log(data);
			});
			console.log("요청했습니다!");
		});
	</script>
</body>
</html>