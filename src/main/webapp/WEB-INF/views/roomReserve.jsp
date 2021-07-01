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
							<span class="mr-2"><a href="index">Home</a></span> <span>숙소예약</span>
						</p>
						<h1 class="mb-4 bread">숙소 예약</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section contact-section bg-light" align="center">
		<div class="col-10" style="display: inline-block;">
			<form action="roomsWriteDo" id="searchForm" name="searchForm"
				class="bg-white p-5 " width="100%" method="post" 
				enctype="multipart/form-data"><input type="text" name="roomNo" value="${roomVo.roomNo}">



				<div class="form-inline form-group">
					<label for="userid" class="col-sm-2 control-label"
						style="font-weight: bolder;">방번호</label> <input type="hidden"
						id="userno" name="userno" value="${session_userno }">
					<div class="col-sm-7">
						<input type="hidden" class="form-control" style="width: 100%;"
							id="rname" name="rname">
					</div>

				</div>


				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">요구사항</label>
					<div class="col-sm-7">
						<textarea name="rinfo" cols="65" rows="10" id="rinfo"></textarea>
					</div>
				</div>
				<div class="col-md-3 d-flex">
					<div class="form-group p-4 align-self-stretch d-flex align-items-end">
						<div class="wrap">
							<label for="#">체크인 날짜</label> <input type="text"
								class="form-control checkin_date" id="datepicker1"
								name="startday" placeholder="체크인 날짜" style="cursor: pointer;"
								readonly>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex">
					<div
						class="form-group p-4 align-self-stretch d-flex align-items-end">
						<div class="wrap">
							<label for="#">체크아웃 날짜</label> <input type="text"
								class="form-control checkout_date" id="datepicker2"
								name="endday" placeholder="체크아웃 날짜" style="cursor: pointer;"
								readonly>
						</div>
					</div>
				</div>






				<input type="button" value="등록" class="btn btn-primary py-3 px-5"
					onclick="save()"> <input type="button" value="취소"
					class="btn btn-primary py-3 px-5" onclick="history.back()">

			</form>
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
	
	<script type="text/javascript">
	
		function save(){
			alert("입장");
			$.ajax({
				url:'/reserve/ajax/save',
				data: $('#searchForm').serialize(),
				dataType:'json',
				method:'POST',
				success: function(resp){
					if(resp.code == 'SUCCESS'){
						alert('성공');
						location.href='/user/userReservationView?userno=' + resp.userno; 
					}else{
						alert('에러가 발생했습니다.');
					}
				},
				error: function(){
					alert('에러가 발생했습니다.');
				}
			})
		}	
	
	</script>

</body>
</html>