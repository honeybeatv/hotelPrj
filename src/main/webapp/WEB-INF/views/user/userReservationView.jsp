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
	            <h1 class="mb-4 bread">Reservation</h1>
            </div>
          </div>
        </div>
      </div>
    </div>

	<c:import url="/WEB-INF/views/user/mypageCategory.jsp"></c:import>

    
    
    
        <section class="ftco-section bg-light">
	    	<div class="container">
	    		<div class="row">
					<c:forEach var="userReservationList" items="${userReservationList}">
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		<!--      				<a href="rooms" class="img d-flex justify-content-center align-items-center" style="background-image: url(/static/images/room-1.jpg);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		-->  					
								<div class="text p-3 text-center">
			    					<h3 class="mb-3"><a href="rooms">${userReservationList.rname }</a></h3>
			    						<p><span class="price mr-2">${userReservationList.rprice }</span> <span class="per">/ 일</span></p>
			    						<ul>
				    						<li>방문일 : ${userReservationList.startday } ~ ${userReservationList.endday }</li>
				    						<li>상세주소 : ${userReservationList.raddress }</li>
			    						</ul>
			    						<hr>
			    						<p class="pt-1">
			    							<a href="/room/rooms-single?roomNo=${userReservationList.roomNo} " class="btn-custom">View Room Details <span class="icon-long-arrow-right"></span></a>
			    						</p>
		    					</div>
		    				</div>
		    			</div>
		    		</c:forEach>
	    		</div>
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