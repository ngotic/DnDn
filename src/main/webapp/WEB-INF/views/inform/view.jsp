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
					<span>${dto.title }</span>
				</div>
				<div class="notice-list notice-writer">
					<span>관리자</span>
					<span>${dto.regdate }</span>
					<span style="display:inline-block; float:right">조회수 | ${dto.views }</span>
				</div>
				<div class="notice-list notice-content">
					${dto.content }
				</div>
			</div>
			<div class="notice-btn-side">
				<input type="button" class="btn notice-btn" value="목록" onclick="location.href='/dndn/inform/notice.do';">
				
				<button type="button" class="btn notice-btn"
            onclick="location.href='/dndn/inform/notice_edit.do?noticeseq=${dto.noticeseq}&id=${dto.id}';">수정하기</button>
         		<button type="button" class="btn notice-btn"
            onclick="location.href=/dndn/inform/view.do?noticeseq=${dto.noticeseq}&id=${dto.id}';" data-bs-toggle="modal" data-bs-target="#exampleModalDel">삭제하기</button>
				
				
			</div>
		
		
		<div class="modal fade" id="exampleModalDel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" style="border:none;">
      <div class="modal-header" style="border:none;">
        <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="border:none; height: 300px; display:flex; justify-content:center; align-items:center; font-size: 20px;">
        삭제하시겠습니까?
      </div>
      <div class="modal-footer" style="border:none; display:flex; justify-content: space-between;">
        <button type="button" class="btn-accept-quit" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn-accept" onclick="">삭제</button>
      </div>
    </div>
  </div>
</div>
		
		
		
		
		
		
		</div>
	</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 	
<script>
</script>
</body>
</html>














