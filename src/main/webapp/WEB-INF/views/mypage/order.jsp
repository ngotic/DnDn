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
	background-color: #F7F7F7 !important;
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
	
	background-color: #F9F9D4;
}

#btn {
	text-align: right;
}
#accordion-body{
	display: grid;
	grid-template-columns: 1fr 1fr;
	grid-template-rows: 1fr 1fr 1fr;
}
.detailimg{
	grid-row: span 3;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div id="box">
		<%@ include file="/WEB-INF/views/include/mypage-header.jsp"%>
		<section class="container">
			<h1>주문 조회</h1>
			<c:forEach items="${Flist}" var="dto">
			<div id="card">
				<div id="cimg">
					<img alt="" src="/dndn/resources/img/mypage/cart.png">
				</div>
				<div>날짜: ${dto.orderseq }</div>
				<div>제목: ${dto.Lunchname }</div>
				<div>가격: ${dto.Integer.parseInt(sale)*Integer.parseInt(price)*Integer.parseInt(cnt) }</div>
				<div id="btn">
					<div class="accordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        상세보기
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
    
      <div id="accordion-body">
      <div class="detailimg">샐러드 이미지</div>
      <div>주문날짜</div>
      <div>샐러드명</div>
      <div>가격</div>
      </div>
    </div>
    </div>
    </div>
					<button>재구매</button>
				</div>
			</div>
			</c:forEach>
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














