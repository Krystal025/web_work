<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 어두운 계열의 navbar 라면 data-bs-theme="dark"로 지정 
		navbar-expand-md : md영역에서 navbar-collapse가 펼쳐지도록 함 -->
<nav class="navbar navbar-expand-md" style="background-color: #EDC7DA"
	data-bs-theme="dark">
	<div class="container">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/index.jsp"> <svg
				xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
  			<path
					d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146ZM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5Z" />
			</svg> Main Page
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarText">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav me-auto">
				<li class="nav-item">
					<a class="nav-link ${param.current eq 'file' ? 'active' : '' }" href="${pageContext.request.contextPath}/file/list.jsp">자료실</a>
				</li>
				<li class="nav-item">
					<a class="nav-link ${param.current eq 'cafe' ? 'active' : '' }" href="${pageContext.request.contextPath}/cafe/list.jsp">Cafe</a>
			</ul>
			<div class="navbar-nav">
			<c:choose>
				<c:when test="${not empty id }">
					<a class="nav-link" href="${pageContext.request.contextPath}/users/private/info.jsp"><strong>${id }</strong></a>
					<a class="nav-link" href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
				</c:when>
				<c:otherwise>
					<a class="nav-link ${param.current eq 'login' ? 'active' : '' }" href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
					<a class="nav-link ${param.current eq 'signup' ? 'active' : '' }" href="${pageContext.request.contextPath}/users/signup_form.jsp">회원가입</a>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
</nav>