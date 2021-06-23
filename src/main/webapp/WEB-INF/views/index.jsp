<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Deluxe - Free Bootstrap 4 Template by Colorlib</title>
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
    
    <!--<script src="http://code.jquery.com/jquery-latest.min.js"></script>   -->
 	<script type="text/javascript">
 	function searchSubmit() {
		var city = $("#rcity").val();
		var startDate = $("#datepicker1").val();
		var endDate = $("#datepicker2").val();
		var people = $("#rpeople").val();
		if(city == ""){
		alert("지역을 선택하세요");
		return false;
		}
		else if (startDate == ""){
			alert("체크인날짜를 입력하세요");
			return false;
		}
		else if (endDate == ""){
			alert("체크아웃날짜를 입력하세요")
			return false;
		}
		else if (people == 0){
			alert("인원수를 선택하세요")
			return false;
		}
		else if (startDate > endDate) {
			alert("날짜를 확인하세요")
		}
		else {
			document.searchForm.submit();
		}
	}
  	</script>
  	
  </head>
  <body>

    <c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>
   <%--  <%@ include file="/WEB-INF/views/include/nav.jsp" %> --%>
    <!-- END nav -->

    <section class="home-slider owl-carousel">
      <div class="slider-item" style="background-image:url(/static/images/bg_1.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-12 ftco-animate text-center">
          	<div class="text mb-5 pb-3">
	            <h1 class="mb-3">Welcome To Deluxe</h1>
	            <h2>Hotels &amp; Resorts</h2>
            </div>
          </div>
        </div>
        </div>
      </div>

      <div class="slider-item" style="background-image:url(/static/images/bg_2.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-12 ftco-animate text-center">
          	<div class="text mb-5 pb-3">
	            <h1 class="mb-3">Enjoy A Luxury Experience</h1>
	            <h2>Join With Us</h2>
            </div>
          </div>
        </div>
        </div>
      </div>
    </section>

    <section class="ftco-booking">
    	<div class="container">
    		<div class="row">
    			<div class="col-lg-12">
    				<form action="room/search" id="searchForm" name="searchForm" class="booking-form" method="post">
	        		<div class="row">
	        			<div class="col-md d-flex">
	        				<div class="form-group p-4 align-self-stretch d-flex align-items-end">
	        					<div class="wrap">
			      					<label for="#">지역</label>
			      					<div class="form-field">
			        					<div class="select-wrap">
			                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
			                    <select name="rcity" id="city" class="form-control" style="cursor:pointer;">
			                    	<option value="">지역</option>
			                    	<option value="서울">서울</option>
			                      <option value="경기">경기</option>
			                      <option value="인천">인천</option>
			                      <option value="강원">강원</option>
			                      <option value="대전">대전</option>
			                      <option value="부산">부산</option>
			                      <option value="제주">제주</option>
			                    </select>
			                  </div>
				              </div>
				            </div>
		              </div>
	        			</div>
	        			<div class="col-md-3 d-flex">
	        				<div class="form-group p-4 align-self-stretch d-flex align-items-end">
	        					<div class="wrap">
				    					<label for="#">체크인 날짜</label>
				    					<input type="text" class="form-control checkin_date" id="datepicker1" name="startDate" placeholder="체크인 날짜" style="cursor:pointer;" readonly>
			    					</div>
			    				</div>
	        			</div>
	        			<div class="col-md-3 d-flex">
	        				<div class="form-group p-4 align-self-stretch d-flex align-items-end">
	        					<div class="wrap">
				    					<label for="#">체크아웃 날짜</label>
				    					<input type="text" class="form-control checkout_date" id="datepicker2" name="endDate" placeholder="체크아웃 날짜" style="cursor:pointer;" readonly>
			    				</div>
			    				</div>
	        			</div>
	        			<div class="col-md d-flex">
	        				<div class="form-group p-4 align-self-stretch d-flex align-items-end">
	        					<div class="wrap">
			      					<label for="#">인원수</label>
			      					<div class="form-field">
			        					<div class="select-wrap">
			                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
			                    <select name="rpeople" id="rpeople" class="form-control" style="cursor:pointer;">
				                      <option value="">인원수</option>
				                      <option value="1">1명</option>
				                      <option value="2">2명</option>
				                      <option value="3">3명</option>
				                      <option value="4">4명</option>
				                      <option value="5">5명</option>
				                      <option value="6">6명 이상</option>
			                    </select>
			                  </div>
				              </div>
				            </div>
		              </div>
	        			</div>
	        			<div class="col-md d-flex">
	        				<div class="form-group d-flex align-self-stretch">
			              <input type="button"  onclick="searchSubmit()" value="찾기" class="btn btn-primary py-3 px-4 align-self-stretch">
			            </div>
	        			</div>
	        		</div>
	        	</form>
	    		</div>
    		</div>
    	</div>
    </section>
    <section class="ftco-section bg-light">
    	<div class="container">
				<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 class="mb-4">추천 숙소</h2>
          </div>
        </div>    		
    		<div class="row">
    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
    				<div class="room">
    					<a href="rooms" class="img d-flex justify-content-center align-items-center" style="background-image: url(/static/images/room-1.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3 text-center">
    						<h3 class="mb-3"><a href="rooms">Suite Room</a></h3>
    						<p><span class="price mr-2">$120.00</span> <span class="per">per night</span></p>
    						<hr>
    						<p class="pt-1"><a href="rooms-single" class="btn-custom">View Room Details <span class="icon-long-arrow-right"></span></a></p>
    					</div>
    				</div>
    			</div>
    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
    				<div class="room">
    					<a href="rooms" class="img d-flex justify-content-center align-items-center" style="background-image: url(/static/images/room-2.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3 text-center">
    						<h3 class="mb-3"><a href="rooms">Family Room</a></h3>
    						<p><span class="price mr-2">$20.00</span> <span class="per">per night</span></p>
    						<hr>
    						<p class="pt-1"><a href="room-single" class="btn-custom">View Room Details <span class="icon-long-arrow-right"></span></a></p>
    					</div>
    				</div>
    			</div>
    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
    				<div class="room">
    					<a href="rooms" class="img d-flex justify-content-center align-items-center" style="background-image: url(/static/images/room-3.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3 text-center">
    						<h3 class="mb-3"><a href="rooms">Deluxe Room</a></h3>
    						<p><span class="price mr-2">$150.00</span> <span class="per">per night</span></p>
    						<hr>
    						<p class="pt-1"><a href="room-single" class="btn-custom">View Room Details <span class="icon-long-arrow-right"></span></a></p>
    					</div>
    				</div>
    			</div>
    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
    				<div class="room">
    					<a href="rooms" class="img d-flex justify-content-center align-items-center" style="background-image: url(/static/images/room-4.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3 text-center">
    						<h3 class="mb-3"><a href="rooms">Classic Room</a></h3>
    						<p><span class="price mr-2">$130.00</span> <span class="per">per night</span></p>
    						<hr>
    						<p class="pt-1"><a href="room-single" class="btn-custom">View Room Details <span class="icon-long-arrow-right"></span></a></p>
    					</div>
    				</div>
    			</div>
    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
    				<div class="room">
    					<a href="rooms" class="img d-flex justify-content-center align-items-center" style="background-image: url(/static/images/room-5.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3 text-center">
    						<h3 class="mb-3"><a href="rooms">Superior Room</a></h3>
    						<p><span class="price mr-2">$300.00</span> <span class="per">per night</span></p>
    						<hr>
    						<p class="pt-1"><a href="room-single" class="btn-custom">View Room Details <span class="icon-long-arrow-right"></span></a></p>
    					</div>
    				</div>
    			</div>
    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
    				<div class="room">
    					<a href="rooms" class="img d-flex justify-content-center align-items-center" style="background-image: url(/static/images/room-6.jpg);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3 text-center">
    						<h3 class="mb-3"><a href="rooms">Luxury Room</a></h3>
    						<p><span class="price mr-2">$500.00</span> <span class="per">per night</span></p>
    						<hr>
    						<p class="pt-1"><a href="room-single" class="btn-custom">View Room Details <span class="icon-long-arrow-right"></span></a></p>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>
  <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
<%--   <%@ include file="/WEB-INF/views/include/footer.jsp" %> --%>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
  <script src="/static/js/bootstrap-datepicker.ko.js"></script>
  <script src="/static/js/jquery.timepicker.min.js"></script>
  <script src="/static/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/static/js/google-map.js"></script>
  <script src="/static/js/main.js"></script>
    
  </body>
</html>