<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
</head>
<body>
	<h3>메인 페이지</h3>
	<c:choose>
	   <c:when test="${session_flag==null || session_flag=='fail' }">
	       <h3>로그인을 하시면 다른 메뉴가 보입니다.</h3>
				<li><a href="login">로그인</a></li>
				<li>회원가입</li>
	   </c:when>
	   
	   <c:otherwise>
	  		<h3>${session_id }님 접속을 환영합니다.</h3>
	        <li><a href="./search">게시판</a></li>
			<li><a href="/event/event">이벤트</a></li>
			<li><a href="/logout">로그아웃</a></li>
	   </c:otherwise>
	
	</c:choose>
	
	<ul>

	</ul>
</body>
</html>