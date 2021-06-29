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

    <div class="hero-wrap" style="background-image: url('/static/images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
          	<div class="text">
	            <p class="breadcrumbs mb-2"><span class="mr-2"><a href="../main/index">Home</a></span> <span>mypage</span></p>
	            <h1 class="mb-4 bread">Hosting</h1>
            </div>
          </div>
        </div>
      </div>
    </div>

	<c:import url="/WEB-INF/views/user/mypageCategory.jsp"></c:import>

	<section position="relative" width="100%" display="block" align="center" padding="2em">
		<div  class="col-12" style="display:inline-block;" >
			
            <form action="userHostingModifyDo" class="bg-white p-2 " width="100%">
				<table width="100%" >
				
					<tr>
						<td width="10%">숙소이름</td>
						<td width="5%">지역</td>
						<td width="6%">종류</td>
						<td width="6%">수용 가능 인원</td>
						<td width="6%">가격</td>
						<td width="4%">침대갯수</td>
						<td width="4%">방갯수</td>
						<td width="6%">흡연가능 여부</td>
						<td width="6%">동물가능 여부</td>
						<td width="40%">주소</td>
						<td width="3%">   </td>
						<td width="3%"><button type="button" class=" btn-light" onclick="javascript:location.href='../room/roomsadd?userno='+${session_userno}">숙소추가</button></td>
					</tr>

					<tr height="1" bgcolor="#8f784b ">
						<td colspan="12"></td>
					</tr>

					<c:forEach var="roomVo" items="${userHostingModifyMap.userHostingModifyList }">
						<c:choose>
							<c:when test="${roomVo.roomNo == userHostingModifyMap.roomNo}">
								<tr id="${roomVo.roomNo}">
									<td style="width:10%;"><input type="text" name="rname" value="${roomVo.rname}"></td>
									<td style="width:5%;"><input type="text" name="rcity"  value="${roomVo.rcity}"></td>							
									<td style="width:6%;"><input type="text" name="rtype"  value="${roomVo.rtype}"></td>							
									<td style="width:6%;"><input type="text" name="rpeople"  value="${roomVo.rpeople}"></td>						
									<td style="width:6%;"><input type="text" name="rprice"  value="${roomVo.rprice}"></td>					
									<td style="width:4%;"><input type="text" name="rbed"  value="${roomVo.rbed}"></td>		
									<td style="width:4%;"><input type="text" name="rroom"  value="${roomVo.rroom}"></td>		
									<td style="width:6%;"><input type="text" name="rsmoke"  value="${roomVo.rsmoke}"></td>		
									<td style="width:6%;"><input type="text" name="rpet"  value="${roomVo.rpet}"></td>	
									<td style="width:40%;"><input type="text" name="raddress"  value="${roomVo.raddress}"></td>		
									<td><button type="submit" class=" btn-light" >저장</button></td>		
									<td><button type="button" class=" btn-light" id="goto_userHostingView">취소</button></td>		
								</tr>
							</c:when>
							<c:otherwise>
								<tr id="${roomVo.roomNo}">
									<td>
										<a href="*숙소링크*bno=${roomVo.roomNo}">${roomVo.rname}</a>
									</td>
									<td>${roomVo.rcity}</td>							
									<td>${roomVo.rtype}</td>							
									<td>${roomVo.rpeople}</td>							
									<td>${roomVo.rprice}</td>							
									<td>${roomVo.rbed}</td>		
									<td>${roomVo.rroom}</td>		
									<td>${roomVo.rsmoke}</td>		
									<td>${roomVo.rpet}</td>		
									<td>${roomVo.raddress}</td>		
								</tr>
							</c:otherwise>
						</c:choose>
						<input type="hidden" name="userno" value="${session_userno}" >
						<input type="hidden" name="roomNo" value="${roomVo.roomNo}" >
					</c:forEach>
				</table>
            </form>
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