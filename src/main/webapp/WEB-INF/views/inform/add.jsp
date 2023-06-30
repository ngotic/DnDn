<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link rel="stylesheet" href="/dndn/resources/css/notice_ahyun.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"> 

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
	
	.add-side {
/* 		border: 2px #ccc solid;
		min-height: 300px;
		
		border-radius: 20px;
		box-shadow: #eee 0px 5px 5px 5px; */
		
	
	}
	
	.underline{
		
		width: 150px;
		border-bottom: 2px solid #eee;
		
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
			<h2 class="th-bold" style="font-size: 18pt; color:#333; margin-bottom:20px; margin-top:20px;">글쓰기</h2>
			<div class="underline"></div>
			<div class="add-side">
				
				<label>제목</label>
				<form method="post">
				  <textarea id="summernote" name="editordata"></textarea>
				</form>
				
			
			
			
			</div>
			
		
		</div>
	</section>
	



	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 


<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"
></script>	
<script>

$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		
		width:600,
		minHeight: 300,
		lang: "ko-KR"
		
		
			/* 		
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
           */
	});
});




</script>
</body>
</html>














