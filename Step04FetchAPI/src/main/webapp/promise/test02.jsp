<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<h1>Promise 테스트</h1>
	<script>
		let p1 = new Promise(function(resolve, reject){
			/*
			함수의 인자로 전달되는 resolve, reject는 함수이다
			resolve는 작업을 완료했을 떄 호출해야하는 함수 
			reject는 작업이 실패했을 떄 호출해야하는 함수
			resolve 함수가 호출되면 .then()안의 함수가 자동호출됨
			reject 함수가 호출되면 .catch()안의 함수가 자동호출됨
			*/
			//resolve();
			reject();
			console.log("reject함수를 호출했습니다");
		});
		//2. p1 Promise가 resolve되었을 때 호출되는 함수 등록
		p1.then(function(){
			console.log("then안의 함수가 호출되었습니댜");
		});
		//3. p1 Promise가 reject되었을 떄 호출되는 함수 등록 
		p1.catch(function(){
			console.log("catch안의 함수가 호출되었습니댜");
		});
	</script>
</body>
</html>