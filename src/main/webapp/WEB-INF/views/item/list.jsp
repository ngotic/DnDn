<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>오늘은 든든</title>
  <%@ include file="/WEB-INF/views/include/asset.jsp" %>
  <style>

.btn-collection{
	text-align: center;
	margin-bottom: 30px;
}

.menubtn {
	border: #eee;
	margin: 0 10px 0 10px;
	padding: 10px 20px 10px 20px;
}

.menu_text {
	font-size: 15px;
	/* width:140px; */
	display:inline-block;
	padding: 5px;
 	position: relative;
 	transition: transform 500ms ease;
 	font-family : 'Noto Sans KR', sans-serif;
	font-weight: 700;
	border: 0px;
	background-color:white;
	margin : 25px 20px 30px 40px;
	transition: all ease 0.5s 0s;
}

.menu_text.active{
	color:var(--main-font-color);
}

.menu_text::after{
	content: '';
    width: 0%;
    left: 0;
    height: 3px;
    background: var(--main-font-color);
    position: absolute; 
    bottom:-6px;
    transition: all ease 0.5s 0s;
}

.menu_text.active::after{
    content: '';
    width: 100%;
    left: 0;
    height: 3px;
    background: var(--main-font-color);
    position: absolute; 
    bottom:-7px;
}


.menubtn.active{
	color:white;
	background-color: var(--main-font-color);
	
}
.menubtn:hover{
	color:white;
	background-color: var(--main-font-color);
}

.lunchbox-list-img{
	border-radius: 2px;
	height:285px;
	overflow: hidden;
}

.lunchbox-list-img img{
	border-radius: 5px;
	height:285px;
	width:100%;
	cursor:pointer;
}

.lunchbox-list-img:hover img{
	transform: scale(1.1);
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

.keywordlink{
  padding:5px;
  right:0;
  display:block;
  float:right;
}


.keywordlink a{
	text-decoration:none;
	color: #444;
}

.keywordlink:after{
	content: '';
	display: block;
	clear: right;
}
.cnt_result{
	font-family : 'Noto Sans KR', sans-serif;
	float:left;
	font-weight:bold;
}

    .paging {
        text-align: center;
    }
    .paging a {
    	font-size:12px;
        display: inline-block;
        font-weight: bold;
        text-decoration: none;
        padding: 5px 12px;
        border: 1px solid #ccc;
        color: #000;
        background-color: white;
    }
    .paging a span{
    	font-size:12px;
    }
    
    /* 현재 페이징에 select 클래스를 적용한다*/
    .paging a.select {
        color: #fff;
        background-color: var(--main-font-color);
    }
	.select_sort{
		color : var(--main-font-color) !important; 
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
#chatBox{
	position:fixed;
	bottom:0px;
	right:20px;
	color:black;
	background-color:white;
}
#chatBox *{
color:black;
background-color:white;
}

button.in{
	position:fixed;
	bottom:240px;
	right:200px;
	z-index:99;
}

#chat-channel-button{
	position: fixed;
	top:160px;
	right:35px;
}

  </style>
</head>
<body>

<%@ include file="/WEB-INF/views/include/header.jsp" %>



	
	<div class="lunchbox-list" style="border-bottom: 1px solid #eee;">
			<table id="categorySelect" style="text-align:center; margin:auto;">
				<tr>
					<td>
						<button class="menu_text ${pdto.category==0 ? 'active':''}" style="width:70%;" onclick="location.href='/dndn/list.do?page=1&category=0&sort=0';" >전체</button>
					</td>
					<td>
						<button class="menu_text ${pdto.category==1 ? 'active':''}" style="width:70%;" onclick="location.href='/dndn/list.do?page=1&category=1&sort=0';">일반식</button>
					</td>
					<td>
						<button class="menu_text ${pdto.category==2 ? 'active':''}" style="width:70%;" onclick="location.href='/dndn/list.do?page=1&category=2&sort=0';">건강식</button>
					</td>
					<td>
						<button class="menu_text ${pdto.category==3 ? 'active':''}" style="width:70%;" onclick="location.href='/dndn/list.do?page=1&category=3&sort=0';">프리미엄식 </button>
					</td>
					<td>
						<button class="menu_text ${pdto.category==4 ? 'active':''}" style="width:70%;" onclick="location.href='/dndn/list.do?page=1&category=4&sort=0';">정기배송</button>
					</td>
				</tr>
			</table>
	</div>
	 		
<section class="container">
	
  <div class="cnt_result">총 ${pdto.totalCnt}개
  </div>	
  <div class="keywordlink" >  		 
	  <a class="${pdto.sort==0 ? 'select_sort':''}" href="<c:url value='/list.do?${pdto.getQueryStringBySort(0, 1)}'/>">최신등록순</a> | <a class="${pdto.sort==1 ? 'select_sort':''}" href="<c:url value='/list.do?${pdto.getQueryStringBySort(1, 1)}'/>">인기도순</a> | <a class="${pdto.sort==2 ? 'select_sort':''}" href="<c:url value='/list.do?${pdto.getQueryStringBySort(2, 1)}'/>">낮은가격순</a> | <a class="${pdto.sort==3 ? 'select_sort':''}" href="<c:url value='/list.do?${pdto.getQueryStringBySort(3, 1)}'/>">높은가격순</a>
  </div>
  <div style="clear:both;"></div>
  
  <div class="lunchbox-list">
		
			<!-- 최대 10개정도 -->
			<div></div>
			<div class="row" id="lunchByCategory" style="margin-top: 10px;">
				<c:forEach items="${list}" var="dto" >
				<div class="lunch-list col-md-4 col-lg-4 project col-sm-6 mb-3">
					<div class="lunchbox-list-img">
					
							<a href="<c:url value='/lunchdetail/detail.do?seq=${dto.sellboardseq}&period=${pdto.category==4 ?"T":"F"}'/>">
								<img src="${dto.pic}" height=200px>
							</a>
					</div>
					<div class="listInfo">
							<c:if test="${pdto.category==4}">
								<span style="color:#FF6666;font-weight:bold;" >[ 정기배송 ]</span> <br>
							</c:if>		
							<span style="font-size:18px;">${dto.content}</span>
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
	</div>
	<div class="paging">
	
	<c:if test="${pdto.totalCnt ==null || pdto.totalCnt==0}">
		<div> 게시물이 없습니다. </div>
	</c:if>
	
		<a href="#" style="padding:5px 5px 5px 5px;"><span class="material-symbols-outlined" >navigate_before</span></a>
		
		<c:forEach var="i" begin="${pdto.beginPage}" end="${pdto.endPage}">
			<a class="${i==pdto.page? 'select':''}" href="<c:url value='/list.do?${pdto.getQueryStringByPage(i)}'/>">${i}</a> 
		</c:forEach>
		
        <a href="#" style="padding:5px 5px 5px 5px;"><span class="material-symbols-outlined">navigate_next</span></a>
        
    </div>
	
	
	<div class="right-recent-item" >
			<div class="recent-item-text">&nbsp;&nbsp;&nbsp;최근 본 목록
				<button id="closebtn" type="button" class="btn-close btn-close-white" aria-label="Close" style="float:right;"></button>
			</div>
			<c:forEach items="${relist}" var="rdto">
			<div class="recent-item">
				<a href="${rdto.url}"><img src="${rdto.pic}"></a>
			</div>
			</c:forEach>
	</div>
	<a id="chat-channel-button" href="javascript:chatChannel()">
			<img src="https://developers.kakao.com/tool/resource/static/img/button/channel/consult/consult_small_yellow_pc.png"
				alt="카카오톡 채널 채팅하기 버튼" />
	</a>
	
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js" integrity="sha384-x+WG2i7pOR+oWb6O5GV5f1KN2Ko6N7PTGPS7UlasYWNxZMKQA63Cj/B2lbUmUfuC" crossorigin="anonymous"></script>
<script>
	Kakao.init('7904ca1e31c9655514139df57b15033a'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<script>
function chatChannel() {
	Kakao.Channel.chat({
		channelPublicId: '_xamxcRG',
	});
}

$('#closebtn').click(function(){
	$('.right-recent-item').css('display','none');	
});

	$('.menu_text').click(function(){
		$('.menu_text').removeClass('active');
		$(this).addClass('active');
	});
	
	

</script>
</body>
</html>














