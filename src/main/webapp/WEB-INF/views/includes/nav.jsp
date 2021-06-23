<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
			<a class="navbar-brand" href="index">Deluxe</a>
			
			<!-- 사용자에 따른 환영 문구 설정 -->
			<c:choose>
 				<c:when test="${session_flag=='success' && session_uadmin=='0'}">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link">${session_userid} 회원님 접속을 환영합니다.</a></li>
					</ul>
				</c:when>
 				<c:when test="${session_flag=='success' && session_uadmin=='1'}">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link">${session_userid} 관리자님 접속을 환영합니다.</a></li>
					</ul>
				</c:when>
			</c:choose>
			
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<!-- 사용자에 따른 메뉴 설정 -->
 			<c:choose>
				<c:when test="${session_flag==null || session_flag=='fail' }">
					<div class="collapse navbar-collapse" id="ftco-nav">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a href="../main/index" class="nav-link">Home</a></li>
							<li class="nav-item"><a href="/user/login" class="nav-link">Login</a></li>
							<li class="nav-item"><a href="rooms" class="nav-link">Rooms</a></li>
<!-- 	사용안하는것 같아서		<li class="nav-item"><a href="restaurant" class="nav-link">Restaurant</a></li>
		주석처리 했어요			<li class="nav-item"><a href="about" class="nav-link">About</a></li>
							<li class="nav-item"><a href="blog" class="nav-link">Blog</a></li>
							<li class="nav-item"><a href="contact" class="nav-link">Contact</a></li>
 -->						</ul>
					</div>
				</c:when>
 				<c:when test="${session_flag=='success' && session_uadmin=='0'}">
					<div class="collapse navbar-collapse" id="ftco-nav">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a href="../main/index" class="nav-link">Home</a></li>
							<li class="nav-item"><a href="/user/mypage" class="nav-link">Mypage</a></li>
							<li class="nav-item"><a href="/user/logout" class="nav-link">Logout</a></li>
							<li class="nav-item"><a href="rooms" class="nav-link">Rooms</a></li>
<!-- 						<li class="nav-item"><a href="restaurant" class="nav-link">Restaurant</a></li>
							<li class="nav-item"><a href="about" class="nav-link">About</a></li>
							<li class="nav-item"><a href="blog" class="nav-link">Blog</a></li>
							<li class="nav-item"><a href="contact" class="nav-link">Contact</a></li>
 -->
						</ul>
					</div>
				</c:when>
 				<c:when test="${session_flag=='success' && session_uadmin=='1'}">
					<div class="collapse navbar-collapse" id="ftco-nav">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a href="../main/index" class="nav-link">Home</a></li>
							<li class="nav-item"><a href="/admin/administration" class="nav-link">Administration</a></li>
							<li class="nav-item"><a href="/admin/logout" class="nav-link">Logout</a></li>
							<li class="nav-item"><a href="rooms" class="nav-link">Rooms</a></li>
<!-- 						<li class="nav-item"><a href="restaurant" class="nav-link">Restaurant</a></li>
							<li class="nav-item"><a href="about" class="nav-link">About</a></li>
							<li class="nav-item"><a href="blog" class="nav-link">Blog</a></li>
							<li class="nav-item"><a href="contact" class="nav-link">Contact</a></li>
 -->
						</ul>
					</div>
				</c:when>
			</c:choose>
	    </div>
	  </nav>

</body>
</html>