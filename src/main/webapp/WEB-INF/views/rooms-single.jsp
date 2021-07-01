<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Deluxe</title>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i"
	rel="stylesheet">

<link rel="stylesheet"
	href="../static/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../static/css/animate.css">

<link rel="stylesheet" href="../static/css/owl.carousel.min.css">
<link rel="stylesheet" href="../static/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../static/css/magnific-popup.css">

<link rel="stylesheet" href="../static/css/aos.css">

<link rel="stylesheet" href="../static/css/ionicons.min.css">

<link rel="stylesheet" href="../static/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../static/css/jquery.timepicker.css">

<link rel="stylesheet" href="../static/css/flaticon.css">
<link rel="stylesheet" href="../static/css/icomoon.css">
<link rel="stylesheet" href="../static/css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../static/js/contact.js"></script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	/* function roomReserve_ajax() {
		alert($("#").val()); //form에 입력한 id값을 받아옴.

		 $.ajax({
			url : "formOk", //어디로 보내줄꺼냐 : url은 무조건 controller로 감.
			type : "post", //어떤 형식으로 보내줄꺼냐
			data : { // data->controller->DB저장->DB정보를 들고와서 다시 data를 화면에 전달해달라.
				"id" : $("#id").val(),
				"pw" : $("#pw").val(),
				"name" : $("#name").val(),
				"nickName" : $("#nickName").val()
			}, //데이터값. key-value형태로.
			success : function(data) {
				//controller의 return값을 data로 받음.
				alert("성공" );
				
			}, //성공했을때는 여기로
			error : function() {
				alert("실패");
			} //실패했을때는 여기로
		}); 

		//ajax기본 형식 : $.ajax({ }); 세미콜론 필수.
	} */
	
	function reserveSubmit() {
		if (${session_flag==null || session_flag=='fail' }) {
			alert("로그인이 필요합니다.")
			return false;
		} else {
			document.reserve.submit();
		}
	};
</script>

</head>
<body>

	<!-- END nav -->

	<div class="hero-wrap"
		style="background-image: url('../static/images/bg_1.jpg');">
		<c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
				<div
					class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
					<div class="text">
						<p class="breadcrumbs mb-2"
							data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
							<span class="mr-2"><a href="/">Home</a></span> <span>Room
								Details</span>
						</p>
						<h1 class="mb-4 bread">${roomVo.rname }</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<input type="hidden" name="userno" value="${userno }">
	
	
	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
						<div class="col-md-12 ftco-animate">
							<h2 class="mb-4">${roomVo.rname }</h2>
							<div class="single-slider owl-carousel">
								<div class="item">
									<div class="room-img"
										style="background-image: url(../static/upload/${roomVo.rpicture1});"></div>
								</div>
								<c:if test="${roomVo.rpicture2 != null }">
									<div class="item">
										<div class="room-img"
											style="background-image: url(../static/upload/${roomVo.rpicture2});"></div>
									</div>
								</c:if>
								<c:if test="${roomVo.rpicture3 != null }">
									<div class="item">
										<div class="room-img"
											style="background-image: url(../static/upload/${roomVo.rpicture3});"></div>
									</div>
								</c:if>
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
						
						 <a href="../reserve/roomReserve?roomNo=${roomVo.roomNo }"
							class="btn-custom" id="reserve">
							 <button onclick="reserveSubmit()" class="btn py-3 px-5"
								style="background-color: #8D703B; color: white; padding-left: 30px; padding-right: 30px;">예약하기</button>
						</a> 


						<div class="col-md-12 room-single ftco-animate mb-5 mt-5">
							<h4 class="mb-4">이전 / 이후</h4>
							<div class="row">
								<c:forEach var="item" items="${roomVo.roomVoList }">
									<div class="col-sm col-md-6 ftco-animate">
										<div class="room">
											<a href="/room/rooms-single?roomNo=${item.roomNo }"
												class="img img-2 d-flex justify-content-center align-items-center"
												style="background-image: url(../static/upload/${item.rpicture1});">
												<div
													class="icon d-flex justify-content-center align-items-center">
													<span class="icon-search2"></span>
												</div>
											</a>
											<div class="text p-3 text-center">
												<h3 class="mb-3">
													<a>${item.rtype }</a>
												</h3>
												<p>
													<span class="price mr-2">${item.rprice }</span> <span
														class="per">/ 일</span>
												</p>
												<hr>
												<!--  -->
												<p class="pt-1">
													<a href="/room/rooms-single?roomNo=${item.roomNo }"
														class="btn-custom"> <c:if
															test="${item.prevyn eq 'N' }">
				    									이전 방 상세보기
				    								</c:if> <c:if test="${item.prevyn eq 'Y' }">
				    									이후 방 상세보기
				    								</c:if> <span class="icon-long-arrow-right"></span>
													</a>
												</p>
											</div>
										</div>
									</div>

								</c:forEach>
							</div>
						</div>

					</div>
				</div>
				<!-- .col-md-8 -->
				<div class="col-lg-4 sidebar ftco-animate">
					<div class="sidebar-box">
						<form action="#" class="search-form">
							<div class="form-group">
								<span class="icon fa fa-search"></span> <input type="text"
									class="form-control" placeholder="Type a keyword and hit enter">
							</div>
						</form>
					</div>
				
				
				
			<!-- 리뷰창  -->	
			<div class="pt-5 mt-5">
              <h3 class="mb-5">6 Comments</h3>
              <ul class="comment-list">
                <li class="comment">
                  <div class="comment-body">
                    <h3>John Doe</h3>
                    <div class="meta">Decmener 7, 2018 at 2:21pm</div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                    <p><a href="#" class="reply">Reply</a></p>
                  </div>
                </li>

                <li class="comment">
                  <div class="comment-body">
                    <h3>John Doe</h3>
                    <div class="meta">December 7, 2018 at 2:21pm</div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                    <p><a href="#" class="reply">Reply</a></p>
                  </div>
                </li>
              </ul>
              <!-- END comment-list -->
              
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">Leave a comment</h3>
                <form action="#" class="p-5 bg-light">
                  <div class="form-group">
                  
                  
                  <!-- 별점 등록 -->
                  	      <div class="sidebar-wrap bg-light ftco-animate">
	      					<h3 class="heading mb-4">Star Rating</h3>
							  <div class="form-check">
									<input type="radio" class="form-check-input" id="exampleCheck1">&emsp;
									<label class="form-check-label" for="exampleCheck1">
										<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span></p>
									</label>
							  </div>
							  <div class="form-check">
						      <input type="radio" class="form-check-input" id="exampleCheck1">&emsp;
						      <label class="form-check-label" for="exampleCheck1">
						    	   <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i></span></p>
						      </label>
							  </div>
							  <div class="form-check">
						      <input type="radio" class="form-check-input" id="exampleCheck1">&emsp;
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
						     </label>
							  </div>
							  <div class="form-check">
							    <input type="radio" class="form-check-input" id="exampleCheck1">&emsp;
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
						      </label>
							  </div>
							  <div class="form-check">
						      <input type="radio" class="form-check-input" id="exampleCheck1">&emsp;
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
							    </label>
							  </div>
	      		</div>
                  <!-- 리뷰등록 -->
                    <label for="name">Name *</label>
                    <input type="text" class="form-control" id="name">
                  </div>
                  <div class="form-group">
                    <label for="email">Email *</label>
                    <input type="email" class="form-control" id="email">
                  </div>
                  <div class="form-group">
                    <label for="website">Website</label>
                    <input type="url" class="form-control" id="website">
                  </div>

                  <div class="form-group">
                    <label for="message">Message</label>
                    <textarea name="" id="message" cols="30" rows="10" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary">
                  </div>
                </form>
              </div>
            </div>
				<!-- 리뷰 끝 -->
			</div>
		</div>
	</section>
	<!-- .section -->
		
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="../static/js/jquery.min.js"></script>
	<script src="../static/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../static/js/popper.min.js"></script>
	<script src="../static/js/bootstrap.min.js"></script>
	<script src="../static/js/jquery.easing.1.3.js"></script>
	<script src="../static/js/jquery.waypoints.min.js"></script>
	<script src="../static/js/jquery.stellar.min.js"></script>
	<script src="../static/js/owl.carousel.min.js"></script>
	<script src="../static/js/jquery.magnific-popup.min.js"></script>
	<script src="../static/js/aos.js"></script>
	<script src="../static/js/jquery.animateNumber.min.js"></script>
	<script src="../static/js/bootstrap-datepicker.js"></script>
	<script src="../static/js/jquery.timepicker.min.js"></script>
	<script src="../static/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="../static/js/google-map.js"></script>
	<script src="../static/js/main.js"></script>

</body>
</html>