<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/fetch/test03.jsp</title>
</head>
<body>
	<button id="moreBtn">더보기</button>
	<ul id="msgList">
		<li>하나</li>
		<li>두울</li>
		<li>세엣</li>
	</ul>
	<script>
		document.querySelector("#moreBtn").addEventListener("click", ()=>{
			fetch("get_msg.jsp")
			.then(res=>res.text())
			.then((data)=>{
				/*
				data는 
				"<li>희진</li>
				<li>수정</li>
				<li>영현</li>" 형식의 문자열이다 
				*/
				console.log(data);
				//ul요소가 끝나기 전에 HTML요소로 평가하여 추가하기 
				document.querySelector("#msgList")
				.insertAdjacentHTML("beforeend", data);
			});
		})
	</script>
</body>
</html>