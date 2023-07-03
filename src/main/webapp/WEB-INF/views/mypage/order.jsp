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
}

#card {
	display: grid;
	grid-template-columns: .2fr 1fr;
	grid-template-rows: 1fr 1fr 1fr 1fr;
	border-radius: 10px;
	margin: 20px;
	padding: 10px;
	background-color: white;
	font-size: 1.2rem;
}

#card>div {
	color: black;
	font-weight: bold;
	margin: 5px;
}

#cimg {
	grid-row: span 4;
	padding: 5px 5px 5px 0px;
	text-align: center;
}

button {
	width: 40%;
	border: none;
	color: black;
	font-weight: bold;
	background-color: #F9F9D4;
}

#btn {
	text-align: right;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div id="box">
		<%@ include file="/WEB-INF/views/include/mypage-header.jsp"%>
		<section class="container">
			<h1>주문 조회</h1>
			<div id="card">
				<div id="cimg">
					<img alt="" src="/dndn/resources/img/mypage/cart.png">
				</div>
				<div>날짜</div>
				<div>제목</div>
				<div>가격</div>
				<div id="btn">
					<button>상세보기</button>
					<button>재구매</button>
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














