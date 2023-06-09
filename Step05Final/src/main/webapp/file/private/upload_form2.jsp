<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/file/private/upload_form2.jsp</title>
</head>
<body>
	<div class="container">
		<h3>파일 업로드 폼2입니다</h3>
		 <form action="upload2.jsp" method="post" enctype="multipart/form-data" id="myForm">
		  	<div>
		  		<label for="title">제목</label>
		  		<input type="text" name="title" id="title"/>
		  	</div>
		  	<div>
		  		<label for="myFile">첨부파일</label>
		  		<input type="file" name="myFile" id="myFile"/>
		  	</div>
		  	<button type="submit">업로드</button>
		 </form>
	</div>
	<script src="${pageContext.request.contextPath}/js/my_util.js"></script>
	<script>
	//폼에 "submit"이벤트가 일어났을 떄 실행할 함수 등록 
		document.querySelector("#myForm").addEventListener("submit",(e)=>{
			//폼 전송 막기
			e.preventDefault();
			//폼에 입력하거나 선택한 정보를 JavaScript로 직접 전송하기
			//폼에 입력한 데이터를 FormData에 담고
			
			let data = new FormData(e.target);  //e.target은 form의 참조값
			/*
			//fetch()함수가 리턴하는 Promise객체를 
			fetch("upload2.jsp",{
				method:"post",
				body:data
			})
			.then(res=>res.text())
			.then((data)=>{
				//data는 upload2.jsp페이지가 응답한 JSON형식의 문자열임
				console.log(data);
				//JSON.parse()함수를 이용해서 문자열을 실제 object 또는 array로 변환할 수 있음
				const result = JSON.parse(data);
				//result는 object
				console.log(result);
			});
			*/
			
			/*
			fetch("upload2.jsp",{
				method:"post",
				body:data
			})
			.then(res=>res.json())
			.then((data)=>{
				console.log(data);
				const result = JSON.parse(data);
				console.log(result);
			});
			*/
			//my_util.js안에 있는 함수를 활용하면 아래와 같음
			ajaxFormPromise(e.target)
			.then((res)=>res.json())
			.then((data)=>{
				console.log(data)
			})
		});
	</script>
	
</body>
</html>