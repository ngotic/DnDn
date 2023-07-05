<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="/dndn/resources/css/headerstyle.css">
<link rel="stylesheet" href="/dndn/resources/css/mypage-headerstyle.css">
<div id="sidebar">
	<div id="circle">
		<div id="in_circle">
			<img id="dlogo" src="/dndn/resources/img/logo_short.png">
		</div>
	</div>
	<div id="side-content">
		<div>
			<sec:authentication property="principal.username" />
		</div>
		<button onclick="location.href='/dndn/mypage/edit.do';">내 정보</button>
		<button onclick="location.href='/dndn/mypage/order.do';">주문관리</button>
		<button onclick="location.href='/dndn/mypage/food.do';">식단관리</button>
		<button onclick="location.href='/dndn/mypage/fav.do';">찜</button>
		<button onclick="location.href='/dndn/mypage/buylist.do';">장바구니</button>
		<form method="POST" action="/dndn/auth/logout.do">
			<button>LOGOUT</button>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}">
		</form>
		<form method="POST" action="/dndn/delacc">
			<button type="submit">회원탈퇴</button>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}"> <input type="hidden" name="id"
				value='<sec:authentication property="principal.username"/>'>
		</form>
	</div>
</div>