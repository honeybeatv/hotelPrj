<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-12 d-inline-flex" style="padding-top:10px;">
		<div class="col-md-1"></div>
		<button type="button" class="btn py-3 px-5" style="background-color:#e6c598; padding-left:30px; padding-right:30px;" 
				onclick="javascript:location.href='./adminInfoView?userno='+${session_userno}" class="nav-link">Information</button>
		<div class="col-md-1"></div>
		<button type="button" class="btn py-3 px-5" style="background-color:#e6c598; padding-left:30px; padding-right:30px;" 
				onclick="javascript:location.href='./user'" class="nav-link">Users</button>
		<div class="col-md-1"></div>
		<button type="button" class="btn py-3 px-5" style="background-color:#e6c598; padding-left:30px; padding-right:30px;" 
				onclick="javascript:location.href='./user'" class="nav-link">Reservations</button>
		<div class="col-md-1"></div>
		<button type="button" class="btn py-3 px-5" style="background-color:#e6c598; padding-left:30px; padding-right:30px;" 
				onclick="javascript:location.href='./user'" class="nav-link">Hostings</button>
		<div class="col-md-1"></div>
	</div>

</body>
</html>