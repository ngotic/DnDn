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
	grid-template-rows: 1fr 1fr 1fr 100%;
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

.accordion {
	width: 100%;
	text-align: center;
}

.inner {
	display: grid;
	grid-template-columns: .5fr 1fr;
	grid-template-rows: 1fr 1fr 1fr 1fr;
	margin: 10px;
	width: 100%;
}

#accordion-body, tr {
	border: 1px solid;
}

.detailimg {
	grid-row: span 4;
}

.fimg {
	width: 120px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div id="box">
		<%@ include file="/WEB-INF/views/include/mypage-header.jsp"%>
		<section class="container">
			<h1>주문 조회</h1>
			<c:forEach items="${map.orderList}" var="oNum" varStatus="numStatus">
				<div id="card">
					<div id="cimg">
						<img src="/dndn/resources/img/mypage/bill.png">
					</div>
					<div>주문 날짜: ${oNum.orderdate.substring(0,10) }</div>
					<div>주문 번호: ${oNum.orderseq}</div>
					<div>가격: ${oNum.price.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")}원</div>
					<div class="btn">
						<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#${oNum.orderseq}"
										aria-expanded="true" aria-controls="collapseOne">상세보기
									</button>
								</h2>
								<c:forEach items="${map.Olist}" var="dto" varStatus="status">
									<c:if test="${oNum.orderseq == dto.orderseq }">

										<div id="${oNum.orderseq}" class="accordion-collapse collapse"
											aria-labelledby="headingOne"
											data-bs-parent="#accordionExample">
											<div class="accordion-body">
												<div class="inner">
													<div class="detailimg">
														<img class="fimg" src="${dto.pic }">
													</div>
													<div>샐러드명: [${dto.category}] ${dto.name }</div>
													<div>수량: ${dto.cnt }개</div>
													<div>단가: ${dto.price }</div>
													<div>가격:
														${Integer.parseInt(dto.price)*Integer.parseInt(dto.cnt) }원</div>
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
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














