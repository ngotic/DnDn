<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/@fancyapps/ui/dist/fancybox.css"
/>
<style>
	body {
		font-family: pretendard;
	}
	#content {
	    min-width: 1100px;
	    width: 1100px;
	    margin: 0 auto;
	    margin-top: 50px;
		margin-bottom: 100px;
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
	.order-sec {
		margin-top: 20px;
		border-top: 1px solid #f2f2f2;
	}
	.order-close {
		position: relative;
   	 	left: 532px;
   	 	top:10px;
   	 	background-color: #fff;
	}
	.order-count {
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
		border: 1px solid #EE8035;
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
		object-fit: cover;
	    padding-top: 10px;
	    margin: 30px auto 0;
	    width: 860px;
	    text-align: left;
	}

	#productDetail .prd-detail img{
		width:100%;
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
	.review-list-detail{
		padding: 20px 20px;
	    font-size: 16px;
    	font-family: pretendard-regular;
    	border-bottom: 1px solid #dadada;
	}
	.review-detail-star {
		margin: 14px 0;
	}
	.review-detail-content {
		margin: 14px 0 30px 0;
	}
	.review-detail-info {
		float:right;
        margin: 0 11px 0 31px;
	}
	.review-detail-img {
	    width: 120px;
	    height: 120px;
	    object-fit: cover;
	}
	.review-detail-under {
		margin: 20px 0 10px 0;
	}
	.review-comment-btn {
	    width: 60px;
	    padding: 2px 0 0 0;
	    margin-right: 20px;
	    background-color: #fff;
    	border: 1px solid #dadada;
	}
	.review-comment-btn > span {
		color: #EE8035;
	}
	.review-like-btn {
		border: 1px solid #dadada;
	    width: 60px;
	    height: 26px;
	    display: inline-block;
	    text-align: center;
	    cursor: pointer;
	    padding: 1px;
	    margin-left: 10px;
	    color: #EE8035;
	}
	.delivery-info .sub-tit {
		display: inline-block;
		font-weight: 600;
		width: 90px;
		font-size: 15px;
	}
	.delivery-info .time {
		display: inline-block;
		font-weight: 600;
		font-size: 15px;
		width:350px;
	}
	.delivery-info .notice {
		display: block;
		padding-top: 20px;
		font-size: 12px;
		color: #b0b0b0 !important;
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
				<form id="form1" method="POST" action="/dndn/userorder/usercart.do?right=true">
				<div class="thumb-info">
					<div class="thumb-wrap">
						<div class="thumb">
							<img src="${ldto.pic}" class="detail_image" alt="상품이미지">
							<input type="hidden" name="pic" value="${ldto.pic}">
							<input type="hidden" name="content" value="${ldto.content}">
						</div>
					</div> <!-- thumb-wrap -->

					<!--  주문 form ajax list로	-->
					<div class="info">
						<h3 class="tit-prd">${ldto.content} </h3>
						<div class="price_div">
							<div class="price sell_price">
								<div class="tb-left">
									<c:if test="${ldto.sale!=0}">
									<span class="price_per">
										<span id="discount_percent_span">${ldto.sale} </span>%
									</span>
									</c:if>
									<span id="price"><fmt:formatNumber value="${ldto.price * (1-(ldto.sale/100))}" pattern="#,###"></fmt:formatNumber></span>
									<span class="price_won">원</span>
								</div>
							</div>
							<c:if test="${ldto.sale!=0}">
							<span class="price">
								<strike class="price_del">${ldto.price}</strike>원
								<input type="hidden" name="sale" value="${ldto.sale}">
								<input type="hidden" name="price" value="${ldto.price}">
							</span>
							</c:if>
						</div>
						<div class="table-opt">
							<table>
								<tbody>
									<tr>
										<td>지점</td>
										<td>
											<select id="sellLocation" name="storeseq" id="storeseq">
												<option value="0" selected>지점 선택</option>
												<c:if test="${locations!=null}">
													<c:forEach items="${locations}" var="location">
														<option value="${location.storeseq}">${location.name}</option>
													</c:forEach>
												</c:if>
											</select>
										</td>
									</tr>
									<tr>
										<td style="background-color: #F8F8F8; width:100%; padding:20px; margin-top: 10px">
											<div class="delivery-info">
												<div class="desc daily">
													<p class="sub-tit">일반배송</p>
													<p class="time">
														지금 주문 시
														<span class="highlight" >
															<fmt:setLocale value="ko"/>
															<c:set var="today" value="<%=new java.util.Date(new java.util.Date().getTime()+60*60*24*1000*2)%>" />
															<c:set var="month"><fmt:formatDate value="${today}" pattern="MM/dd(E)" /></c:set>
															<span class="month" style="color:#F79646;">&nbsp;<c:out value="${month}" /></span>
														도착예정
														</span>
													</p>
												</div>
												<div class="desc dawn" style="display: flex">
													<p class="sub-tit">배송비</p>
													<p class="time">
														3,000원 <span>(5만원 이상 주문 시 무료배송)</span><br>
														<span class="notice">*일/월요일, 공휴일은 수령일에서 제외 <br> *주문량 증가 시 순차발송될 수 있습니다. <br> *샐러드(신선식품)은 배송일자 상이하며, 상세페이지 내 출고일 및 유의사항을 참고바랍니다. </span>
													</p>
												</div>

											</div>
										</td>
									</tr>
									<!-- 정기배송만 아래에 해당된다. -->
<%--									<tr>--%>
<%--										<td>기간</td>--%>
<%--										<td>--%>
<%--											<select>--%>
<%--												<option value="" selected>옵션 선택</option>--%>
<%--												<option value="">2주(10팩)</option>--%>
<%--												<option value="">4주(20팩)</option>--%>
<%--												<option value="">8주(40팩)</option>--%>
<%--											</select>--%>
<%--										</td>--%>
<%--									</tr>--%>
<%--									<tr>--%>
<%--										<td>희망배송일</td>--%>
<%--										<td>--%>
<%--											<select>--%>
<%--												<option value="" selected>옵션 선택</option>--%>
<%--												<option value="">월요일</option>--%>
<%--												<option value="">화요일</option>--%>
<%--												<option value="">수요일</option>--%>
<%--												<option value="">목요일</option>--%>
<%--												<option value="">금요일</option>--%>
<%--											</select>--%>
<%--										</td>--%>
<%--									</tr>--%>
<%--									<tr>--%>
<%--										<td>배송방식</td>--%>
<%--										<td>--%>
<%--											<select>--%>
<%--												<option value="" selected>옵션 선택</option>--%>
<%--												<option value="">아침배송</option>--%>
<%--												<option value="">점심배송</option>--%>
<%--											</select>--%>
<%--										</td>--%>
<%--									</tr>--%>
									
									<!-- ajax 처리로 띄울 것 -->
									<tr>
										<td colspan="2" id="order">

											<div class="order-sec MK_optAddWrap">
												<button class="order-close" type="button"><span class="material-symbols-outlined">close</span></button>
												<div>[ 수량선택 ]</div>
												<div class="order-div-left align-middle">
													<input id="cnt" type="text" value=1 class="order-count" name="cnt">
													<button class="order-btn-plus" type="button"><span class="material-symbols-outlined">add</span></button>
													<button class="order-btn-minus" type="button" ><span class="material-symbols-outlined" >remove</span></button>
												</div>
												<!--이건 클래스 -->
												<div class="order-div-right"><fmt:formatNumber value="${ldto.price * (1-(ldto.sale/100))}" pattern="#,###"></fmt:formatNumber>원</div>
											</div>


											<div class="order-div-clear">
												<span>총 상품금액</span>

												<div style="float:right;">
													<!--이건 id -->
													<span id="total_price"></span>
												</div>
											</div>
										</td>
									</tr>

								</tbody>
							</table>
						</div> <!-- .table-opt -->
						
						<!-- 찜, 장바구니, 구매하기 버튼 -->
						<div class="order-btn-div">
							<button class="btn-wish" type="button"><span class="btn-wish-heart">
							<c:if test="${boardlike == null}">
								♡
							</c:if>
							<c:if test="${boardlike != null}">
								<c:if test="${boardlike > 0}">
									♥
								</c:if>
								<c:if test="${boardlike == 0}">
									♡
								</c:if>
							</c:if>
							</span></button>
							<button class="btn-cart" type="button">장바구니</button>
<%--							<button class="btn-buy" onclick="location.href='<c:url value='/userorder/usercart.do?right=true'/>';">바로 구매하기</button>--%>
							<button class="btn-buy" type="button" onclick="formcheck();"/>바로 구매하기</button>
							<input type="hidden" id ="storename" name="storename" value="">
							<input type="hidden" id="sellboardseq" name="sellboardseq" value="${ldto.sellboardseq}">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</div>
					</div>
				</div> <!-- thumb-info 결제 칸까지 -->
				</form>
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
					<c:forEach items="${ldto.detailUrl}" var="pic">
						<img src="${pic}" alt="도시락 상세 정보">
					</c:forEach>

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
					
						<!-- 평균 별점, 5,4,3,2,1점 댓글개수, 등.. 시간 남으면 구현 -->
						<div class="info" style="padding-right: 349px;">
						</div>
												
						<!-- 댓글쓰기 -->
						<div class="write">
	                        <form name="prw_form" id="prw_form" action="" method="post" autocomplete="off">
		                        <div style="padding-top: 10px;">
									<select id="review-star">
										<option value="5"><span style="color:yellow;">★★★★★</span> 아주만족</option>
										<option value="4">★★★★ 만족</option>
										<option value="3">★★★ 보통</option>
										<option value="2">★★ 미흡</option>
										<option value="1">★ 불만족</option>
									</select>
								</div>
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
	                    
	                    <!-- 리뷰 목록 -->
	                    <div class="review-list">
	                    	<!-- 반복문 돌리는 부분 -->
	                    	<div class="review-list-detail">
								<div class="review-detail-star"><span style="color:#EBC334;">★★★★★</span> <b>아주만족</b></div>
	                    		<div class="review-detail-info">
	                    			작성자: 박**<br>
	                    			등록일: 2023-06-01<br>
	                    		</div>
	                    		<div class="review-detail-content">
	                    			안전하게 잘 왔어요.그린샐러드만 먹다가 주문해봤는데 기대되네요.
	                    		</div>
	                    		<div>
	                    			<a href="/dndn/resources/img/lunchboximg/도시락상세1.jpg" data-fancybox><img src="/dndn/resources/img/lunchboximg/도시락상세1.jpg" alt="리뷰이미지" class="review-detail-img"></a>
	                    		</div>
	                    		<div class="review-detail-under">
	                    			<button class="review-comment-btn"><span class="material-symbols-outlined">chat</span> 1</button>
	                    			리뷰가 도움이 되셨나요? <span class="review-like-btn">♡</span>
	                    		</div>
	                    	</div>
	                    </div> <!-- .review-list -->
					</div> <!-- .powerReview -->
				</div> <!-- 댓글 -->
				
				
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
                
			</div> <!-- .page-body -->
		</div> <!-- #productDetail -->
	</div> <!-- #content -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 	
<script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>

<script>
	$(document).ready(function(){


		$("#sellLocation").on("change", function(){
			$('#storename').val($("#sellLocation option:checked").text());
		});

		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		const WishButton = document.querySelector('.btn-wish-heart');
		$('#total_price').text($('#price').text()+"원");

	//
	$('.btn-wish').click(function(){
		let sellboardseq ='${ldto.sellboardseq}';
		$.ajax({
			type: 'PUT',
			url: '/dndn/wish/addorDeleteWish',
			headers: {"content-type" : "application/json"}, // 보내는 데이터
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			data : JSON.stringify({sellboardseq : sellboardseq, id:"xxxx"}),
			success : function(result) {
				toggleHeart();
			} ,
			error : function (a, b, c){
				console.log(a ,b, c)
				if(b == 'error') {
					new Swal('서비스이용 실패', '로그인 해주세요. 로그인 페이지로 이동합니다.','error').then(function() {
						location.href='/dndn/auth/login.do';
					});
				}
			}
		});
	});

	function toggleHeart() {
		if (WishButton.textContent.trim() == '♡') {
			WishButton.textContent = '♥';
		} else {
			WishButton.textContent = '♡';
		}
	}

	$('.btn-buy').click(function(){
		if( $("#sellLocation option:checked").val() =='0'){
			alert('지점을 선택하세요.');
			return false;
		}
		else {
			$('#form1').submit();
		}
	});

	// function formcheck(){
	//
	// 	alert($("#sellLocation option:checked").text());
	//
	// 	if( $("#sellLocation option:checked").val() =='0')
	// 		return false;
	// 	else
	// 		return true;
	// }
    //
	<%--$('.btn-buy').click(function(){--%>

	<%--	let sellboardseq ='${ldto.sellboardseq}';--%>

	<%--	alert('여기는 직구 ');--%>
	<%--	e.preventDefault();--%>
	<%--	return false;--%>

	<%--});--%>


	$('.btn-cart').click(function(){

		if( $("#sellLocation option:checked").val() =='0'){
			alert('지점을 선택하세요.');
			return false;
		}

		let sellboardseq = $('#sellboardseq').val();
		let cnt = $('#cnt').val();
		let storeseq = $("#sellLocation option:checked").val();

		$.ajax({
			type: 'POST',
			url: '/dndn/cart/addCart',
			headers: {"content-type" : "application/json"}, // 보내는 데이터
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			data : JSON.stringify({
				id : 'xxxx',
				sellboardseq : sellboardseq,
				cnt : cnt,
				storeseq : storeseq
			}),
			success : function(result) {
				if(result=='OK')
					new Swal('장바구니', '장바구니에 추가하였습니다.','success');
				else new Swal('서비스이용 실패', '로그인 해주세요. 로그인 페이지로 이동합니다.','error').then(function() {
					location.href='/dndn/auth/login.do';
				});


			} ,
			error : function (a, b, c){
				console.log(a ,b, c)
				if(b == 'error') {
					new Swal('서비스이용 실패', '로그인 해주세요. 로그인 페이지로 이동합니다.','error').then(function() {
						location.href='/dndn/auth/login.do';
					});
				}
			}
		});
	});
	
	//좋아요 버튼 토클
	const likeButton = document.querySelector('.review-like-btn');
	
	function toggleHeart2() {
	  if (likeButton.textContent === '♡') {
	    likeButton.textContent = '♥';
	  } else {
	    likeButton.textContent = '♡';
	  }
	}
	likeButton.addEventListener('click', toggleHeart2);

	let ordercnt = $('.order-count');

	let reg = /^[0-9]/g; //숫자만 입력하는 정규식

	ordercnt.keyup(function(){

		let ordercnt = $(this);

		if ( !reg.test(ordercnt.val().trim()) ) {
			alert("올바른 숫자를 입력해주세요.");
			ordercnt.val(1);
			ordercnt.focus();
			return;
		}
		if ( parseInt(ordercnt.val()) < 1 ||  parseInt(ordercnt.val()) > 99 ) {
			alert("올바른 숫자를 입력해주세요.");
			ordercnt.val(1);
			ordercnt.focus();
			return;
		}
		$(this).parent().next().text(convertNumToPrice(parseInt(ordercnt.val())*parseInt($('#price').text().replaceAll(',',''))));
		updatePrice();
	});

	// 숫자 -> 가격
	function convertPriceToNum(price){
		return String(price).replaceAll('원','').replaceAll(',','');
	}
	// 가격 -> 숫자
	function convertNumToPrice(num){
		return parseInt(String(num)).toLocaleString()+'원';
	}

	$(".order-btn-plus").click(function(){
		let ordercnt = $(this).prev();
		ordercnt.val( parseInt(ordercnt.val())+1);
		$(this).parent().next().text(convertNumToPrice(parseInt(ordercnt.val())*parseInt($('#price').text().replaceAll(',',''))));
		if(parseInt(ordercnt.val()) > 99){
			alert('최대 100개까지 주문이 가능합니다.');
			return;
		}
		updatePrice();
	});


	$(".order-btn-minus").click(function(){
		let ordercnt = $(this).prev().prev();
		if(parseInt(ordercnt.val()) > 1)
			ordercnt.val( parseInt(ordercnt.val())-1);
		else
			return false;
		$(this).parent().next().text(convertNumToPrice(parseInt(ordercnt.val())*parseInt($('#price').text().replaceAll(',',''))));
		updatePrice();
	});

	function updatePrice() {
		let sum = 0;
		$('.order-div-right').each(function(index,item){
			sum = sum + convertPriceToNum($(this).text());
		});
		$('#total_price').text(convertNumToPrice(sum));
	};


	});
</script>
</body>
</html>














