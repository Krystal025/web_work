<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test/signup_form.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
        <h1>다양한 form 디자인</h1>
        <form action="signup.jsp" method="post">
            <div class="form-floating mb-2">
                <input class="form-control" type="text" name="id" id="id" placeholder="아이디 입력">
                <label for="id">아이디</label>
            </div>
            <div class="form-floating mb-2">
                <input class="form-control" type="password" name="pwd" id="pwd" placeholder="비밀번호 입력">
                <label for="pwd">비밀번호</label>
            </div>
            <select class="form-select mb-2" id="job" name="job">
                <option value="">직업선택</option>
                <option value="programmer">프로그래머</option>
                <option value="doctor">의사</option>
                <option value="athelte">운동선수</option>
            </select>
            <fieldset>
                <legend>성별</legend>
                <div class="form-check-inline mb-2">
                    <input class="form-check-input" value="man" type="radio" id="one" name="gender" checked>
                    <label class="form-check-label" for="one">남</label>
                </div>
                <div class="form-check-inline mb-2">
                    <input class="form-check-input" value="woman" type="radio" id="two" name="gender">
                    <label class="form-check-label" for="two">여</label>
                </div>
            </fieldset>
            <fieldset>
                <legend>취미</legend>
                <div class="form-check mb-2">
                    <input class="form-check-input" value="piano" name="hobby" type="checkbox" id="piano">
                    <label class="form-check-label" for="piano">피아노</label>
                </div>
                <div class="form-check mb-2">
                    <input class="form-check-input" value="game" name="hobby" type="checkbox" id="game">
                    <label class="form-check-label" for="game">게임</label>
                </div>
                <div class="form-check mb-2">
                    <input class="form-check-input" value="etc" name="hobby" type="checkbox" id="etc">
                    <label class="form-check-label" for="etc">기타</label>
                </div>
            </fieldset>
            <div>
            	<label class="form-label mb-2" for="comment">하고 싶은말</label>
            	<textarea class="form-control" name="comment" id="comment" rows="10"></textarea>
            </div>
            <fieldset>
                <legend>개인정보 활용 동의</legend>
                <div class="form-check form-switch mb-2">
                    <input class="form-check-input allow" value="email" name="allowEmail" type="checkbox" id="allowEmail">
                    <label class="form-check-label" for="allowEmail">이메일 수신여부</label>
                </div>
                <div class="form-check form-switch mb-2">
                    <input class="form-check-input allow" value="message" name="allowMessage" type="checkbox" id="allowMessage">
                    <label class="form-check-label" for="allowMessage">광고성 문자 수신여부</label>
                </div>
                <div class="form-check form-switch mb-2">
                    <input class="form-check-input" name="allowAll" type="checkbox" id="allowAll">
                    <label class="form-check-label" for="allowAll">전체 동의</label>
                </div>
            </fieldset>
            <button class="btn btn-outline-primary" type="submit">가입</button>
        </form>
    </div>
    <script>
        document.querySelector("#allowAll").addEventListener("change",(e)=>{
            //전체 동의 체크 여부를 알아냄 
            const isChecked = e.target.checked;
            //클래스가 allow인 모든 요소의 참조값을 배열로 얻어내기
            const allows = document.querySelectorAll(".allow");
            //반복문 돌면서
            for(let i=0; i<allows.length; i++){
                //모든 checkbox의 check 상태 변경
                allows[i].checked = isChecked;
            }
            // //반복문 돌면서 forEach()함수도 활용해보기 
            // allows.forEach(item)=>{
            //     item.checked = isChecked;
            // }
        })
    </script>
</body>
</html>