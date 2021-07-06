<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>MyPage</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i" rel="stylesheet">

    <link rel="stylesheet" href="/static/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/animate.css">
    
    <link rel="stylesheet" href="/static/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/static/css/owl.tdeme.default.min.css">
    <link rel="stylesheet" href="/static/css/magnific-popup.css">

    <link rel="stylesheet" href="/static/css/aos.css">

    <link rel="stylesheet" href="/static/css/ionicons.min.css">

    <link rel="stylesheet" href="/static/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/static/css/jquery.timepicker.css">

    <link rel="stylesheet" href="/static/css/flaticon.css">
    <link rel="stylesheet" href="/static/css/icomoon.css">
    <link rel="stylesheet" href="/static/css/style.css">
    
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 	<script type="text/javascript">
		$(function(){
  		 	$('#goto_userHostingView').click(function(){
	  			history.back();
  		 	});
  	 	});
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
							<span class="mr-2"><a href="index">Home</a></span> <span>숙소 수정</span>
						</p>
						<h1 class="mb-4 bread">숙소 수정</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/user/mypageCategory.jsp"></c:import>

	<section class="ftco-section contact-section bg-light" align="center">
		<div class="col-10" style="display: inline-block;">
			<c:forEach var="roomVo" items="${userHostingModifyMap.userHostingModifyList }">
			<form action="userHostingModifyDo" class="bg-white p-5 " width="100%" method="post" enctype="multipart/form-data">

				<div class="form-inline form-group">
					<label for="userid" class="col-sm-2 control-label"style="font-weight: bolder;">방이름</label> 
					<div class="col-sm-7">
						<input type="text" class="form-control" style="width: 100%;" id="rname" name="rname" value="${roomVo.rname }">
					</div>
					<input type="hidden"id="userno" name="userno" value="${session_userno }">
					<input type="hidden"id="roomNo" name="roomNo" value="${roomVo.roomNo }">
				</div>

				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">방종류</label>
					<div class="col-sm-7">
						<select name="rtype" id="rtype">

							<option value="아파트" ${(roomVo.rtype eq '아파트')? 'selected' : '' }>아파트</option>
		                     <option value="집" ${(roomVo.rtype eq '집')? 'selected' : '' }>주택</option>
		                     <option value="공동주택" ${(roomVo.rtype eq '공동주택')? 'selected' : '' }>공동주택</option>
		                     <option value="호텔" ${(roomVo.rtype eq '호텔')? 'selected' : '' }>호텔</option>
		                    <%--  <option value="레지던스" ${(roomVo.rtype eq '레지던스')? 'selected' : '' }>레지던스</option>
		                     <option value="호스텔" ${(roomVo.rtype eq '호스텔')? 'selected' : '' }>호스텔</option> --%>
	                    	<option value="기타" ${(roomVo.rtype eq '기타')? 'selected' : '' }>기타</option>
<%-- 
							<option value="apt" ${(roomVo.rtype eq 'apt')? 'selected' : '' }>아파트</option>
		                     <option value="house" ${(roomVo.rtype eq 'house')? 'selected' : '' }>주택</option>
		                     <option value="walkup" ${(roomVo.rtype eq 'walkup')? 'selected' : '' }>공동주택</option>
		                     <option value="hotel" ${(roomVo.rtype eq 'hotel')? 'selected' : '' }>호텔</option>
		                     <option value="residence" ${(roomVo.rtype eq 'residence')? 'selected' : '' }>레지던스</option>
		                     <option value="hostel" ${(roomVo.rtype eq 'hostel')? 'selected' : '' }>호스텔</option>
	                    	<option value="etc" ${(roomVo.rtype eq 'etc')? 'selected' : '' }>기타</option> --%>

						</select>
					</div>
				</div>

				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">인원수</label>
					<div class="col-sm-7">
						<select name="rpeople" id="rpeople">
						<option value="" selected>인원수</option>
							<option value="1" ${(roomVo.rpeople eq '1')? 'selected' : '' }>1명</option>
							<option value="2" ${(roomVo.rpeople eq '2')? 'selected' : '' }>2명</option>
							<option value="3" ${(roomVo.rpeople eq '3')? 'selected' : '' }>3명</option>
							<option value="4" ${(roomVo.rpeople eq '4')? 'selected' : '' }>4명</option>
							<option value="5" ${(roomVo.rpeople eq '5')? 'selected' : '' }>5명</option>
							<option value="6" ${(roomVo.rpeople eq '6')? 'selected' : '' }>6명 이상</option>
						</select>
					</div>
				</div>

				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label" style="font-weight: bolder;">방정보</label>
					<div class="col-sm-7">
						<textarea name="rinfo" cols="65" rows="10" id="rinfo">${roomVo.rinfo }</textarea>
					</div>
				</div>

				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label" style="font-weight: bolder;">사진</label>
					<img src="http://localhost:8000/upload/${roomVo.rpicture1 }">
					<img src="http://localhost:8000/upload/${roomVo.rpicture2 }">
					<img src="http://localhost:8000/upload/${roomVo.rpicture3 }">
					<input multiple="multiple" type="file" class="" style="padding-left: 15px; width: 15%; text-align: left;" id="file" name="file" accept=".gif, .jpg, .png" onchange="loadFile(event)">
					<span style="font-size:10px; color: gray;">※사진은 최대 3개까지 등록이 가능합니다.</span>	
				</div>

				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">도시</label>
					<div class="col-sm-7">

						<select id="rcity" name="rcity">
							<option value="" selected>지역</option>
							<option value="서울" ${(roomVo.rcity eq '서울')? 'selected' : '' }>서울</option>
							<option value="인천" ${(roomVo.rcity eq '인천')? 'selected' : '' }>인천</option>
							<option value="세종" ${(roomVo.rcity eq '세종')? 'selected' : '' }>세종</option>
							<option value="대전" ${(roomVo.rcity eq '대전')? 'selected' : '' }>대전</option>
							<option value="대구" ${(roomVo.rcity eq '대구')? 'selected' : '' }>대구</option>
							<option value="울산" ${(roomVo.rcity eq '울산')? 'selected' : '' }>울산</option>
							<option value="부산" ${(roomVo.rcity eq '부산')? 'selected' : '' }>부산</option>
							<option value="광주" ${(roomVo.rcity eq '광주')? 'selected' : '' }>광주</option>
							<option value="제주" ${(roomVo.rcity eq '제주')? 'selected' : '' }>제주</option>
						</select>
					</div>
				</div>
				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">1박 가격</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" style="width: 100%;" id="rprice" name="rprice" value="${roomVo.rprice }">
					</div>
				</div>
				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">침실수</label>
					<div class="col-sm-7">
						<select name="rroom" id="rroom">
							<option value="1" ${(roomVo.rroom eq '1')? 'selected' : '' }>침실 1</option>
							<option value="2" ${(roomVo.rroom eq '2')? 'selected' : '' }>침실 2</option>
		                    <option value="3" ${(roomVo.rroom eq '3')? 'selected' : '' }>침실 3</option>
		                    <option value="4" ${(roomVo.rroom eq '4')? 'selected' : '' }>침실 4</option>
		                    <option value="5" ${(roomVo.rroom eq '5')? 'selected' : '' }>침실 5</option>
		                    <option value="6" ${(roomVo.rroom eq '6')? 'selected' : '' }>침실 6</option>
	                    	<option value="7" ${(roomVo.rroom eq '7')? 'selected' : '' }>침실 7 이상</option>
						</select>
					</div>
				</div>
				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label"
						style="font-weight: bolder;">침대수</label>
					<div class="col-sm-7">
						<select name="rbed" id="rbed">
							<option value="1" ${(roomVo.rbed eq '1')? 'selected' : '' }>침대 1</option>
	                      	<option value="2" ${(roomVo.rbed eq '2')? 'selected' : '' }>침대 2</option>
	                      	<option value="3" ${(roomVo.rbed eq '3')? 'selected' : '' }>침대 3</option>
	                      	<option value="4" ${(roomVo.rbed eq '4')? 'selected' : '' }>침대 4</option>
	                      	<option value="5" ${(roomVo.rbed eq '5')? 'selected' : '' }>침대 5</option>
	                      	<option value="6" ${(roomVo.rbed eq '6')? 'selected' : '' }>침대 6</option>
						</select>
					</div>
				</div>

				<div class="form-group">
				
					<input type="checkbox" name="rsmoke" value="smoke" ${(roomVo.rsmoke eq 'smoke')? 'checked' : ''}> 흡연실 
					<input type="checkbox" name="rpet" value="pet" ${(roomVo.rpet eq 'pet')? 'checked' : ''} > 반려동물
					
				</div>

				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label" style="font-weight: bolder;">상세 주소</label>
					<div class="col-sm-7">
						<textarea name="raddress" cols="65" rows="3" id="raddress">${roomVo.raddress }</textarea>
					</div>
				</div>

				<input type="submit" value="저장" class="btn btn-primary py-3 px-5">
				<input type="button" value="취소" class="btn btn-primary py-3 px-5" onclick="history.back()">

			</form>
			</c:forEach>
		</div>
	</section>

	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
    
  <!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
	  	<circle class="patd-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
	  	<circle class="patd" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
  		</svg>
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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/static/js/google-map.js"></script>
  <script src="/static/js/main.js"></script>
    
  </body>
</html>