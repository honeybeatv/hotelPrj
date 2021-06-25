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
<!--<script src="http://code.jquery.com/jquery-latest.min.js"></script>   -->
<script type="text/javascript">
	function searchSubmit() {
		//location.href="userHostingView.jsp"
		
		var rname = $("#rname").val();
		var rtype = $("#rtype").val();
		var rpeople = $("#rpeople").val();
		var rinfo = $("#rinfo").val();
		//var rpicture = $("#rpicture").val();
		var rcity = $("#rcity").val();
		var rprice = $("#rprice").val();
		var rroom = $("#rroom").val();
		var rbed = $("#rbed").val();
		var raddress = $("#raddress").val();

		
		if (rname == "" || rname == null) {
			alert("방이름을 입력하세요")
			return false;
		}else if (rtype == "" || rtype == null) {
			alert("방종류를 선택하세요")
			return false;
		}else if (rpeople == "" || rpeople == null) {
			alert("인원수를 선택하세요")
			return false;
		}else if (rinfo == "" || rinfo == null) {
			alert("방정보를 입력하세요")
			return false;
		//}else if (rpicture == "" || rpicture == null) {
			//alert("방사진을 등록하세요")
			//return false;
		}else if (rcity == "" || rcity == null) {
			alert("지역을 선택하세요")
			return false;
		}else if (rprice == "" || rprice == null) {
			alert("가격을 정해주세요")
			return false;
		} else if (rroom == "" || rroom == null) {
			alert("침실수를 선택하세요")
			alert(rroom)
			return false;
		} else if (rbed == "" || rbed ==null) {
			alert("침대수를 선택하세요")
			return false;
		} else if (raddress == "" || raddress ==null) {
			alert("상세주소를 입력하세요")
			return false;
		} else{
			document.searchForm.submit();
		}
	}
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
			<form action="roomsWriteDo" id="searchForm" name="searchForm" class="bg-white p-5 " width="100%" method="post">



				<div class="form-inline form-group">
					<label for="userid" class="col-sm-2 control-label"
						style="font-weight: bolder;">방이름</label> <input type="hidden"
						id="userno" name="userno" value="${session_userno }">
					<div class="col-sm-7">
						<input type="text" class="form-control" style="width: 100%;" id="rname" name="rname">
					</div>

				</div>

				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">방종류</label>
					<div class="col-sm-7">
						<select name="rtype" id="rtype">
							<option value="" selected>방종류</option>
							<option value="all">집전체</option>
							<option value="individual">개인실</option>
							<option value="hotel">호텔</option>
							<option value="share">다인실</option>
						</select>
					</div>
				</div>

				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">인원수</label>
					<div class="col-sm-7">
						<select name="rpeople" id="rpeople">
						<option value="" selected>인원수</option>
							<option value="1">1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명 이상</option>
						</select>
					</div>
				</div>

				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">방정보</label>
					<div class="col-sm-7">
						<textarea name="rinfo" cols="65" rows="10" id="rinfo"></textarea>
					</div>
				</div>

				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">사진</label>
					<div class="col-sm-7">
						<input type="file" class="" style="width: 100%;" id="file"	name="rpicture">
					</div>


				</div>

				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">도시</label>
					<div class="col-sm-7">

						<select id="rcity" name="rcity">
							<option value="" selected>지역</option>
							<option value="서울">서울</option>
							<option value="인천">인천</option>
							<option value="세종">세종</option>
							<option value="대전">대전</option>
							<option value="대구">대구</option>
							<option value="울산">울산</option>
							<option value="부산">부산</option>
							<option value="광주">광주</option>
							<option value="제주">제주</option>
						</select>
					</div>
				</div>
				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">1박 가격</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" style="width: 100%;" id="rprice" name="rprice">
					</div>
				</div>
				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">침실수</label>
					<div class="col-sm-7">
						<select name="rroom" id="rroom">
							<option value="" selected>침실수</option>
							<option value="1">1Room</option>
							<option value="2">2Room</option>
							<option value="3">3Room</option>
							<option value="4">4Room</option>
							<option value="5">5Room 이상</option>
						</select>
					</div>
				</div>
				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">침대수</label>
					<div class="col-sm-7">
						<select name="rbed" id="rbed">
							<option value="" selected>침대수</option>
							<option value="1" >1Bed</option>
							<option value="2">2Bed</option>
							<option value="3">3Bed</option>
							<option value="4">4Bed</option>
							<option value="5">5Bed 이상</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<input type="checkbox" name="rsmoke" value="smoke"> 흡연실 <input
						type="checkbox" name="rpet" value="pet"> 반려동물
				</div>

				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">상세 주소</label>
					<div class="col-sm-7">
						<textarea name="raddress" cols="65" rows="3" id="raddress"></textarea>
					</div>
				</div>

				<input type="button" value="등록" class="btn btn-primary py-3 px-5"
					onclick="searchSubmit();">
				<input type="button" value="취소"
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

</body>
</html>