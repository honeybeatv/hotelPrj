<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  
    <title>MyPage</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i" rel="stylesheet">

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
    
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 	<script type="text/javascript">
  	 
  	</script>
  	
  </head>
  <body>

   <c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>

    <div class="hero-wrap" style="background-image: url('/static/images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
          	<div class="text">
	            <p class="breadcrumbs mb-2"><span class="mr-2"><a href="/">Home</a></span> <span>mypage</span></p>
	            <h1 class="mb-4 bread">Information</h1>
            </div>
          </div>
        </div>
      </div>
    </div>

	<c:import url="/WEB-INF/views/user/mypageCategory.jsp"></c:import>

	<section class="ftco-section contact-section bg-light" align="center">
		<div  class="col-6" style="display:inline-block;" >
            <form action="userInfoModify" class="bg-white p-5 " width="100%" method="post">
			<input type="hidden" id="userno" name="userno" value="${session_userno}" >            
            
            	<div class="form-inline form-group">
					<label for="name" class="col-sm-2 control-label" style="font-weight:bolder;">이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" style="width:100%;" id="name" name="name" value="${userVo.name}" readonly>
					</div>
				</div>
				
				<div class="form-inline form-group">
					<label for="userid" class="col-sm-2 control-label" style="font-weight:bolder;">아이디</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" style="width:100%;" id="userid" name="userid" value="${userVo.userid}" readonly>
					</div>
				</div>

				<div class="form-inline form-group">
					<label for="uemail" class="col-sm-2 control-label" style="font-weight:bolder;">이메일</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" style="width:100%;" id="uemail" name="uemail" value="${userVo.uemail}" readonly>
					</div>
				</div>
				
				<div class="form-inline form-group">
					<label for="userpw" class="col-sm-2 control-label" style="font-weight:bolder;">비밀번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" style="width:100%;" id="userpw" name="userpw" value="********" readonly>
					</div>
				</div>
				
				<div class="form-inline form-group">
					<label for="uphone" class="col-sm-2 control-label" style="font-weight:bolder;">핸드폰 번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" style="width:100%;" id="uphone" name="uphone" value="${userVo.uphone}" readonly>
					</div>
				</div>
				
				<button type="submit" class="btn btn-primary py-3 px-5">회원정보 수정하기</button>
            </form>
          </div>
    </section>

    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
    
  <!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
	  	<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
	  	<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
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