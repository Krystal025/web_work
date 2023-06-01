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
			//무언가 작업을 하고 결과 데이터가 있다면
			let data = {num:1, name:"김수정"};
			//resolve 혹은 reject 함수를 호출하면서 전달할수도 있음  
			resolve(data);
			console.log("resolve 호출됨");
		}).then(function(result){
			console.log(result);
			console.log("then()의 내부 함수 호출됨");
		}).catch(function(){
			console.log("catch()의 내부 함수 호출됨");
		});
	</script>
</body>
</html>