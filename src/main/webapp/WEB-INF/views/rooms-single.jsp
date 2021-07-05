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
							<pre><p>${roomVo.rinfo }</p></pre>	<!-- 줄바꿈 유지를 위해서 pre태그 사용  -->
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
						<form action="../reserve/roomReserve" method="post" id="reserve">
						<input type="hidden" name="userno" value="${userVo.userno }">
						<input type="hidden" name="start" value="${start }">
						<input type="hidden" name="end" value="${end }">
						<input type="hidden" name="roomNo" value="${roomVo.roomNo }">
							 <button onclick="reserveSubmit()" class="btn py-3 px-5"
								style="background-color: #8D703B; color: white; padding-left: 30px; padding-right: 30px;">예약하기</button>
						</form> 


						<%-- <div class="col-md-12 room-single ftco-animate mb-5 mt-5">
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
						</div> --%>

					</div>
				</div>
				<!-- .col-md-8 -->
				
	<!-- 			<script type="text/javascript">
				function reply_ajax(){
					if($("#reviewContent").val()==null || $("#reviewContent").val()==""){
						alert("데이터를 입력해주세요");
						return false;
					}
					$.ajax({
						url:'./replyInsert',
						type:'post',
						data:{
							//등록을 위해서 넘겨줘야 하는 데이터
							//"bno" : 1,	//임의로 1일뿐, 글 번호를 받아서 가져옴.
							"userid": "${session_id}",
							//"replyPw" : $("#replyPw").val(),
							"reviewContent" : $("#reviewContent").val()	//여기 데이터가 controller로
						}
				
				</script> -->
			<!-- 리뷰창  -->	
			<div class="pt-5 mt-5" id="review">
              <h3 class="mb-5">${reviewMap.reviewCount } Comments</h3>
			<c:forEach var="reviewList" items="${reviewMap.reviewList }">
              <ul class="comment-list">
                <li class="comment">
                  <div class="comment-body">
                    <h3>리뷰자 : ${reviewList.userid }</h3>
                    <div class="meta">숙박기간 : ${reviewList.redate}</div>
                    <p>${reviewList.recontent}</p>
                    <div class="meta" >별점 평가 :
                    <c:forEach begin="1" end="${reviewList.rescore }">
						<i class="icon-star"></i>
                    </c:forEach>
					</div>
                  </div>
                </li>
                                  
                
<!-- 
                <li class="comment">
                  <div class="comment-body">
                    <h3>리뷰자</h3>
                    <div class="meta">2021/07/01, 2021 at 2:21pm</div>

                    <p><a href="#" class="reply">Reply</a></p>
                  </div>
                </li>

                <li class="comment">
                  <div class="comment-body">
                    <h3>리뷰자</h3>
                    <div class="meta"> </div>
                    <p>나쁘지 않는 방이였다.</p>
                    <p><a href="#" class="reply">Reply</a></p>
                  </div>
                  
                </li> -->
              </ul>
              </c:forEach>
			</div>
              
              <!-- END comment-list -->
              
              <!-- 예약한 이력이 있는 사람만 리뷰창이 뜸 -->
              <c:if test="${reserveVo.userno == userVo.userno }">
         
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">Leave a comment</h3>
               <!-- 여기 폼 -->
                <form action="../room/reviewWriteDo" class="p-5 bg-light">
                <div class="form-group">
                  	<input type="hidden" name="roomNo" id="roomNo" value="${roomVo.roomNo }">
                  
                  
                  <!-- 별점 등록 -->
                  	      <div class="sidebar-wrap bg-light ftco-animate">
	      					<h3 class="heading mb-4">Star Rating</h3>
							  <div class="form-check">
									<input type="radio" class="form-check-input" id="exampleCheck1" name="rescore" value="5" checked="checked">&emsp;
									<label class="form-check-label" for="exampleCheck1">
										<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span></p>
									</label>
							  </div>
							  <div class="form-check">
						      <input type="radio" class="form-check-input" id="exampleCheck1" name="rescore" value="4">&emsp;
						      <label class="form-check-label" for="exampleCheck1">
						    	   <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i></span></p>
						      </label>
							  </div>
							  <div class="form-check">
						      <input type="radio" class="form-check-input" id="exampleCheck1" name="rescore" value="3">&emsp;
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
						     </label>
							  </div>
							  <div class="form-check">
							    <input type="radio" class="form-check-input" id="exampleCheck1" name="rescore" value="2">&emsp;
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
						      </label>
							  </div>
							  <div class="form-check">
						      <input type="radio" class="form-check-input" id="exampleCheck1" name="rescore" value="1">&emsp;
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
							    </label>
							  </div>
	      		</div>
                  <!-- 리뷰등록 -->
                    <label for="name">예약자 아이디 : </label>&emsp;
                    <b>${userVo.userid }</b>
                  </div>
		
                  
                  <div class="form-group">
                    <label for="website">숙박기간 </label>&emsp;
                    <b>${reserveVo.startday } ~ ${reserveVo.endday }</b>
                  </div>
					
				<!-- <div class="form-group">
                    <label for="userpw">비밀번호 </label>
                    <input type="password" class="form-control" style="width:30%;" id="reviewpw" name="reviewpw">
                  </div> -->
                  
                  <div class="form-group">
                    <label for="message">리뷰 내용</label>
                    <textarea name="recontent" id="message" cols="30" rows="10" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="작성 완료" class="btn py-3 px-4 btn-primary" >
                  </div>
                </form>
              </div>
              </c:if>
				<!-- 리뷰 끝 -->
				
				
				<!-- 페이징 시작 -->
				<div class="text-center">
					<div class="block-27">
						<ul>
						<c:if test="${reviewMap.page > 1 }">
								<li><a href="/room/rooms-single?page=${reviewMap.page-1 }&roomNo=${roomVo.roomNo }&start=${start }&end=${end }#review">&lt;</a></li>
							</c:if>
							<!-- 번호 넣기 -->
							<c:forEach var="x" begin="${reviewMap.startPage}" end="${reviewMap.endPage }">
								<c:if test="${reviewMap.page == x }">
									<li><a>${x}</a></li>
								</c:if>
								<c:if test="${reviewMap.page != x }">
									<li><a href="/room/rooms-single?page=${x}&roomNo=${roomVo.roomNo }&start=${start }&end=${end }#review">${x}</a></li>
								</c:if>
							</c:forEach>
							<!-- 번호 넣기 끝 -->
							<c:if test="${reviewMap.page < reviewMap.maxPage }">
								<li><a href="/room/rooms-single?page=${reviewMap.page+1 }&roomNo=${roomVo.roomNo }&start=${start }&end=${end }#review">&gt;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
				
				<!-- 페이징 끝 -->
				
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