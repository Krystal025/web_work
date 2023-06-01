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
		new Promise(function(resolve, reject){ 
			resolve();
			console.log("resolve 호출됨");
		}).then(function(result){
			console.log("첫번째 then()의 내부 함수 호출됨");
			//여기에서 다시 Promise객체를 리턴하게 되면 뒤에 다시 .then()을 호출할 수 있음 
			return new Promise(function(resolve){
				resolve();
			});
		}).then(function(){
			console.log("두번쨰 then()의 내부 함수 호출됨");
		});
	</script>
</body>
</html>