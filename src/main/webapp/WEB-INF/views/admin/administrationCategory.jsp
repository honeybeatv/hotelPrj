<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-12 d-inline-flex" pading="2px">
		<div class="col-md-2"></div>
		<li class="nav-item"><a href="javascript:location.href='./adminInfoView?userno='+${session_userno}" class="nav-link">Information</a></li>
		<div class="col-md-2"></div>
		<li class="nav-item"><a href="javascript:location.href='./user'" class="nav-link">Users</a></li>
		<div class="col-md-2"></div>
		<li class="nav-item"><a href="javascript:location.href='./user'" class="nav-link">Reservations</a></li>
		<div class="col-md-2"></div>
		<li class="nav-item"><a href="javascript:location.href='./user'" class="nav-link">Hostings</a></li>
		<div class="col-md-2"></div>
	</div>

</body>
</html>