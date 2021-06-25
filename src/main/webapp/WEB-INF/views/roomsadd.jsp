<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

 <c:if test="${session_flag==null || session_flag=='fail' }">
	<script type="text/javascript">
		alert("로그인을 하셔야 글쓰기가 가능합니다.")
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
							<span class="mr-2"><a href="index">Home</a></span> <span>숙소등록</span>
						</p>
						<h1 class="mb-4 bread">숙소등록</h1>
					</div>
				</div>
			</div>
		</div>
	</div>


	<section class="ftco-section contact-section bg-light" align="center">
		<div class="col-10" style="display: inline-block;">
			<form action="roomsWriteDo" class="bg-white p-5 " width="100%">

				
				
				<div class="form-inline form-group">
					<label for="userid" class="col-sm-2 control-label"
						style="font-weight: bolder;">방이름</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" style="width: 100%;"
							id="userid" name="rname">
					</div>
				
				</div>
				
				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">방타입</label>
					<div class="col-sm-7">
						<select name="rtype">
							<option value="apt">아파트</option>
		                     <option value="house">주택</option>
		                     <option value="walkup">공동주택</option>
		                     <option value="hotel">호텔</option>
		                     <option value="residence">레지던스</option>
		                     <option value="hostel">호스텔</option>
	                    	<option value="etc">기타</option>
						</select>
					</div>
				</div>

				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">인원수</label>
					<div class="col-sm-7">
						<select name="rpeople">
							<option value="1"selected>1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명</option>
							<option value="6">6명 이상</option>
						</select>
					</div>
				</div>

				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">방정보</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" style="width: 100%;" id=""
							name="rinfo">
					</div>
				</div>

				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">사진</label>
					<div class="col-sm-7">
						<input type="file" class="" style="width: 100%;" id="file"
							name="rpicture">
					</div>
					
					
				</div>

				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">도시</label>
					<div class="col-sm-7">
						<select name="rcity">
							<option value="seoul"selected>서울</option>
							<option value="incheon">인천</option>
							<option value="sejong">세종</option>
							<option value="daejeon">대전</option>
							<option value="daegu">대구</option>
							<option value="ulsan">울산</option>
							<option value="busan">부산</option>
							<option value="Gwangju">광주</option>
							<option value="jeju">제주</option>
						</select>
					</div>
				</div>
				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">1박 가격</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" style="width: 100%;" id=""
							name="rprice">
					</div>
				</div>
				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">침실수</label>
					<div class="col-sm-7">
						<select name="rroom">
							<option value="1"selected>침실 1</option>
							 <option value="2">침실 2</option>
		                    <option value="3">침실 3</option>
		                    <option value="4">침실 4</option>
		                    <option value="5">침실 5</option>
		                    <option value="6">침실 6</option>
	                    	<option value="7">침실 7 이상</option>
						</select>
					</div>
				</div>
					<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">침대수</label>
					<div class="col-sm-7">
						<select name="rbed">
							<option value="1"selected>침대 1</option>
	                      	<option value="2">침대 2</option>
	                      	<option value="3">침대 3</option>
	                      	<option value="4">침대 4</option>
	                      	<option value="5">침대 5</option>
	                      	<option value="6">침대 6</option>
	                    	<option value="7">침대 7 이상</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
		              <input type="checkbox" name="rsmoke" value="smoke"> 흡연실 
		              <input type="checkbox" name="rpet" value="pet"> 반려동물
		              </div>
		              
				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">상세 주소</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" style="width: 100%;" id=""
							name="raddress">
					</div>
				</div>

				<button type="submit" value="등록" class="btn btn-primary py-3 px-5">등록</button>
				<button type="submit" value="취소" class="btn btn-primary py-3 px-5 onclick="javascript:location.href='/room/rooms'">취소</button>
				
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

</body>
</html>