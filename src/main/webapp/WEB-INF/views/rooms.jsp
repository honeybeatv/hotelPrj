<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Deluxe</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i" rel="stylesheet">

    <link rel="stylesheet" href="../static/css/open-iconic-bootstrap.min.css">
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
    
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">    
     </script>
     
  	</head>
  	<body>

    <c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>
    <!-- END nav -->

    <div class="hero-wrap" style="background-image: url('../static/images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
             <div class="text">
            </div>
          </div>
        </div>
      </div>
    </div>
    <section class="ftco-section bg-light">
    	<div class="container">
    		<div class="row">
	        <div class="col-lg-9">
		    		<div class="row">
		    			<c:forEach var="list" items="${listAndNums.list }" > 
		    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
		    				<div class="room">
		    					<a href="rooms-single?roomNo=${list.roomNo }&start=${start }&end=${end }" class="img d-flex justify-content-center align-items-center" style="background-image: url(../static/upload/${list.rpicture1});">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3 text-center">
		    						<h3 class="mb-3"><a href="rooms-single?roomNo=${list.roomNo }&start=${start }&end=${end }">${list.rname }</a></h3>
		    						<p><span class="price mr-2">${list.rprice }원</span> <span class="per">/ 일</span></p>
		    						<ul class="list">
		    							<li><span>권장인원:</span> ${list.rpeople }</li>
		    							<li><span>위치:</span> ${list.raddress }</li>
		    							<li><span>침대갯수:</span> ${list.rbed	 }</li>
		    						</ul>
		    					</div>
		    				</div>
		    			</div>
		    			 </c:forEach>
		    		</div>
		    	</div>
		    	<div class="col-lg-3 sidebar">
	      		<div class="sidebar-wrap bg-light ftco-animate">
	      			<h3 class="heading mb-4">상세조건 검색</h3>
	      			<form action="../room/advancedSearch" method="post">
	      			<input type="hidden" name="rcity" value="${rcity }">
	      			<input type="hidden" name="rpeople" value="${rpeople }">
	      				<div class="fields">
		              <div class="form-group">
		                <input type="text" name="inDate" id="checkin_date" value="${start }" class="form-control checkin_date" placeholder="Check In Date">
		              </div>
		              <div class="form-group">
		                <input type="text" name="outDate" id="checkin_date" value="${end }" class="form-control checkout_date" placeholder="Check Out Date">
		              </div>
		              <div class="form-group">
		                <div class="select-wrap one-third">
	                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                    <select name="rtype" id="" class="form-control">
	                    	<option value="아파트" ${(rtype eq '아파트')? 'selected' : '' }>아파트</option>
		                     <option value="집" ${(rtype eq '집')? 'selected' : '' }>주택</option>
		                     <option value="공동주택" ${(rtype eq '공동주택')? 'selected' : '' }>공동주택</option>
		                     <option value="호텔" ${(rtype eq '호텔')? 'selected' : '' }>호텔</option>
		                     <option value="레지던스" ${(rtype eq '레지던스')? 'selected' : '' }>레지던스</option>
		                     <option value="호스텔" ${(rtype eq '호스텔')? 'selected' : '' }>호스텔</option>
	                    	<option value="기타" ${(rtype eq '기타')? 'selected' : '' }>기타</option>
	                    </select>
	                  </div>
		              </div>
		              <div class="form-group">
		                <div class="select-wrap one-third">
	                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                    <select name="rroom" id="" class="form-control">
	                    	<option value="1" ${(rroom eq '1')? 'selected' : '' }>침실 1</option>
		                    <option value="2" ${(rroom eq '2')? 'selected' : '' }>침실 2</option>
		                    <option value="3" ${(rroom eq '3')? 'selected' : '' }>침실 3</option>
		                    <option value="4" ${(rroom eq '4')? 'selected' : '' }>침실 4</option>
		                    <option value="5" ${(rroom eq '5')? 'selected' : '' }>침실 5</option>
		                    <option value="6" ${(rroom eq '6')? 'selected' : '' }>침실 6</option>
	                    	<option value="7" ${(rroom eq '7')? 'selected' : '' }>침실 7 이상</option>

	                    </select>
	                  </div>
		              </div>
		              <div class="form-group">
		                <div class="select-wrap one-third">
	                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                    <select name="rbed" id="" class="form-control">
	                    	<option value="1" ${(rbed eq '1')? 'selected' : '' }>침대 1</option>
	                      	<option value="2" ${(rbed eq '2')? 'selected' : '' }>침대 2</option>
	                      	<option value="3" ${(rbed eq '3')? 'selected' : '' }>침대 3</option>
	                      	<option value="4" ${(rbed eq '4')? 'selected' : '' }>침대 4</option>
	                      	<option value="5" ${(rbed eq '5')? 'selected' : '' }>침대 5</option>
	                      	<option value="6" ${(rbed eq '6')? 'selected' : '' }>침대 6</option>
	                    	<option value="7" ${(rbed eq '7')? 'selected' : '' }>침대 7 이상</option>
	                    </select>
	                  </div>
		              </div>
		              
		               <div class="form-group">
		              <input type="checkbox" name="rsmoke" id="rsmoke" value="smoke"  ${(rsmoke eq 'smoke')? 'checked' : ''}> 흡연실&emsp;
		              <input type="checkbox" name="rpet" id="rpet" value="pet" ${(rpet eq 'pet')? 'checked' : ''}> 반려동물
		              </div>
		              
		              <div class="form-group">
		              	<div class="range-slider">
		              		<span>
										    <input type="number" name="minPrice" id="minPrice" value="${(minPrice!=null)? minPrice : 25000 }" min=0 max="999999" style="width: 73px"/>원	-
										    <input type="number" name="maxPrice" id="maxPrice" value="${(maxPrice!=null)? maxPrice : 50000 }" min="0" max="999999"/>원
										  </span>
										</div>
		              </div>
		              <div class="form-group">
		                <input type="submit" value="Search" class="btn btn-primary py-3 px-5"">
		              </div>
		            </div>
	            </form>
	      		</div>

	        </div>
		    </div>
		    
														  	 
		    
		    <!-- c태그 if문으로 rbed나 rroom같이 AdvancedSearch에서 쓰는 파라미터가 0이면 Search조건으로 뜨도록 하고  
		    1이상이면 링크를 AdvancedSearch로 연결되어서 뜨도록..........우웩 토한다-->
		    <!-- AdvancedSearch의 경우 start-->
		    
		     <!-- <div class="row mt-5"> -->
          <div class="col text-center">
            <div class="block-27">
		    <c:if test= "${rroom>=1}">
              <ul>
              
              
              	<!-- 이전 페이지는 1이상일 때 표시, 링크 -->
			      <c:if test="${listAndNums.page>1 }">
			      	<li><a href="./advancedSearch?page=${listAndNums.page-1 }&inDate=${start}&outDate=${end}&rtype=${rtype }&rroom=${rroom }&rbed=${rbed }&minPrice=${minPrice }&maxPrice=${maxPrice }&rpet=${rpet }&rsmoke=${rsmoke }&rcity=${rcity }&rpeople=${rpeople }">&lt;</a></li>
			      </c:if>
			      			      
			       <!-- 번호 넣기 -->
			      <c:forEach var="nowPage" begin="${listAndNums.startPage }" end="${listAndNums.endPage }">
			      	<c:if test="${listAndNums.page == nowPage }">
			      	  <li><a>${nowPage }</a></li>
				    </c:if>
				    <c:if test="${listAndNums.page != nowPage }">
			      	  <li>
			      		<a href="./advancedSearch?page=${nowPage }&inDate=${start}&outDate=${end}&rtype=${rtype }&rroom=${rroom }&rbed=${rbed }&minPrice=${minPrice }&maxPrice=${maxPrice }&rpet=${rpet }&rsmoke=${rsmoke }&rcity=${rcity }&rpeople=${rpeople }">${nowPage}</a>
			      	  </li>
				    </c:if>
			      </c:forEach>
			      
			      <!-- 다음 페이지는 max보다 작을 때 +1 증가, max이상일 때 링크삭제 -->		      			      
			      <c:if test="${listAndNums.page<listAndNums.maxPage }">
			      	<li>
			      		<a href="./advancedSearch?page=${listAndNums.page+1 }&inDate=${start}&outDate=${end}&rtype=${rtype }&rroom=${rroom }&rbed=${rbed }&minPrice=${minPrice }&maxPrice=${maxPrice }&rpet=${rpet }&rsmoke=${rsmoke }&rcity=${rcity }&rpeople=${rpeople }">&gt;</a>
			      	</li>
			      </c:if>

              </ul>
		    </c:if>
		    

		    
		    <!-- search의 경우 -->
		    <c:if test= "${rtype==null}">
              <ul>              
              
              	<!-- 이전 페이지는 1이상일 때 표시, 링크 -->
			      <c:if test="${listAndNums.page>1 }">
			      	<li><a href="./search?page=${listAndNums.page-1 }&startDate=${start}&endDate=${end}&rpeople=${rpeople }&rcity=${rcity }">&lt;</a></li>
			      </c:if>
			      
			      
			       <!-- 번호 넣기 -->
			      <c:forEach var="nowPage" begin="${listAndNums.startPage }" end="${listAndNums.endPage }">
			      	<c:if test="${listAndNums.page == nowPage }">
			      	  <li><a>${nowPage }</a></li>
				    </c:if>
				    <c:if test="${listAndNums.page != nowPage }">
			      	  <li>
			      		<a href="./search?page=${nowPage  }&startDate=${start}&endDate=${end}&rpeople=${rpeople }&rcity=${rcity }">${nowPage }</a>
			      	  </li>
				    </c:if>
			      </c:forEach>
			      
			      <!-- 다음 페이지는 max보다 작을 때 +1 증가, max이상일 때 링크삭제 -->
			      <c:if test="${listAndNums.page<listAndNums.maxPage }">
			      	<li>	
			      		<a href="./search?page=${listAndNums.page+1  }&startDate=${start}&endDate=${end}&rpeople=${rpeople }&rcity=${rcity }">&gt;</a>
			      	</li>
			      </c:if>
			    <!-- search의 경우 end -->  

              </ul>
		    </c:if>
            </div>
          </div>
		  
        
    	</div>
    </section>


   <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
    
  

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
  <script src="/static/js/jquery.timepicker.min.js"></script>
  <script src="/static/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/static/js/google-map.js"></script>
  <script src="/static/js/main.js"></script>
    
  </body>
</html>
