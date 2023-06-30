<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link rel="stylesheet" href="/dndn/resources/css/notice_ahyun.css">
<style>
	.notice-box {
		font-size: 13pt;
		border-bottom: 1px solid black;
		border-top: 1px solid black;
	
	}
	
	.notice-list {
		margin-top: 10px;	
		border-bottom: 1px solid #ccc;
		padding: 10px;
	
	}
	
	.notice-btn {
		border: 1.5px solid #F27C2A;
		background-color:#F27C2A;
		color: white;
		width: 50px;
		
		float:right;
		
		padding: 5px;
		margin: 5px;
		margin-top: 20px;
		margin-bottom: 20px;
		
	}
	

</style>
</head>
<body>
	<!-- template.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<section class="container">
				<div class="side-container">
			<div class="inform-menu-box">
				<h2 class="h2-bold ">고객센터</h2>
				<ul class="inform-menu">
					<li class="active">
						<a href="/dndn/inform/notice.do" class="inform-item active menu-font">공지사항</a>
					</li>
					<li>
						<a href="#" class="inform-item menu-font">1:1 문의</a>
					</li>
					<li>
						<a href="#" class="inform-item menu-font">FAQ</a>
					</li>
				</ul>
			</div>
			<div class="info-box">
				<dl>
					<dt>고객상담센터</dt>
					<dd>
						<strong class="info-num">02-3482-4632</strong>
						<br>
						<p>
							평일 : 오전 9시 ~ 오후 6시
							<br>
							점심 : 오후 1시 ~ 오후 2시
							<br>
							휴무 : 주말, 공휴일
						</p>
					</dd>
				</dl>
			</div>
		</div>
		
		<div class="mainbar">
			<h2 class="th-bold" style="font-size: 20pt; color:#F27C2A; margin-bottom:20px; margin-top:20px;">공지사항</h2>
			<div class="notice-box">
				<div class="notice-list notice-title">
					<span>간식류 단종 안내</span>
				</div>
				<div class="notice-list notice-writer">
					<span>관리자</span>
					<span>2023.04.28</span>
					<span style="display:inline-block; float:right">조회수 | 366</span>
				</div>
				<div class="notice-list notice-content">
					<p>
					안녕하세요. 포켓샐러드입니다.
					
					그동안 많은 사랑을 주셨던 간식 상품이 판매 종료되었습니다.(요거트 제외)
					
					 
					
					정기배송에서 해당 상품을 선택해 주신 고객님께는 일정대로 배송 될 예정입니다.
					
					많은 성원에 감사드리며, 다양한 신제품으로 찾아뵐 수 있도록 하겠습니다.
					
					 
					
					감사합니다.
					
					포켓샐러드 드림
					
					</p>
				</div>
			</div>
			<div class="notice-btn-side">
				<input type="button" class="btn notice-btn" value="목록" onclick="location.href='/dndn/inform/notice.do';">
			</div>
		
		
		</div>
	</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 	
<script>
</script>
</body>
</html>














