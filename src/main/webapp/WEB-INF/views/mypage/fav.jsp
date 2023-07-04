<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dndn</title>
<%@ include file="/WEB-INF/views/include/asset.jsp"%>
<style>
.container {
	background-color: #EDEDEF !important;
	margin-
}

#cardbox {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
	margin: 20px;
}

#card {
	text-align: center;
	border-radius: 10px;
	margin: 10px;
	padding: 10px;
	background-color: #F9F9D4;
	cursor: pointer;
}

#card>div {
	color: black;
	font-weight: bold;
	margin: 5px 5px 0px 5px;
}

#cimg {
	padding: 10px 10px 0px 10px;
}

#cimg >div{
	text-align: right;
}
#heart{
	
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div id="box">
		<%@ include file="/WEB-INF/views/include/mypage-header.jsp"%>
		<section class="container">
			<h1>찜</h1>
			<div id="cardbox">
				<div id="card">
					<div id="cimg">
						<img alt="" src="/dndn/resources/img/mypage/cart.png">
						<div id="heart"><img src="/dndn/resources/img/mypage/heart.png"></div>
					</div>
					
					<div>샐러드명</div>
					<div>찜한 날짜</div>
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














