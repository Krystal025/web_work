<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/fetch/test02.jsp</title>
</head>
<body>
	<input type="text" id="msg" placeholder="메세지 입력"/>
	<button id="sendBtn">전송</button>
	<script>
		//문자열을 입력하고 전송버튼을 눌렀을 떄 입력한 문자열을 읽어와서 send.jsp페이지로 전송되도록하기
		document.querySelector("#sendBtn").addEventListener("click", ()=>{
			//입력한 문자열 읽어오기
			const msg = document.querySelector("#msg").value;
			//fetch함수를 호출하면서 GET방식 파라미터로 send.jsp페이지를 요청하며 전달한다
			fetch("send.jsp?msg="+msg)
			.then(response=>response.text())
			.then((data)=>{
				console.log(data);
			});
		})
	</script>
</body>
</html>