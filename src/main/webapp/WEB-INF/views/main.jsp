<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘은 든든</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>

<style>
section {
	min-height: 100vh;
 	/* height: auto; */
}

.lunchbox-img-menu-wrapper{
	display : flex;
	justify-content : center;
	align-items : center;
	text-align:center;
	margin: 30px 0 30px 0;
}

.lunchbox-img-item{
	text-decoration: none;
	margin:15px;
}

.lunchbox-img{
	width:100px;
}

.lunchbox-img-item:hover{
	cursor:pointer;
}

.lunchbox-img-item:hover > div .lunchbox-text{
	color:var(--main-font-color);	
}

.lunchbox-img-item:hover > div .lunchbox-img{
	transform:scale(1.05);
	transition: transform .2s;
}

.lunchbox-list-title{
	font-family: '';
	text-align: center;
	font-size: 20px;
	font-weight: 900;
	margin: 50px 0 50px 0;
}

.swiper-slide {

	height:350px;
	text-align: center;
	font-size: 18px;
	background: #fff;
	display: flex;
	flex-direction: column;
	/*justify-content: center;*/
	align-items: center;
}

.lunchbox-list-img{
	border-radius: 5px;
	box-shadow: 2px 2px #eee;
	height:250px;
	overflow: hidden;
}

.lunchbox-list-img img{
	border-radius: 5px;
	height:250px;
	cursor:pointer;
}

.lunchbox-list-img:hover img{
	transform: scale(1.1);
}

.bestlunchbox-list-img{
	border-radius: 5px;
	box-shadow: 2px 2px #eee;
	height:230px;
	overflow: hidden;
}


.listInfo{
	width:230px;
	margin-top: 15px;
	text-align: left;
}

.listInfo p{
	margin:0px;
}

.btn-collection{
	text-align: center;
	margin-bottom: 50px;
}

.menubtn {
	background-color: #eee;
	border: #eee;
	margin: 0 10px 0 10px;
	border-radius: 10px;
	padding: 10px;
}

.menubtn.active{
	color:white;
	background-color: var(--main-font-color);
}
.menubtn:hover{
	color:white;
	background-color: var(--main-font-color);
}

.best-lunch-img{
	width:248px;
}


.sale{
	font-family: '';
	color: #FF6666;
	font-weight:900;
}

.price{
	font-family: '';
	font-size: 13px;
	font-weight:900;
	text-decoration-line: line-through;
	margin-right: 5px;
}
.saleprice{
	font-family: '';
	color: black;
	font-weight:900;
	font-size: 14px;
}

.right-recent-item {
	text-align:center;
	width:130px;
	position: fixed;
	top:220px;
	right:20px;
	min-height:100px;
	border: 1px solid #eee;
	z-index: 4;
	background-color: white;
}

.recent-item-text{
	text-align:center;
	color:white;
	background-color : var(--main-font-color);
}
.recent-item img{
	margin: 10px 0 10px 0;
	border-radius: 50%;
	width:100px;
}

.btn-close:active, .btn-close:focus {
	outline:none !important;
	box-shadow:none !important;
}


</style>
</head>
<body>
	<!-- main.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<div id="mainBannerCarousel" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="https://www.slimcook.co.kr/design/slimcook/product/2%2B1/6meal_2%2B1_eventbanner_w.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="https://www.slimcook.co.kr/design/slimcook/product/event/joinevent_eventbanner_w.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="https://www.slimcook.co.kr/design/slimcook/renewal/banner/slimlunch_w.jpg" class="d-block w-100" alt="...">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#mainBannerCarousel" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#mainBannerCarousel" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	
	<section class="container">
		<div class="lunchbox-img-menu-wrapper">
			<a class="lunchbox-img-item">
				<div>
					<img class="lunchbox-img" src="https://www.slimcook.co.kr/design/slimcook/renewal/quick_menu/quick_3.png">
					<p class="lunchbox-text">정기배송</p>
				</div>
			</a>
			<a class="lunchbox-img-item">
				<div>
					<img class="lunchbox-img" src="http://www.slimcook.co.kr/design/slimcook/renewal/quick_menu/quick_4.png">
					<p class="lunchbox-text">일반식</p>
				</div>
			</a>
			<a class="lunchbox-img-item">
				<div>
					<img class="lunchbox-img" src="http://www.slimcook.co.kr/design/slimcook/renewal/quick_menu/quick_2.png" >
					<p class="lunchbox-text">건강식</p>
				</div>
			</a>
			<a class="lunchbox-img-item">
				<div>
					<img class="lunchbox-img" src="http://www.slimcook.co.kr/design/slimcook/renewal/quick_menu/quick_7.png">
					<p class="lunchbox-text">프리미엄식</p>
				</div>
			</a>
		</div>


		<div class="lunchbox-list">
			<!-- 10개정도 -->
			<div class="lunchbox-list-title">이달에 가장 HOT한 상품
				<img src="http://www.slimcook.co.kr/design/slimcook/renewal/icon/fire.png" alt="불" width=16px>
			</div>
			<!-- 서버에서 많이 팔린 제품순으로 뿌려준다. -->

			<div class="swiper">
				<!-- Additional required wrapper -->
				<div class="swiper-wrapper">
					<!-- Slides -->
					<div class="swiper-slide">
						<div class="lunchbox-list-img">
							<img  src="http://www.slimcook.co.kr/shopimages/slimcook/002000000013.jpg?1679465417">
						</div>
						<div class="listInfo">
							<p>하루 900Kcal 프로그램</p>
							<p class="saleprice">144,900원</p>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="lunchbox-list-img">
							<img src="http://www.slimcook.co.kr/shopimages/slimcook/002000000013.jpg?1679465417">
						</div>
						<div class="listInfo">
							<p>여기는 아이템 이름2</p>
							<p ><span class="sale">30% </span> <span class="price">144,900</span> <span class="saleprice">90,900원</span> </p>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="lunchbox-list-img">
							<img src="http://www.slimcook.co.kr/shopimages/slimcook/002000000013.jpg?1679465417" height=200px>
						</div>
						<div class="listInfo">
							<p>여기는 아이템 이름3</p>
							<p>가격 얼마정도</p>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="lunchbox-list-img">
							<img src="http://www.slimcook.co.kr/shopimages/slimcook/002000000013.jpg?1679465417" height=200px>
						</div>
						<div class="listInfo">
							<p>여기는 아이템 이름4</p>
							<p>가격 얼마정도</p>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="lunchbox-list-img">
							<img src="http://www.slimcook.co.kr/shopimages/slimcook/002000000013.jpg?1679465417" height=200px>
						</div>
						<div class="listInfo">
							<p>여기는 아이템 이름5</p>
							<p>가격 얼마정도</p>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="lunchbox-list-img">
							<img src="http://www.slimcook.co.kr/shopimages/slimcook/002000000013.jpg?1679465417" height=200px>
						</div>
						<div class="listInfo">
							<p>여기는 아이템 이름6</p>
							<p>가격 얼마정도</p>
						</div>
					</div>
				</div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>

			</div>

		</div>


		<div class="lunchbox-list">
			<!-- 최대 10개정도 -->
			<div class="lunchbox-list-title">이번달 화려한 신상품
				<img src="https://www.slimcook.co.kr/design/slimcook/renewal/icon/newleaf.png" alt="풀" width=16px>
			</div>
			<!-- 서버에서 많이 팔린 제품순으로 뿌려준다. -->
			<div class="swiper">
				<!-- Additional required wrapper -->
				<div class="swiper-wrapper">
					<!-- Slides -->
					
					<c:forEach items="${list}" var="dto" >
					<div class="swiper-slide">
						<div class="lunchbox-list-img">
							<a href="<c:url value='/lunchdetail/detail.do?seq=${dto.sellboardseq}&period=F'/>">
								<img src="${dto.pic}" height=200px>
							</a>
						</div>
						<div class="listInfo">
							<p style="font-size:14px;">${dto.content}</p>
							<c:if test="${dto.sale != 0 }">
								<p ><span class="sale">${dto.sale}%</span> <span class="price">${dto.price}원</span> <span class="saleprice"><fmt:formatNumber value="${dto.price * (1-(dto.sale/100))}" pattern="#,###"></fmt:formatNumber>원</span> </p>
							</c:if>
							<c:if test="${dto.sale == 0}">
								<p><span class="saleprice">${dto.price}원</span></p>
							</c:if>
						</div>
					</div>
					</c:forEach>
				
				</div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div>
		</div>

		<div class="lunchbox-list">
			<div class="lunchbox-list-title">이번달 정기배송 BEST
				<img src="https://www.slimcook.co.kr/design/slimcook/renewal/icon/review.png" alt="정기" width=16px>
			</div>
			<!-- 서버에서 많이 팔린 제품순으로 뿌려준다. -->
			<div class="swiper">
				<!-- Additional required wrapper -->
				<div class="swiper-wrapper">
					<!-- Slides -->
					<div class="swiper-slide">
						<div class="lunchbox-list-img">
							<img src="http://www.slimcook.co.kr/shopimages/slimcook/002000000013.jpg?1679465417" height=200px>
						</div>
						<div class="listInfo">
							<p>[정기배송] 여기는 아이템 이름2</p>
							<p ><span class="sale">30% </span> <span class="price">144,900</span> <span class="saleprice">90,900원</span> </p>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="lunchbox-list-img">
							<img src="http://www.slimcook.co.kr/shopimages/slimcook/002000000013.jpg?1679465417" height=200px>
						</div>
						<div class="listInfo">
							<p>[정기배송] 여기는 아이템 이름2</p>
							<p ><span class="sale">30% </span> <span class="price">144,900</span> <span class="saleprice">90,900원</span> </p>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="lunchbox-list-img">
							<img src="http://www.slimcook.co.kr/shopimages/slimcook/002000000013.jpg?1679465417" height=200px>
						</div>
						<div class="listInfo">
							<p>[정기배송] 여기는 아이템 이름3</p>
							<p>가격 얼마정도</p>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="lunchbox-list-img">
							<img src="http://www.slimcook.co.kr/shopimages/slimcook/002000000013.jpg?1679465417" height=200px>
						</div>
						<div class="listInfo">
							<p>[정기배송] 여기는 아이템 이름4</p>
							<p>가격 얼마정도</p>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="lunchbox-list-img">
							<img src="http://www.slimcook.co.kr/shopimages/slimcook/002000000013.jpg?1679465417" height=200px>
						</div>
						<div class="listInfo">
							<p>[정기배송] 여기는 아이템 이름5</p>
							<p>가격 얼마정도</p>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="lunchbox-list-img">
							<img src="http://www.slimcook.co.kr/shopimages/slimcook/002000000013.jpg?1679465417" height=200px>
						</div>
						<div class="listInfo">
							<p>[정기배송] 여기는 아이템 이름6</p>
							<p>가격 얼마정도</p>
						</div>
					</div>
				</div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div>
		</div>


		<div class="lunchbox-list">
		
			<!-- 최대 10개정도 -->
			<div class="lunchbox-list-title">카테고리별 BEST 상품
				<img src="https://www.slimcook.co.kr/design/slimcook/renewal/icon/best.png" alt="왕관" width=16px>
			</div>
			<div class="btn-collection">
				<button class="menubtn active">일반식</button>
				<button class="menubtn">건강식</button>
				<button class="menubtn">프리미엄</button>
				<button class="menubtn">정기배송</button>
			</div>
			<div class="row">
				<div class="best-lunch-list col-md-3 col-lg-3 project col-sm-6">
					<div class="lunchbox-list-img ">
						<img src="https://lh3.googleusercontent.com/u/0/drive-viewer/AFGJ81qydTbx0ijdP6Yqlpr38C56Dr9aeAe_C0NISqHZ04tTUCk5atGevi64Qf7jMGPR4mzzFwB7el2SHIO9IFbjJuIBEslXBA=w1920-h941" class="best-lunch-list">
					</div>
					<div class="listInfo">
						<p>여기는 아이템 이름4</p>
						<p>가격 얼마정도</p>
					</div>
				</div>
				<div class="best-lunch-list col-md-3 col-lg-3 project col-sm-6">
					<div class="lunchbox-list-img best-lunch-list">
						<img src="http://www.slimcook.co.kr/shopimages/slimcook/002000000013.jpg?1679465417" class="best-lunch-img">
					</div>
					<div class="listInfo">
						<p>여기는 아이템 이름2</p>
						<p ><span class="sale">30% </span> <span class="price">144,900</span> <span class="saleprice">90,900원</span> </p>
					</div>
				</div>
				<div class="best-lunch-list col-md-3 col-lg-3 project col-sm-6">
					<div class="lunchbox-list-img best-lunch-list">
						<img src="http://www.slimcook.co.kr/shopimages/slimcook/002000000013.jpg?1679465417" class="best-lunch-img">
					</div>
					<div class="listInfo">
						<p>여기는 아이템 이름4</p>
						<p>가격 얼마정도</p>
					</div>
				</div>
				<div class="best-lunch-list col-md-3 col-lg-3 project col-sm-6">
					<div class="lunchbox-list-img best-lunch-list">
						<img src="http://www.slimcook.co.kr/shopimages/slimcook/002000000013.jpg?1679465417" class="best-lunch-img">
					</div>
					<div class="listInfo">
						<p>여기는 아이템 이름4</p>
						<p>가격 얼마정도</p>
					</div>
				</div>
			</div>
		</div>

		<div class="right-recent-item" >
			<div class="recent-item-text">&nbsp;&nbsp;&nbsp;최근 본 목록
				<button id="closebtn" type="button" class="btn-close btn-close-white" aria-label="Close" style="float:right;"></button>
			</div>
			<div class="recent-item">
				<img src="http://www.slimcook.co.kr/shopimages/slimcook/002000000013.jpg?1679465417">
			</div>
			<div class="recent-item">
				<img src="http://www.slimcook.co.kr/shopimages/slimcook/002000000013.jpg?1679465417">
			</div>
			<div class="recent-item">
				<img src="http://www.slimcook.co.kr/shopimages/slimcook/002000000013.jpg?1679465417">
			</div>
		</div>

	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script>

	$('#closebtn').click(function(){
		$('.right-recent-item').css('display','none');	
	});


	var swiper = new Swiper('.swiper', {
		slidesPerView: 3,
		direction: getDirection(),
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		}
	});

	function getDirection() {
		var windowWidth = window.innerWidth;
		var direction = window.innerWidth <= 760 ? 'vertical' : 'horizontal';
		return direction;
	}
</script>
</body>
</html>



