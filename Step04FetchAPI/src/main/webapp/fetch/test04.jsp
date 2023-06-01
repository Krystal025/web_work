<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/fetch/test04.jsp</title>
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
			fetch("get_msg2.jsp")
			.then(res=>res.text())
			.then((data)=>{
				//data는 ["희진", "수정", "영현"]형식의 JSON문자열이다
				console.log(data);
				//실제 배열(object)로 바꾸기
				const arr=JSON.parse(data);
				for(let i=0; i<arr.length; i++){
					let friends = document.createElement("li");
					friends.innerText = arr[i];
					document.querySelector("#msgList").append(friends);
				}
			});
		})
	</script>
</body>
</html>