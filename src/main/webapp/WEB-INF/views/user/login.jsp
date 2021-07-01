<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Login Page</title>
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
  	
  	<script>
$(document).ready(function(){
   $("#userpw, #userid").keypress(function(e) { 
       if (e.keyCode == 13){
          var userId = $("#userid").val();
           var userPw = $("#userpw").val();
           if(userId == ""){
               alert("아이디를 입력하세요.");
               $("#userid").focus(); // 입력포커스 이동
               return; // 함수 종료
           }
           if(userPw == ""){
               alert("비밀번호를 입력하세요.");
               $("#userpw").focus();
               return;
           }
           login_check()
           
       }   
   });
   
   $("#loginBtn").click(function(){
       // 태크.val() : 태그에 입력된 값
       // 태크.val("값") : 태그의 값을 변경 
       var userId = $("#userid").val();
       var userPw = $("#userpw").val();
       if(userId == ""){
           alert("아이디를 입력하세요.");
           $("#userid").focus(); // 입력포커스 이동
           return; // 함수 종료
       }
       if(userPw == ""){
           alert("비밀번호를 입력하세요.");
           $("#userpw").focus();
           return;
       }
       
       login_check()
       
       
   });
    
    function login_check(){
 	   $.ajax({
 			 url:'./login_check',
 			 type:'post',
 			 data:{
 				 "userid":$("#userid").val(),
 				 "userpw":$("#userpw").val(),
 				 "page":$("#page").val()
 			 },
 			 success:function(data){
 				 alert(data.msg);
 				 if(data.flag=="success"){
 				    location.href=data.page;
 				 }else{
 					 $("#userid").val(""); //공백처리 
 					 $("#userpw").val("");
 					return false;
 				 }
 			 },
 			 error:function(){
 				 alert("에러");
 			 }
 		  });
    }
    
});

function onEnterSubmit(){
	//alert("ok");
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
	            <p class="breadcrumbs mb-2"><span class="mr-2"><a href="/">Home</a></span> <span>login</span></p>
	            <h1 class="mb-4 bread">Login</h1>
            </div>
          </div>
        </div>
      </div>
    </div>


    <section class="ftco-section contact-section bg-light" align="center">
          <div class="col-4  d-inline-flex" >
          
            <form method="post" name="form1" action="login_check" class="bg-white p-5 contact-form">
            <input type="hidden" name="page" id="page" value="${page }">
              <div class="form-group">
                <input type="text" class="form-control" name="userid" id="userid" placeholder="아이디">
              </div>
              <div class="form-group">
                <input type="password" class="form-control" name="userpw" id="userpw" placeholder="비밀번호" onkeydown='javascript:onEnterSubmit()'>
              </div>
              <div class="form-group">
                <input type="button" value="로그인" id="loginBtn" class="btn btn-primary py-3 px-5">
              </div>
              <p class="message">ID가 없으신가요? <a href="join">회원가입</a></p>
            </form>
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