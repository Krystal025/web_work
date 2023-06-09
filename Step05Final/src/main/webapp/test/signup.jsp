<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//아이디
String id = request.getParameter("id");
//비밀번호
String pwd = request.getParameter("pwd");
//직업
String job = request.getParameter("job");
//성별
String gender = request.getParameter("gender");
//취미
String[] hobby = request.getParameterValues("hobby");
String hobbyResult = "";
if (hobby != null) {
	for (int i = 0; i < hobby.length; i++) {
		//1번째 방에 있는 선택된 취미를 불러옴 
		String tmp = hobby[i];
		hobbyResult += tmp;
		if (i != hobby.length - 1) {
	hobbyResult += "/";
		}
	}
	//문자열에서 특정문자("/")로 구분해서 String[]을 얻어냄
	String[] result = hobbyResult.split("/");
	//문자열에 특정 문자가 포함되어있는지 여부를 확인 
	boolean isContain = hobbyResult.contains("xxx");
}

//null이면 체크를 안한것이고 null이 아니면 체크를 안한 것 
String allowEmail = request.getParameter("allowEmail");
String allowMessage = request.getParameter("allowMessage");
/*
	textarea에 입력한 문자열은 개행, tab, 공백기호가 모두 포함되어있음
	해당 문자열을 DB에 저장했다가 다시 불러와서 textarea에 출력하고 싶으멱
	textarea의 innerText에 출력하면 됨
*/
String comment = request.getParameter("comment");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test/signup.jsp</title>
</head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<body>
	<div class="container">
		<h1>회원가입 결과</h1>
		<p>회원님의 정보를 성공적으로 저장했습니다</p>
		<p><%=hobbyResult%></p>
		<form action="signup.jsp" method="post">
			<div class="form-floating mb-2">
				<input class="form-control" type="text" value="<%=id%>" name="id"
					id="id" placeholder="아이디 입력"> <label for="id">아이디</label>
			</div>
			<div class="form-floating mb-2">
				<input class="form-control" type="password" value="<%=pwd%>"
					name="pwd" id="pwd" placeholder="비밀번호 입력"> <label for="pwd">비밀번호</label>
			</div>
			<select class="form-select mb-2" id="job">
				<option value="">직업선택</option>
				<option value="programmer"
					<%=job.equals("programmer") ? "selected" : ""%>>프로그래머</option>
				<option value="doctor" <%=job.equals("doctor") ? "selected" : ""%>>의사</option>
				<option value="athlete"
					<%=job.equals("athlete") ? "selected" : ""%>>운동선수</option>
			</select>
			<fieldset>
				<legend>성별</legend>
				<div class="form-check-inline mb-2">
					<input class="form-check-input" value="man" type="radio" id="one"
						name="gender" <%=gender.equals("man") ? "checked" : ""%>> <label
						class="form-check-label" for="one">남</label>
				</div>
				<div class="form-check-inline mb-2">
					<input class="form-check-input" value="woman" type="radio" id="two"
						name="gender" <%=gender.equals("woman") ? "checked" : ""%>> <label
						class="form-check-label" for="two">여</label>
				</div>
			</fieldset>
			<fieldset>
				<legend>취미</legend>
				<div class="form-check mb-2">
					<input class="form-check-input" value="piano" name="hobby"
						type="checkbox" id="piano"
						<%=hobbyResult.contains("piano") ? "checked" : ""%>> <label
						class="form-check-label" for="piano">피아노</label>
				</div>
				<div class="form-check mb-2">
					<input class="form-check-input" value="game" name="hobby"
						type="checkbox" id="game"
						<%=hobbyResult.contains("game") ? "checked" : ""%>> <label
						class="form-check-label" for="game">게임</label>
				</div>
				<div class="form-check mb-2">
					<input class="form-check-input" value="etc" name="hobby"
						type="checkbox" id="etc"
						<%=hobbyResult.contains("etc") ? "checked" : ""%>> <label
						class="form-check-label" for="etc">기타</label>
				</div>
			</fieldset>
			<fieldset>
            <div>
            	<label class="form-label mb-2" for="comment">하고 싶은말</label>
            	<textarea class="form-control" name="comment" id="comment" rows="10"> 
            	<%= comment %></textarea>
            </div>
				<legend>개인정보 활용 동의</legend>
				<div class="form-check form-switch mb-2">
					<input class="form-check-input allow" value="email"
						name="allowEmail" type="checkbox" id="allowEmail"
						<%=allowEmail != null ? "checked" : ""%>> <label
						class="form-check-label" for="allowEmail">이메일 수신여부</label>
				</div>
				<div class="form-check form-switch mb-2">
					<input class="form-check-input allow" value="message"
						name="allowMessage" type="checkbox" id="allowMessage"
						<%=allowMessage != null ? "checked" : ""%>> <label
						class="form-check-label" for="allowMessage">광고성 문자 수신여부</label>
				</div>
				<div class="form-check form-switch mb-2">
					<input class="form-check-input" name="allowAll" type="checkbox"
						id="allowAll"> <label class="form-check-label"
						for="allowAll">전체 동의</label>
				</div>
			</fieldset>
			<button class="btn btn-outline-primary" type="submit">가입</button>
		</form>
	</div>
</body>
</html>