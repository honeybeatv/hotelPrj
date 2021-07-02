<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>예약 리스트</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">



<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i"
	rel="stylesheet">

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

  /* 댓글 취소 */
  function cancelReview_ajax(review_no,roomno,userno,redate,recontent,rescore,reviewpw){
	 alert("댓글취소 테스트"); 
	 var html=""
	 html = html + "<li class='name'>"+userno+"&nbsp;&nbsp;<span>["+redate+"]</span></li>";
	 html = html + "<li class='txt'>"+recontent+"</li>";
	 html = html + "<li class='btn'>";
	 html = html + "<a onclick=\"updateformReply_ajax("+review_no+",'"+roomno+"','"+userno+"','"+redate+"','"+recontent+"','"+rescore+"','"+reviewpw+"')\" class='rebtn'>수정</a>&nbsp;";
	 html = html + "<a onclick=\"deleteReview_ajax('"+review_no+"')\" class='rebtn'>삭제</a>";
	 html = html + "</li>";
	 $('#'+review_no).html(html);
	 
  }
  
  /* 댓글수정저장 완료 */
  function updateReview_ajax(review_no,userno){
	  alert("댓글수정저장 테스트");
	  
	  $.ajax({
			 url:'./reviewList',     
			 type:'post',
			 data:{
				 "review_no":review_no,
				 "bno":1,
				 "userno":userno, 
				 "reviewContent":$("#reviewUpdateContent").val()
			 },
			 success:function(data){
				 alert("data review_no : "+data.review_no);
				 var html="";
				 // 댓글의 번호를 통해 데이터 수정,삭제를 하기 위해
				 html = html + "<li class='name'>"+data.userno+"&nbsp;&nbsp;<span>["+data.redate+"]</span></li>";
				 html = html + "<li class='txt'>"+data.reviewContent+"</li>";
				 html = html + "<li class='btn'>";
				 html = html + "<a onclick=\"updateformReply_ajax("+review_no+",'"+roomno+"','"+userno+"','"+redate+"','"+recontent+"','"+rescore+"','"+reviewpw+"')\" class='rebtn'>수정</a>&nbsp;";
				 html = html + "<a onclick=\"deleteReview_ajax("+data.review_no+")\" class='rebtn'>삭제</a>";
				 html = html + "</li>";
				 $('#'+review_no).html(html);
			 },
			 error:function(){
				 alert("에러");
			 }
		  });
  }
  /* 댓글수정창 변경 - cancel처리하면 완료*/
  function updateformReview_ajax(review_no,roomno,userno,redate,recontent,rescore,reviewpw){
	  alert("update테스트 : "+review_no);
	  var html ="";
	  html = html + "<li class='name'>"+userno+" <span>[ "+redate+" ]</span></li>";
	  html = html + "<li class='txt'><textarea id='reviewUpdateContent' class='reviewType'>"+reviewContent+"</textarea></li>";
	  html = html + "<li class='btn'>";
	  html = html + "<a onclick=\"updateReview_ajax("+review_no+",'"+userno+"'"+")\" class='rebtn'>저장</a>";
	  html = html + "<a onclick=\"cancelReview_ajax("+review_no+",'"+roomno+"','"+userno+"','"+redate+"','"+recontent+"','"+rescore+"','"+reviewpw+"')\" class='rebtn'>취소</a>";
	  html = html + "</li>";
	  $('#'+review_no).html(html);
  }
  /* 댓글 추가 완료 */
  function review_ajax(){
	  if($("#recontent").val()=="" ||$("#recontent").val()==null ){
		  alert("데이터를 입력해주세요.");
		  return false;
	  }
	  
	  $.ajax({
		 url:'./reviewInsert',     
		 type:'post',
		 data:{
			 "userid":"${session_id}", //
			 "bno":1,
			 "replyPw":$("#reviewpw").val(),
			 "recontent":$("#recontent").val()
		 },
		 success:function(data){
			 alert("data test  : "+data.recontent);
			 alert("data review_no : "+data.reviewVo.review_no);
			 var html="";
			 var id = "${session_id}";
			 // 댓글의 번호를 통해 데이터 수정,삭제를 하기 위해
			 html = html + "<ul id='"+data.reviewVo.review_no+"'>";
			 html = html + "<li class='name'>"+id+"&nbsp;&nbsp;<span>["+data.reviewVo.redate+"]</span></li>";
			 html = html + "<li class='txt'>"+data.reviewVo.recontent+"</li>";
			 html = html + "<li class='btn'>";
			 html = html + "<a onclick=\"updateformReview_ajax("+data.reviewVo.review_no+",'"+data.reviewVo.roomno+"','"+data.reviewVo.userno+"','"+data.reviewVo.redate+"','"+data.reviewVo.recontent+"','"+data.reviewVo.rescore+"','"+data.reviewVo.reviewpw+"')\" class='rebtn'>수정</a>&nbsp;";
			 html = html + "<a onclick=\"deleteReview_ajax('"+data.reviewVo.review_no+"')\" class='rebtn'>삭제</a>";
			 html = html + "</li></ul>";
			 
			 $(".reviewBox").prepend(html);
			 $("#reviewCount").text(data.reviewCount);
			 $("#reviewPw").val("");
			 $("#reviewContent").val("");
		 },
		 error:function(){
			 alert("에러");
		 }
	  });
  }
  
  /* 댓글 삭제 완료 */
  function deleteReview_ajax(review_no){
	  alert("삭제 테스트");
	  alert("replyNo : "+review_no);
	  if(confirm("댓글을 삭제하시겠습니까?")){
		  $.ajax({
				 url:'/reviewdelete',     
				 type:'post',
				 data:{
					 "review_no":review_no,
				 },
				 success:function(data){
					 alert("data msg : "+data.msg);
					 var html="";
					 $("#reviewCount").text(data.reviewCount);
					 // text -> 글자만 넣음. html -> 기존html삭제후 추가
					 // prepend-> 앞에 넣음. expend->뒤에 넣음. remove->해당html삭제
					 $('#'+review_no).remove();
				 },
				 error:function(){
					 alert("에러");
				 }
		  });
	  }else{ return false; }
  }
</script>


</head>
<body>
	<c:import url="/WEB-INF/views/includes/nav.jsp"></c:import>



	<!--   댓글내용    -->
	<div class="replyWrite">
		<ul>
			<li class="in">
				<p class="txt">
					총 <span id="reviewCount" class="orange">${map.reviewCount }</span> 개의
					댓글이 달려있습니다.
				</p> <!-- 입력 -->
				<p class="password">
					비밀번호&nbsp;&nbsp;<input type="password" id="replyPw"
						class="replynum" />
				</p> <textarea id="recontent" class="reviewType"></textarea>
			</li>
			<li class="btn"><button type="button" onclick="review_ajax()"
					class="reviewBtn">등록</button></li>
		</ul>
		<p class="ntic">※ 비밀번호를 입력하시면 댓글이 비밀글로 등록 됩니다.</p>
	</div>



	<div class="reviewBox">
		<!-- 댓글수정창입니다. -->
		<!-- <ul>
							<li class="name">jjabcde <span>[2014-03-04&nbsp;&nbsp;15:01:59]</span></li>
							<li class="txt"><textarea class="replyType"></textarea></li>
							<li class="btn">
								<a href="#" class="rebtn">수정</a>
								<a href="#" class="rebtn">삭제</a>
							</li>
						</ul> -->


		<!-- 댓글 for문 시작 -->
		<c:forEach var="reviewVo" items="${map.reviewList}">
			<ul id="${reviewVo.replyNo }">
				<li class="name">${reviewVo.userno}<span>[
						${reviewVo.redate } ]</span></li>
				<li class="txt">${reviewVo.recontent }</li>
				<%-- id가 일치하면 버튼생성 --%>
				<c:if test="${session_id == reviewVo.userno}">
					<li class="btn"><a
						onclick="updateformReview_ajax('${reviewVo.review_no }','${reviewVo.userno}',
									'${reviewVo.recontent}','${reviewVo.redate }')"
						class="rebtn">수정</a> <a
						onclick="deleteReview_ajax('${reviewVo.replyNo}')" class="rebtn">삭제</a>
					</li>
				</c:if>
			</ul>
		</c:forEach>
		<!-- 댓글 for문 끝 -->

		<ul>
			<li class="name">jjabcde <span>[2014-03-04&nbsp;&nbsp;15:01:59]</span></li>
			<li class="txt">대박!!! 이거 저한테 완전 필요한 이벤트였어요!!</li>
			<li class="btn"><a onclick="updateReply_ajax()" class="rebtn">수정</a>
				<a href="#" class="rebtn">삭제</a></li>
		</ul>

		<ul>
			<li class="name">jjabcde <span>[2014-03-04&nbsp;&nbsp;15:01:59]</span></li>
			<li class="txt"><a href="password.html" class="passwordBtn"><span
					class="orange">※ 비밀글입니다.</span></a></li>
		</ul>
	</div>
			<!-- //contents -->
			


		</div>
	</div>

	<!-- Btn Area -->
	<div class="btnArea">
		<div class="bRight">
			<ul>
				<li><a href="#" class="sbtnMini mw">목록</a></li>
			</ul>
		</div>
	</div>
	<!-- //Btn Area -->

	<!-- //contents -->


	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<a href="roomsadd"><div class="write">등록</div></a>

	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="/static/js/google-map.js"></script>
	<script src="/static/js/main.js"></script>
	<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" />
<script type="text/javascript">
$(function(){
	
	var winWidth = $(window).width();
	if(winWidth > 767){
		var layerCheck = 540;
	}else{
		var layerCheck = 320;
	}
	$(".passwordBtn").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : layerCheck,
		'padding' : 0,
		'type'			: 'iframe',
		'onComplete' : function() {
			$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
			$('#fancybox-content').height($(this).contents().find('body').height());
			});
		}
	});
});
</script>


</body>
</html>