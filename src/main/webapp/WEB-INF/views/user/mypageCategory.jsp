<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="col-12 d-flex justify-content-around" style="padding-top:10px;">
		<form action="../user/userInfoView"  method="post">
			<input type="hidden" id = "userno" name = "userno" value="${session_userno }">
			<button type="submit" class="btn py-3 px-5" style="background-color:#8D703B; color:white; padding-left:30px; padding-right:30px;" >Information</button>
		</form>
		<form action="../user/userReservationView" method="post">
			<input type="hidden" id = "userno" name = "userno" value="${session_userno }">
			<button type="submit" class="btn py-3 px-5" style="background-color:#8D703B; color:white; padding-left:30px; padding-right:30px;" >Reservation</button>
		</form>
		<form action="../user/userHostingView"  method="post">
			<input type="hidden" id = "userno" name = "userno" value="${session_userno }">
			<button type="submit" class="btn py-3 px-5" style="background-color:#8D703B; color:white; padding-left:30px; padding-right:30px;" >Hosting</button>
		</form>
	</div>

</body>
</html>