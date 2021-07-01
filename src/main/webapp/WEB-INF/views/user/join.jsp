<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Join Page</title>
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
  	
  	
  	function chkword(obj, maxByte) {
  		
		var strValue = obj.value;
		var strLen = strValue.length;
		var totalByte = 0;
		var len = 0;
		var oneChar = "";
		var str2 = "";
		
		for (var i = 0; i < strLen; i++){
			oneChar = strValue.charAt(i);
			if(escape(oneChar).length > 4){
				totalByte += 2;
			}else {
				totalByte++;
			}
			if(totalByte <= maxByte){
				len = i + 1;
			}
		}
		if(totalByte > maxByte){
			str2 = strValue.substr(0, len);
			obj.value = str2;
			chkword(obj, 4000);
		}
	}
  	
$(document).ready(function(){
	
	$(".sendMail").click(function() {// 메일 입력 유효성 검사
		var mail = $("#uemail").val(); //사용자의 이메일 입력값. 
		
		if (mail == "") {
			alert("메일 주소가 입력되지 않았습니다.");
		} else {
			// mail = mail+"@"+$(".domain").val(); //셀렉트 박스에 @뒤 값들을 더함.
				mail = $("#uemail").val();
			$.ajax({
				type : 'post',
				url : './CheckMail',
				data : {
					mail:mail
					},
				dataType :'json',
				success:function(data){
					$('#certify').val(data.key);
				}
			});
			alert("인증번호가 전송되었습니다.") 
			isCertification=true; //추후 인증 여부를 알기위한 값
		}
	});
	$("#compare").on("propertychange change keyup paste input", function() {
		
		var key=$('#certify').val();
		if ("" == key) {
			$(".compare-text").text("불일치!").css("color", "red");
			isCertification = false;
		}else if ($("#compare").val() == key) {   //인증 키 값을 비교를 위해 텍스트인풋과 벨류를 비교
			$(".compare-text").text("인증 성공!").css("color", "black");
			isCertification = true;  //인증 성공여부 check
		} else {
			$(".compare-text").text("불일치!").css("color", "red");
			isCertification = false; //인증 실패
		}
		
	});
	
	$("#joinBtn").click(function(){
		
        // 태크.val() : 태그에 입력된 값
        // 태크.val("값") : 태그의 값을 변경 
        var userid = $("#userid").val();
        var userpw = $("#userpw").val();
        var uemail = $("#uemail").val();
        var name = $("#name").val();
        var uphone = $("#uphone").val();
        var code = $("#compare").val();
        
        
        if(name == ""){
            alert("이름을 입력하세요.");
            $("#name").focus(); // 입력포커스 이동
            return; // 함수 종료
        }
        if(userid == ""){
            alert("아이디를 입력하세요.");
            $("#userid").focus(); // 입력포커스 이동
            return; // 함수 종료
        }
        if(userpw == ""){
            alert("비밀번호를 입력하세요.");
            $("#userpw").focus();
            return;
        }
       /*  if(userPw != $('#mbpw_re').val()){
        	alert("두 비밀번호가 다릅니다")
        	return;
        } */
        if(uemail == ""){
            alert("이메일을 입력하세요.");
            $("#uemail").focus();
            return;
        }
        if(code == ""){
            alert("인증번호를 입력하세요.");
            $("#compare").focus();
            return;
        }
        if(uphone == ""){
            alert("전화번호를 입력하세요.");
            $("#uphone").focus();
            return;
        }if(isCertification==false){
			alert("메일 인증이 완료되지 않았습니다.");
			return;
		}
        
        join_check()
       
        
    });
	
	function join_check(){
	 	   $.ajax({
	 			 url:'./join_check',
	 			 type:'post',
	 			 data:{
	 				 "userid":$("#userid").val(),
	 				 "userpw":$("#userpw").val(),
	 				 "uemail":$("#uemail").val(),
	 	        	 "name":$("#name").val(),
	 	        	 "uphone":$("#uphone").val(),
	 	        	 
	 			 },
	 			 success:function(data){
	 				 alert(data.msg);
	 				 if(data.flag=="success"){
	 				    location.href="../main/index";
	 				 }else{
	 					 $("#userpw").val("");//공백처리
	 					return false;
	 				 }
	 			 },
	 			 error:function(){
	 				 alert("에러");
	 			 }
	 		  });
	    }
	// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#userid").blur(function() {
		// id = "id_reg" / name = "userId"
		var userid = $('#userid').val();
		$.ajax({
			url : '${pageContext.request.contextPath}./id_check?userid='+ userid,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data.data);							
				
				if (data.data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#joinBtn").attr("disabled", true);
						
				} else 	{
						var idPattern = /^[a-zA-Z0-9]{4,10}$/;
						if(userid == ""){
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#joinBtn").attr("disabled", true);
							
						}
						else if(idPattern.test($("#userid").val())!=true){
							$('#id_check').text("아이디는 영어 소문자와 대문자 숫자 4~10자리만 가능합니다 :) :)");
							$('#id_check').css('color', 'red');
							$("#joinBtn").attr("disabled", true);
							
						} else{
							$('#id_check').text("사용가능한 아이디입니다 :) :)");
							$('#id_check').css('color', 'green');
							$("#joinBtn").attr("disabled", false);
							
						}
						
				 }
				}, error : function() {
						console.log("실패");
				}
			});
		});
		
	// 이메일 유효성 검사(1 = 중복 / 0 != 중복)
	$("#uemail").blur(function() {
		// id = "id_reg" / name = "userId"
		var uemail = $('#uemail').val();
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 검증에 사용할 정규식 변수 regExp에 저장 
		

		if(uemail == ""){
			$('#email_check').text('이메일을 입력해주세요 :)');
			$('#email_check').css('color', 'red');
			$("#joinBtn").attr("disabled", true);
		} else if(uemail.match(regExp) != null){
			$('#email_check').text("사용가능한 이메일입니다 :) :)");
			$('#email_check').css('color', 'green');
			$("#joinBtn").attr("disabled", false);
		} else{
			$('#email_check').text("이메일은 이메일형식에 맞게 입력해주세요 :) :)");
			$('#email_check').css('color', 'red');
			$("#joinBtn").attr("disabled", true);
		}			
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
	            <p class="breadcrumbs mb-2"><span class="mr-2"><a href="/">Home</a></span> <span>join</span></p>
	            <h1 class="mb-4 bread">Join</h1>
            </div>
          </div>
        </div>
      </div>
    </div>


    <section class="ftco-section contact-section bg-light" align="center">
		<div  class="col-6" style="display:inline-block;" >
            <form action="join_check" method="post" class="bg-white p-5 " width="100%">
				
				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label" style="font-weight:bolder;">이름</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" style="width:100%;" id="name" name="name">
					</div>
				</div>
				
				<div class="form-inline form-group">
					<label for="userid" class="col-sm-2 control-label" style="font-weight:bolder;">아이디</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" style="width:100%;" id="userid" name="userid" onkeyup="chkword(this, 10);">
					</div>
					<div id="id_check"  class="col-sm-3"></div>
				</div>
				
				<div class="form-inline form-group">
					<label for="userpw" class="col-sm-2 control-label" style="font-weight:bolder;">비밀번호</label>
					<div class="col-sm-7">
						<input type="password" class="form-control" style="width:100%;" id="userpw" name="userpw">
					</div>
				</div>
				
				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label" style="font-weight:bolder;">이메일</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" style="width:100%;" id="uemail" name="uemail">
					</div>
						<input type="button" value="인증" class="sendMail">
					<div id="email_check"  class="col-sm-3">ex)ya63kr@nate.com</div>
				</div>
				
				<div class="form-inline form-group">
				<input type='hidden' id='certify'>
					<label for="" class="col-sm-2 control-label" style="font-weight:bolder;">인증번호</label>
					<div class="col-sm-7">
						<input type="text" id="compare" style="width:100%;" name="num">
					</div>
					<div class="compare-text"></div>
				</div>
				
				<div class="form-inline form-group">
					<label for="" class="col-sm-2 control-label" style="font-weight:bolder;">핸드폰 번호</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" style="width:100%;" id="uphone" name="uphone">
					</div>
					<div class="col-sm-3">ex) -없이 작성하세요</div>
				</div>
				
				<input type="button" value="회원가입" id="joinBtn" class="btn btn-primary py-3 px-5" >
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