<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Administration</title>
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
 		function ajax_adminUsersDelete(userno){
 			if(confirm("회원을 삭제하시겠습니까?")){
 				  $.ajax({
 						 url:'./adminUsersDelete',     
 						 type:'post',
 						 data:{
 							 "userno":userno
 						 },
 						 success:function(data){
 							 alert(data.msg);
 							 var html="";
 							 $('#'+userno).remove();
 						 },
 						 error:function(){
 							 alert("에러");
 						 }
 				  });
 			  }else{return false;}
 		}
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
	            <p class="breadcrumbs mb-2"><span class="mr-2"><a href="../main/index">Home</a></span> <span>Administration</span></p>
	            <h1 class="mb-4 bread"></h1>
            </div>
          </div>
        </div>
      </div>
    </div>

	<c:import url="/WEB-INF/views/admin/administrationCategory.jsp"></c:import>

	<section position="relative" width="100%" display="block" align="center" padding="2em">
		<div  class="col-11" style="display:inline-block;" >
            <form class="bg-white p-2 " width="80%" method="post">
				<table width="100%" >
				
					<tr>
						<td width="10%">userNo</td>
						<td width="15%">이름</td>
						<td width="16%">아이디</td>
						<td width="16%">비밀번호</td>
						<td width="16%">핸드폰번호</td>
						<td width="20%">이메일</td>
						<td width="6%">   </td>
					</tr>

					<tr height="1" bgcolor="#8f784b ">
						<td colspan="12"></td>
					</tr>

					<c:forEach var="userVo" items="${map.list }">
						<tr id="${userVo.userno}">
							<td>${userVo.userno}</td>
							<td>${userVo.name}</td>
							<td>${userVo.userid}</td>
							<td>${userVo.userpw}</td>
							<td>${userVo.uphone}</td>
							<td>${userVo.uemail}</td>
							<td><button type="button" class=" btn-light" onclick="ajax_adminUsersDelete('${userVo.userno}')">삭제</button></td>
						</tr>
					</c:forEach>

				</table>
				<!-- 하단 넘버링 -->
<!--     <ul class="page-num"> -->
      <a href="./adminUsersView?page=1"><li class="first"></li></a>
<!--       이전페이지는 1이상일때 -1을 해줌, 1일때는 링크 삭제시킴 -->
      <c:if test="${map.page<=1 }">
        <li class="prev"></li>
      </c:if>
      <c:if test="${map.page>1}">
        <a href="./adminUsersView?page=${map.page-1 }"><li class="prev"></li></a>
      </c:if>
      
<!--       번호넣기 -->
      <c:forEach var="nowPage" begin="${map.startPage}" end="${map.endPage }">
        <c:if test="${map.page == nowPage }">
          <li class="num"><div>${nowPage}</div></li>
        </c:if>
        <c:if test="${map.page != nowPage }">
          <li class="num">
            <a href="./adminUsersView?page=${nowPage}"><div>${nowPage}</div></a>
          </li>
        </c:if>
      </c:forEach>
<!--       다음페이지는 max보다 작을때 +1 증가, max보다 크거나 같을때 링크 삭제시킴 -->
      <c:if test="${map.page>=map.maxPage }">
        <li class="next"></li>
      </c:if>
      <c:if test="${map.page<map.maxPage }">
        <a href="./adminUsersView?page=${map.page+1 }"><li class="next"></li></a>
      </c:if>
<!--       마지막페이지 이동 -->
      <a href="./adminUsersView?page=${map.maxPage }"><li class="last"></li></a>
    </ul>
    <!-- 하단 넘버링 끝 -->
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