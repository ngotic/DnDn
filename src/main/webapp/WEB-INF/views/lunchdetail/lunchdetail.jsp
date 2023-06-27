<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<style>

	#content {
	    min-width: 1100px;
	    width: 1100px;
	    margin: 0 auto;
	    margin-top: 50px;
	}
	#productDetail .page-body {
	    width: 1100px;
	    margin: 0 auto;
	}
	#productDetail .thumb-info .thumb-wrap {
	    float: left;
	    width: 500px;
	    text-align: center;
	}
	#productDetail .thumb-info .thumb {
	    margin: 0 auto;
	    width: 500px;
	}
	#productDetail .thumb-info .thumb img {
	    width: 100%;
	}
	img {
	    vertical-align: middle;
	}
	img, fieldset, button {
	    border: 0 none;
	}
	#productDetail .thumb-info .info {
	    float: right;
	    width: 550px;
	}
	#productDetail .thumb-info .info .tit-prd {
	    font-size: 22px;
	    color: #1c1c1c;
	    font-weight: bold;
	}
	#productDetail .thumb-info .info .price_div .tb-left {
	    padding: 16px 0 0;
	    font-size: 28px;
	    font-weight: bold;
	}
	.tb-left {
	    text-align: left;
	    font-size: 14px;
	}
	#productDetail .thumb-info .info .price_div .tb-left .price_per {
	    margin-right: 4px;
	}
	#productDetail .thumb-info .info .price_div .tb-left .price_per, #productDetail .thumb-info .info .price_div .tb-left .price_per span {
	    font-size: 28px;
	    color: rgb(0, 134, 90);
	    font-weight: bold;
	}
	#productDetail .thumb-info .info .table-opt {
	    margin-top: 20px;
	}
	table {
	    width: 100%;
	    border-collapse: collapse;
	    border-spacing: 0;
	    table-layout: fixed;
	    word-wrap: break-word;
	    word-break: keep-all;
        font-size: 14px;
	    color: rgb(28, 28, 28);
	    line-height: 1.25;
	}


</style>
</head>
<body>
	<!-- lunchdetail.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<section class="container">
		<!-- <h1>시작 페이지<small>없음</small></h1> -->
	</section>
	
	<div id="content">
		<div id="productDetail">
			<div class="page-body">
				<div class="thumb-info">
					<div class="thumb-wrap">
						<div class="thumb">
							<img src="/dndn/resources/img/lunchboximg/상품이미지1.jpg" class="detail_image" alt="상품이미지">
						</div>
					</div> <!-- thumb-wrap -->
					
					<!--  주문 form ajax list로	-->
					<div class="info">
						<h3 class="tit-prd">[정기배송]인기샐러드 5종 하루 한끼</h3>
						<div class="price_div">
							<div class="price sell_price">
								<div class="tb-left">
									<span class="price_per">
										<span id="discount_percent_span">23</span>%
									</span>
									114,000<span class="price_won">원</span>
								</div>
							</div>
							<span class="price">
								<strike class="price_del">148,000원</strike>
							</span>
						</div>
						<div class="table-opt">
							<table>
								<tbody>
									<tr>
										<td>지점</td>
										<td>2</td>
									</tr>
									<tr>
										<td>기간</td>
										<td>2</td>
									</tr>
									<tr>
										<td>희망배송일</td>
										<td>2</td>
									</tr>
									<tr>
										<td>배송방식</td>
										<td>2</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 	
<script>
</script>
</body>
</html>














