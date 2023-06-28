<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<style>
	body {
		font-family: pretendard;
	}
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
	    color: #EE8035;
	    font-weight: bold;
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
	#productDetail .thumb-info .info .table-opt * {
	    color: #555;
	}
	#productDetail .thumb-info .info .table-opt {
	    margin-top: 20px;
	    padding: 16px 0;
    	border-top: 1px solid #f2f2f2;
	}
	#productDetail .thumb-info .info .table-opt td:nth-child(1) {
	    float: left;
	    width: 150px;
	    margin-bottom: 8px;
	    padding-top: 4px;
	    *padding-bottom: 5px;
	    color: #555;
	    font-size: 16px;
	}
	#productDetail .thumb-info .info .table-opt #order {
	    float: left;
	    width: 550px;
	    margin-bottom: 8px;
	    padding-top: 4px;
	    *padding-bottom: 5px;
	    color: #555;
	    font-size: 16px;
	}
	#productDetail .thumb-info .info .table-opt td:nth-child(2) {
	    float: left;
	    width: 400px;
	    margin-bottom: 8px;
	    *padding-bottom: 5px;
	    font-size: 16px;
	}
	#productDetail .thumb-info .info .table-opt select {
	    width: 400px;
	    height: 32px;
	    font-size: 16px;
	}
	.MK_optAddWrap, .MK_optAddWrap * {
	    margin: 0;
	    padding: 0;
	}	
	#order-sec {
		margin-top: 20px;
		border-top: 1px solid #f2f2f2;
	}
	#order-close {
		position: relative;
   	 	left: 532px;
   	 	top:10px;
   	 	background-color: #fff;
	}
	#order-count {
		width: 60px;
	    height: 25px;
	    line-height: 24px;
	    border: 1px solid #dfdfdf;
	    text-align: center !important;
	}
	.material-symbols-outlined {
		font-size: 17px;
	}
	.order-btn {
		width:20px;
	}
	.order-div-left {
		margin: 20px 0px;
		float:left;
	}
	.order-div-right {
		margin: 20px 0px;
		float:right;
	}
	.order-div-clear {
		clear: both;
		padding-top: 20px;
		border-top: 1px solid #f2f2f2;
		display: flex;
    	justify-content: space-between;
    	font-size: 22px;
	}
	.order-btn-div {
		padding-top: 20px;
	}
	.btn-wish {
		float: left;
	    width: 54px;
	    box-sizing: border-box;
	    margin-right: 8px;
	    display: block;
	    height: 54px;
	    font-size: 16px;
	    color: #231f20;
	    text-align: center;
	    line-height: 45px;
	    border: 1px solid #B1B1B1;
	    background: #fff;
	    -webkit-transition: all 0.3s ease;
	    transition: all 0.3s ease;
	    border-radius: 5px;
	}
	.btn-wish > span {
		color: #EE8035;
		font-family: pretendard-regular;
		font-size: 25px;
	}
	.btn-cart {
		float: left;
	    width: 240px;
	    box-sizing: border-box;
	    margin-right: 8px;
	    display: block;
	    height: 54px;
	    font-size: 16px;
	    color: #231f20;
	    text-align: center;
	    line-height: 54px;
	    border: 1px solid #B1B1B1;
	    background: #fff;
	    -webkit-transition: all 0.3s ease;
	    transition: all 0.3s ease;
	    border-radius: 5px;
	}
	.btn-cart:hover {
		background: #EE8035;
		color:#fff;
	}
	.btn-buy {
		display: block;
	    width: 240px;
	    float: left;
	    box-sizing: border-box;	
	    height: 54px;
	    font-size: 16px;
	    color: #fff;
	    text-align: center;
	    line-height: 54px;
	    -webkit-transition: all 0.3s ease;
	    transition: all 0.3s ease;
	    border-radius: 5px;
	    background: #EE8035;
	}
	
	#productDetail .detailTab {
	    padding-top: 80px;
	    position: relative;
	    display: flex;
    	justify-content: center;
	}
	#productDetail .detailTab ul li {
	    margin-left: -1px;
	    float: left;
	    width: 320px;
	    height: 49px;
	    border: 1px solid #e4e4e5;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}
	li {
	    list-style: none;
	}
	#productDetail .thumb-info:after {
	    content: "";
	    display: block;
	    clear: both;
	}
	#productDetail .detailTab ul li.first {
		border-bottom: 3px solid #EE8035;
	}
	.detailTab a {
		color: #777;
		text-decoration: none;
	}
	.detailTab ul {
		padding-left: 0px !important;
	}
	#productDetail .detailTab ul:after {
	    display: block;
	    clear: both;
	    content: '';
	}
	#productDetail .prd-detail {
	    padding-top: 10px;
	    margin: 30px auto 0;
	    width: 860px;
	    text-align: left;
	    overflow: hidden;
	}
	#powerReview {
	    position: relative;
	    width: 100%;
	    min-width: 700px;
	    margin: 0 auto;
	    padding-bottom: 50px;
        color: #444;
	    font-family: Dotum, Sans-Serif;
	    font-size: 12px;
	    line-height: 1.25;
	    text-align: left;
	}
	#powerReview .info {
	    clear: both;
	    zoom: 1;
	    overflow: hidden;
	    position: relative;
	    height: 176px;
	    padding: 15px 349px 15px 239px;
	    border: 1px solid #dadada;
	}
	#review-star {
		font-family: pretendard;
    	font-size: 15px;
   	    width: 180px;
    	height: 32px;
    	border: 1px solid #dadada;
	}
	#powerReview .write {
	    position: relative;
	    margin-top: 8px;
	    padding: 18px;
	    padding-top: 10px;
	    border: 1px solid #dadada;
	    font-family: pretendard-regular;
   	 	font-size: 17px;
	}
	#powerReview .write textarea {
	    margin-top: 8px;
	    width: 100%;
	    height: 120px;
	    border: 0 none;
	    background: 0 none;
	    overflow: auto;
	    outline: none;
	}
	#powerReview .write .pr-txtbox {
	    position: relative;
	}
	#powerReview .btn-r {
        margin-top: 12px;
	    padding-top: 12px;
	    text-align: right;
	    border-top: 1px solid #dadada;
	}
	#powerReview .btn-h35 {
	    width: 200px;
	    text-align: center;
	    display: inline-block;
	    height: 35px;
	    line-height: 35px;
	    padding: 0 20px;
	    color: #fff;
	    font-size: 17px;
	    font-weight: bold;
	    letter-spacing: -1px;
        background: #EE8035;
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
										<td>
											<select>
												<option value="" selected>옵션 선택</option>
												<option value="">역삼점</option>
												<option value="">대치점</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>기간</td>
										<td>
											<select>
												<option value="" selected>옵션 선택</option>
												<option value="">2주(10팩)</option>
												<option value="">4주(20팩)</option>
												<option value="">8주(40팩)</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>희망배송일</td>
										<td>
											<select>
												<option value="" selected>옵션 선택</option>
												<option value="">월요일</option>
												<option value="">화요일</option>
												<option value="">수요일</option>
												<option value="">목요일</option>
												<option value="">금요일</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>배송방식</td>
										<td>
											<select>
												<option value="" selected>옵션 선택</option>
												<option value="">아침배송</option>
												<option value="">점심배송</option>
											</select>
										</td>
									</tr>
									
									<!-- ajax 처리로 띄울 것 -->
									<tr>
										<td colspan="2" id="order">
											<div id="order-sec"class="MK_optAddWrap">
												<button id="order-close"><span class="material-symbols-outlined">close</span></button>
												<div>[역삼점] 4주(20팩), 월요일, 아침배송</div>
												<div class="order-div-left">
													<input type="text" value=1 id="order-count">
													<button class="order-btn"><span class="material-symbols-outlined">add</span></button>
													<button class="order-btn"><span class="material-symbols-outlined">remove</span></button>
												</div>
												<div class="order-div-right">124,111원</div>
											</div>
											<div class="order-div-clear">
												<span>총 상품금액</span>
												<span>124,111원</span>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div> <!-- .table-opt -->
						
						<!-- 찜, 장바구니, 구매하기 버튼 -->
						<div class="order-btn-div">
							<button class="btn-wish"><span>♡</span></button>
							<button class="btn-cart">장바구니</button>
							<button class="btn-buy">구매하기</button>
                        </div>
                        
					</div>
				</div> <!-- thumb-info 결제 칸까지 -->
				
				<!-- 도시락탭 -->
				<a id="detailGoodsInfo"></a>
				<div class="detailTab">
					<ul>
						<li class="first"><a href="detailGoodsInfo" class="active">상품설명</a></li>
						<li><a href="#detailReview">리뷰(825)</a></li>	
						<li><a href="#detailRelation">배송/교환/반품</a></li>				
					</ul>
				</div>
				
				<!-- 디테일 -->
				<div class="prd-detail">
					<img src="/dndn/resources/img/lunchboximg/도시락상세1.jpg" alt="도시락 상세 정보">
				</div>
				
				<!-- 댓글탭 -->
				<a id="detailReview"></a>
				<div class="detailTab">
                    <ul>
                        <li ><a href="#detailGoodsInfo">상품설명</a></li>
                        <li class="first"><a href="#detailReview" class="active">리뷰(825)</a></li>
                        <li><a href="#detailRelation">배송/교환/반품</a></li>
                    </ul>
                </div>
                
                <!-- 댓글 -->
				<div style="width: 960px; margin: 0 auto;">
					<div id="powerReview">
						<div class="info" style="padding-right: 349px;">
							
					</div>
					<div style="padding-top: 10px;">
						<select id="review-star">
							<option value="5">★★★★★ 아주만족</option>
							<option value="4">★★★★ 만족</option>
							<option value="3">★★★ 보통</option>
							<option value="2">★★ 미흡</option>
							<option value="1">★ 불만족</option>
						</select>
					</div>
					<div class="write">
                        <form name="prw_form" id="prw_form" action="" method="post" autocomplete="off">
	                        <textarea name="content" placeholder="도시락은 어떠셨나요? 평가를 남겨주세요."></textarea>
	                        <div class="pr-file-wrap">
	                            <div class="file-attach">
		                            <a class="btn-h38 camera file btn-file" href="#none">
		                            	<input type="file" id="fileupload" name="file" class="file-trick">
		                            </a>
	                            </div>                        
                            </div>
                            <div class="btn-r">
                            	<button type="submit" class="btn-h35">리뷰등록</button>
                            </div>
                        </form> 
                    </div>
				</div>
				
				
				
				<!-- 배송/교환/반품 고지 탭 + 이미지-->
				<a id="detailRelation"></a>
				<div class="detailTab">
                    <ul>
                        <li ><a href="#detailGoodsInfo">상품설명</a></li>
                        <li><a href="#detailReview" class="active">리뷰(825)</a></li>
                        <li class="first"><a href="#detailRelation">배송/교환/반품</a></li>
                    </ul>
                </div>
                <div style="text-align:center;">
                	<img src="/dndn/resources/img/lunchboximg/배송교환반품.png" alt="배송,교환,반품" style="width: 960px;">
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














