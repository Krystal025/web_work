<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/fetch/test05.jsp</title>
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
					//백틱을 활용해서 li안에 메세지를 출력하고 
					let li = `<li>\${arr[i]}</li>`;
					//ul이 끝나기 전에 HTML로 평가해서 추가하기
					document.querySelector("#msgList").insertAdjacentHTML("beforeend", li);
				}
			});
		})
	</script>
</body>
</html>