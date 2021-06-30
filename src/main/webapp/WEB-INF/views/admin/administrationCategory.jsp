<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-12 d-flex justify-content-around" style="padding-top:10px;">
		<form action="./adminInfoView"  method="post">
			<input type="hidden" id = "userno" name = "userno" value="${session_userno }">
			<button type="submit" class="btn py-3 px-5" style="background-color:#8D703B; color:white; padding-left:30px; padding-right:30px;" >Information</button>
		</form>
		<form action="adminUsersView"  method="post">
			<input type="hidden" id = "uadmin" name = "uadmin" value="${session_uadmin }">
			<button type="submit" class="btn py-3 px-5" style="background-color:#8D703B; color:white; padding-left:30px; padding-right:30px;" >Users</button>
		</form>
		<form action="./adminReservationView"  method="post">
			<input type="hidden" id = "uadmin" name = "uadmin" value="${session_uadmin }">
			<button type="submit" class="btn py-3 px-5" style="background-color:#8D703B; color:white; padding-left:30px; padding-right:30px;" >Reservations</button>
		</form>
		<form action="./adminUsersHosting"  method="post">
			<input type="hidden" id = "userno" name = "userno" value="${session_userno }">
			<button type="submit" class="btn py-3 px-5" style="background-color:#8D703B; color:white; padding-left:30px; padding-right:30px;" >Hostings</button>
		</form>
	</div>
</body>
</html>

