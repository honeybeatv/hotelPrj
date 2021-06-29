<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<c:if test="${session_flag==null || session_flag=='fail' }">
	<script type="text/javascript">
		alert("로그인을 하셔야 예약이 가능합니다.")
	</script>
	<c:redirect url="../user/login" />
</c:if>

<title>숙소 등록</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i"
	rel="stylesheet">

<link rel="stylesheet" href="/static/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/static/css/animate.css">

<link rel="stylesheet" href="/static/css/owl.carousel.min.css">
<link rel="stylesheet" href="/static/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/static/css/magnific-popup.css">

<link rel="stylesheet" href="/static/css/aos.css">

<link rel="stylesheet" href="/static/css/ionicons.min.css">

<link rel="stylesheet" href="/static/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/static/css/jquery.timepicker.css">

<link rel="stylesheet" href="/static/css/flaticon.css">
<link rel="stylesheet" href="/static/css/icomoon.css">
<link rel="stylesheet" href="/static/css/style.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
</script>
<!--<script src="http://code.jquery.com/jquery-latest.min.js"></script>   -->
<script type="text/javascript">
	
</script>

</head>
<body>

	<c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>

	<div class="hero-wrap"
		style="background-image: url('/static/images/bg_1.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
				<div
					class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
					<div class="text">
						<p class="breadcrumbs mb-2">
							<span class="mr-2"><a href="index">Home</a></span> <span>숙소
								예약</span>
						</p>
						<h1 class="mb-4 bread">숙소 예약</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="row">
						<div class="col-md-12 ftco-animate">
							<h2 class="mb-4">${roomVo.rname }</h2>
							<div class="single-slider owl-carousel">
								<div class="item">
									<div class="room-img"
										style="background-image: url(../static/upload/${roomVo.rpicture});"></div>
								</div>
								<div class="item">
									<div class="room-img"
										style="background-image: url(../static/images/room-2.jpg);"></div>
								</div>
								<div class="item">
									<div class="room-img"
										style="background-image: url(../static/images/room-3.jpg);"></div>
								</div>
							</div>
						</div>
						<div class="col-md-12 room-single mt-4 mb-5 ftco-animate">
							<p>${roomVo.rinfo }</p>
							<div class="d-md-flex mt-5 mb-5">
								<ul class="list">
									<li><span>방 타입: </span> ${roomVo.rtype }</li>
									<li><span>가용인원: </span>${roomVo.rpeople }명</li>
									<li><span>주소: </span>${roomVo.raddress }</li>
								</ul>
								<ul class="list ml-md-5">
									<li><span>편의 시설: </span> <c:if
											test="${roomVo.rsmoke ne null }">흡연실</c:if> <c:if
											test="${roomVo.rpet ne null }">, 반려동물</c:if></li>
									<li><span>침대 갯수: </span>${roomVo.rbed }개</li>
									<li><span>도시: </span>${roomVo.rcity }</li>
								</ul>

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		
		
	</section>



	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script src="/static/js/jquery.min.js"></script>
	<script src="/static/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/static/js/popper.min.js"></script>
	<script src="/static/js/bootstrap.min.js"></script>
	<script src="/static/js/jquery.easing.1.3.js"></script>
	<script src="/static/js/jquery.waypoints.min.js"></script>
	<script src="/static/js/jquery.stellar.min.js"></script>
	<script src="/static/js/owl.carousel.min.js"></script>
	<script src="/static/js/jquery.magnific-popup.min.js"></script>
	<script src="/static/js/aos.js"></script>
	<script src="/static/js/jquery.animateNumber.min.js"></script>
	<script src="/static/js/bootstrap-datepicker.js"></script>
	<script src="/static/js/jquery.timepicker.min.js"></script>
	<script src="/static/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="/static/js/google-map.js"></script>
	<script src="/static/js/main.js"></script>

</body>
</html>