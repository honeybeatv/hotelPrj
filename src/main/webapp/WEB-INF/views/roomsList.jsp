<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
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
	<section>
		<h1>숙소 리스트 	${map.listCount }</h1>

		<!-- <div class="wrapper">
			<form action="./list" name="search" method="post">
				<select name="category" id="category">
					<option value="all">전체</option>
					<option value="btitle">제목</option>
					<option value="bcontent">내용</option>
				</select>

				<div class="title">
					<input type="text" size="16" name="search" id="search">
				</div>

				<button type="submit">
					<i class="fas fa-search"></i>
				</button>
			</form>
		</div> -->

		<table>

			<colgroup>
				<col width="10%">
				<col width="48%">
				<col width="15%">
				<col width="15%">
				<col width="12%">
			</colgroup>
			<!-- 제목부분 -->
			<tr>
				<th>방번호</th>
				<th>방타입</th>
				<th>인원수</th>
				<th>정보</th>
				<th>사진</th>
				<th>시티</th>
				<th>가격</th>
				<th>방</th>
				<th>침대</th>
				<th>흡연 가능 여부</th>
				<th>애완동물</th>
				<th>주소</th>
			</tr>
			<!-- 내용부분 시작 -->
			<c:forEach var="roomVo" items="${roomsList }">
				<tr>
					<td><span class="table-notice">${roomVo.roomNo }</span></td>
					<td class="table-title">
						<!-- content_view?번호를 전달 --> <a href="view?bno=${roomVo.roomNo }">
							<c:forEach begin="1" end="${roomVo.roomNo}">
							</c:forEach>
					</a>
					</td>
					<td>${roomVo.roomNo}</td>
					<td>${roomVo.rtype}</td>
					<td>${roomVo.rpeople}</td>
					<td>${roomVo.rinfo}</td>
					<td>${roomVo.rpicture}</td>
					<td>${roomVo.rcity}</td>
					<td>${roomVo.rprice}</td>
					<td>${roomVo.rroom}</td>
					<td>${roomVo.rbed}</td>
					<td>${roomVo.rsmoke}</td>
					<td>${roomVo.rpet}</td>
					<td>${roomVo.raddress}</td>
				</tr>
			</c:forEach>
			<!-- 내용부분 끝 -->
		</table>
		<!-- loader -->
		<div id="ftco-loader" class="show fullscreen">
			<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
					stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
					stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
		</div>
		 <a href="roomsadd"><div class="write">등록</div></a>
		 
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