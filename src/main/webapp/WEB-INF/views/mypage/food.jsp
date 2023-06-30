<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dndn</title>
<%@ include file="/WEB-INF/views/include/asset.jsp"%>
<style>
#contentbox {
	margin-top: 20px;
	width: 1000px;
	height: 500px;
	background-color: #D9D9D9;
	overflow: hidden;
}

#caldetail {
	width: 50%;
	background-color: #FAF9D0;
	float: right;
	height: 100%;
	padding: 10px;
}

#caledetail::after {
	clear: right;
}

#morning, #lunch, #dinner {
	height: 30%;
}
</style>
</head>
<body>
	<div id="box">
		<%@ include file="/WEB-INF/views/include/mypage-header.jsp"%>
		<section class="container">
		<h1>식단 관리</h1>
			<div id="contentbox">
				<div id="cal"></div>
				<div id="caldetail">
					<div id="morning">아침</div>
					<hr>
					<div id="lunch">점심</div>
					<hr>
					<div id="dinner">
						저녁
						<p>아직 배달예정인 내역이 없습니다.</p>
						<p onclick="location.href='/dndn/mypage/order.do';" style="cursor:pointer;">주문하러 가보실까요?</p>
					</div>
				</div>
			</div>
		</section>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script>
		
	</script>
</body>
</html>














