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
		<form action="./userInfoView"  method="post">
			<input type="hidden" id = "userno" name = "userno" value="${session_userno }">
			<button type="submit" class="btn py-3 px-5" style="background-color:#8D703B; color:white; padding-left:30px; padding-right:30px;" >Information</button>
		</form>
		<div class="col-md-2"></div>
		<form action="./userReservationView" method="post">
			<input type="hidden" id = "userno" name = "userno" value="${session_userno }">
			<button type="submit" class="btn py-3 px-5" style="background-color:#8D703B; color:white; padding-left:30px; padding-right:30px;" >Reservation</button>
		</form>
		<div class="col-md-2"></div>
		<form action="./userHostingView"  method="post">
			<input type="hidden" id = "userno" name = "userno" value="${session_userno }">
			<button type="submit" class="btn py-3 px-5" style="background-color:#8D703B; color:white; padding-left:30px; padding-right:30px;" >Hosting</button>
		</form>
		<div class="col-md-2"></div>
	</div>

</body>
</html>