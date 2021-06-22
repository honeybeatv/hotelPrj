<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="index" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="rooms" class="nav-link">Rooms</a></li>
	          <li class="nav-item"><a href="restaurant" class="nav-link">Restaurant</a></li>
	          <li class="nav-item"><a href="about" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="blog" class="nav-link">Blog</a></li>
	          <li class="nav-item"><a href="contact" class="nav-link">Contact</a></li>
	        </ul>
	      </div>
	    </div>
			<!-- 로그인 전 -->
<!-- 			<c:choose>
				<c:when test="${session_flag==null || session_flag=='fail' }">
-->					<div class="collapse navbar-collapse" id="ftco-nav">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a href="../index" class="nav-link">Home</a></li>
							<li class="nav-item"><a href="/user/login" class="nav-link">Login</a></li>
							<li class="nav-item"><a href="/user/mypage" class="nav-link" >Mypage</a></li>
							<li class="nav-item"><a href="rooms" class="nav-link">Rooms</a></li>
							<li class="nav-item"><a href="restaurant" class="nav-link">Restaurant</a></li>
							<li class="nav-item"><a href="about" class="nav-link">About</a></li>
							<li class="nav-item"><a href="blog" class="nav-link">Blog</a></li>
							<li class="nav-item"><a href="contact" class="nav-link">Contact</a></li>
						</ul>
					</div>
<!--				</c:when>
<!--
				<!-- 로그인 후 -->
<!--				<c:otherwise>
					<h3>${session_id }님접속을 환영합니다.</h3> 
				<div class="collapse navbar-collapse" id="ftco-nav">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a href="index" class="nav-link">Home</a></li>
							<li class="nav-item"><a href="mypage" class="nav-link">Mypage</a></li>
							<li class="nav-item"><a href="logout" class="nav-link">Logout</a></li>
							<li class="nav-item"><a href="rooms" class="nav-link">Rooms</a></li>
							<li class="nav-item"><a href="restaurant" class="nav-link">Restaurant</a></li>
							<li class="nav-item"><a href="about" class="nav-link">About</a></li>
							<li class="nav-item"><a href="blog" class="nav-link">Blog</a></li>
							<li class="nav-item"><a href="contact" class="nav-link">Contact</a></li>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
-->		    </div>
	  </nav>

</body>
</html>