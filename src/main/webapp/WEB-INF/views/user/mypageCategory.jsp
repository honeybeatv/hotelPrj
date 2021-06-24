<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="col-12 d-inline-flex" style="padding-top:10px;">
		<div class="col-md-2"></div>
		<button type="button" class="btn py-3 px-5" style="background-color:#8D703B; color:white; padding-left:30px; padding-right:30px;" 
				onclick="javascript:location.href='./userInfoView?userno='+${session_userno}">Information</button>
		<div class="col-md-2"></div>
		<button type="button" class="btn py-3 px-5" style="background-color:#8D703B; color:white; padding-left:30px; padding-right:30px;"
				onclick="javascript:location.href='./userReservationView?userno='+${session_userno}">Reservation</button>
		<div class="col-md-2"></div>
		<button type="button" class="btn py-3 px-5" style="background-color:#8D703B; color:white; padding-left:30px; padding-right:30px;"
				onclick="javascript:location.href='./userHostingEdit?userno='+${session_userno}">Hosting</button>
		<div class="col-md-2"></div>
	</div>

</body>
</html>