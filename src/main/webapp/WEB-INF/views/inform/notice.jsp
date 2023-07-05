<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link rel="stylesheet" href="/dndn/resources/css/notice_ahyun.css">
<style>
/* 
	.container {
		width: 1000px;
	}

	.side-container {
		margin-top: 30px;
	
		float: left;

		width: 200px;
	
	}
	
	.side-container .inform-menu-box {
	
		min-height: 250px;
		padding: 0px 50px 0; 
		padding-left:0px;
	
	}
	
	.side-container .inform-menu-box h2 {
		
		color: #333;
		padding:0 0 50px 0px; 
		border-bottom:1px solid #ececec; 
		font-size:24px; line-height:24px; 
		letter-spacing:-0.02em; 
		font-weight: bolder; 
	
	}
	
	.h2-bold {
		font-size: 24pt;
		font-family: 'Pretendard';
		font-weight: 700;
		color: #333;
	}
	
	
	.side-container .inform-menu-box .inform-menu {
	
		margin:0px 0 0 0;
				
	
	
	}
	
	
	.side-container .inform-menu-box .inform-menu{
	
		padding-left: 0px;
		
	}
	

	.side-container .inform-menu-box .inform-menu  li{
	
		padding:10px;

		list-style-type: none;
		

		width: 150px;
		
		
	}

	.side-container .inform-menu-box .inform-menu  a{
	
		text-decoration: none;
		display:block; 
		font-size:16px;
		color: #555;
		font-weight:bolder; 
		
	}
	
	
	.side-container .inform-menu-box .inform-menu li:hover,
.side-container .inform-menu-box .inform-menu .inform-item:hover{
		font-weight:bolder; 
		background:#f8f8f8; 
		color:#F27C2A;
	}

	
	.side-container .inform-menu-box .inform-menu .active{
		font-weight:bolder; 
		background:#f8f8f8; 
		color:#F27C2A;
	}
	
	
	
	.info-box > * {
		
		color: #333;
		
	}
	
	.info-box:before {
		border-bottom: 1px solid #F27C2A;
	}
	
	
	.mainbar {
	 	float: left;
		
		width: 770px;
		height: 800px;
		
	}
	
	
	.question-section {
		
		border: 1px solid black;
	
	}
	
	.notice {
		font-size: 26pt;
		font-weight: 700;
	}
	
	.notice-header {
		text-align: center;
		margin-top:20px;
	}
	
	.bold {
		font-size: 24pt;
		font-family: 'Pretendard';
		font-weight: 800;
		color: #333;
	}
	
	.search-btn {
		background-color: white;
		border: 1.5px solid #ccc;
		width: 50px;

	}
	
	.search-btn:hover {
		border: 1.5px solid #F27C2A;
		background-color:#F27C2A;
		color: white;
		width: 50px;
	}
	
	.search-bar{
	
		float:right;
		display: flex;
		justify-content: flex-end;
		margin-top: 40px;
		margin-bottom: 30px;
	}
	
	.notice-side {
		
		align-items:center;
		width: 770px;
		justify-content: center;
		font-size: 12pt;
	
	}
	
	.notice-table {

		
		width: 750px;
		text-align: center;
		
		margin-top:20px;
		margin-left: 10px;
	}
	
	.notice-table td, .notice-table th {
		padding: 7px;
	}
	
	.notice-table tr {
		border-bottom: 1px solid #ccc;
	}
	
	.table-head {
		border-top:1.5px solid #aaa;
		border-bottom: 1.5px solid #aaa;
	}
	
	.th-bold {
		font-size: 13pt;
		font-family: 'Pretendard';
		font-weight: 700;
		color: #333;
	}
	
	.notice-title {
		text-align: left;
		padding-left: 10px;
	}
	
	.notice-title a {
		text-decoration: none;
		color: #333;
	}

	.notice-title a:hover {
		text-decoration: none;
		color: #F27C2A;
	}
	
	.menu-font {
		font-size: 13pt;
		font-family: 'Pretendard';
		color: #333;
	}
	
	
	
	


		
.pagination-container {
  margin: 50px auto;
  text-align: center;
}
.pagination {
  position: relative;
}
.pagination a {
  position: relative;
  display: inline-block;
  color: #2c3e50;
  text-decoration: none;
  font-size: 1rem;
  padding: 8px 16px 10px;
}
.pagination a:before {
  z-index: -1;
  position: absolute;
  height: 100%;
  width: 100%;
  content: "";
  top: 0;
  left: 0;
  background-color: #F27C2A;
  border-radius: 24px;
  transform: scale(0);
  transition: all 0.2s;
}
.pagination a:hover,
.pagination a .pagination-active {
  color: #fff;
}
.pagination a:hover:before,
.pagination a .pagination-active:before {
  transform: scale(1);
}
.pagination .pagination-active {
  color: #fff;
}
.pagination .pagination-active:before {
  transform: scale(1);
}
.pagination-newer {
  margin-right: 50px;
}
.pagination-older {
  margin-left: 50px;
}

.page-side {
	display:flex;
	justify-content: center;
	align-items:center;
}

	
 */
 	
 	
 	.notice-under {

 	}
 	
 
 	.add-side {
 		float:left;
 		margin-top: 40px;
    	margin-bottom: 30px;
    	margin-left: 10px;
 	}
 	
 	.add-btn {
 		font-size: 12px;
 		background-color: #F27C2A;
 		color: white;
 		
 		transition: all 0.1s linear;
 	}
 	
 	.add-btn:hover {
 	
 	 	font-size: 12px;
 		background-color: #F27C2A;
 		color: white;
 		
 		transform: scale(1.1);
 		
 	}
 	


</style>
</head>
<body>
	<!-- template.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<section class="container">
		
		<%@ include file="/WEB-INF/views/inform/inform_sidebar.jsp" %>
		
		<!-- <div class="side-container">
			<div class="inform-menu-box">
				<h2 class="h2-bold ">고객센터</h2>
				<ul class="inform-menu">
					<li class="active">
						<a href="/dndn/inform/notice.do" class="inform-item active menu-font">공지사항</a>
					</li>
					<li>
						<a href="/dndn/inform/suggest.do" class="inform-item menu-font">1:1 문의</a>
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
		</div> -->
		
		<div class="mainbar">
			
			<div class="notice-header">
				<span class="bold">공지사항</span>
			</div>
			
			<div class="notice-under">
				<div class="add-side">
					<input type="button" class="btn add-btn" value="글쓰기" onclick="location.href='/dndn/inform/notice_add.do';">
				</div>
				
				<div class="search-bar">
					<select class="form-select form-select-sm" aria-label=".form-select-sm example" style="width: 100px;">
					  <option selected>선택</option>
					  <option value="1">제목</option>
					  <option value="2">내용</option>
					  <option value="3">작성자</option>
					</select>
					<input class="form-control form-control-sm" type="text" placeholder="검색어를 입력" style="width:200px;margin-left:10px;">
					<input class="search-btn btn btn-sm" type="submit" value="검색" style="margin-left:10px;">
				</div>
			</div>
			
			
			<div class="notice-side">
				<table class="notice-table">
					<tr class="table-head">
						<th class="th-bold">번호</th>
						<th class="th-bold">제목</th>
						<th class="th-bold">날짜</th>
						<th class="th-bold">작성자</th>
						<th class="th-bold">조회수</th>
					</tr>
					
					
					<c:forEach items="${noticelist}" var="dto">
					<tr>
						<td>${dto.noticeseq}</td>
						<td class="notice-title"><a href="/dndn/inform/view.do?noticeseq=${dto.noticeseq }">${dto.title} </a></td>
						<td>${dto.regdate} </td>
						<td>${dto.id} </td>
						<td>${dto.views }</td>
					</tr>
					</c:forEach>
					
					
					
					<!-- 
					<tr>
						<td>1</td>
						<td class="notice-title"><a href="/dndn/inform/view.do">포켓샐러드 새벽 배송 </a></td>
						<td>2021.12.27</td>
						<td>관리자</td>
						<td>200</td>
					</tr>
					<tr>
						<td>1</td>
						<td class="notice-title">포켓샐러드 새벽 배송 안내</td>
						<td>2021.12.27</td>
						<td>관리자</td>
						<td>200</td>
					</tr>
					<tr>
						<td>1</td>
						<td class="notice-title">포켓샐러드 새벽 배송 안내</td>
						<td>2021.12.27</td>
						<td>관리자</td>
						<td>200</td>
					</tr>
					<tr>
						<td>1</td>
						<td class="notice-title">포켓샐러드 새벽 배송 안내</td>
						<td>2021.12.27</td>
						<td>관리자</td>
						<td>200</td>
					</tr>
					<tr>
						<td>1</td>
						<td class="notice-title">포켓샐러드 새벽 배송 안내</td>
						<td>2021.12.27</td>
						<td>관리자</td>
						<td>200</td>
					</tr>
					<tr>
						<td>1</td>
						<td class="notice-title">포켓샐러드 새벽 배송 안내</td>
						<td>2021.12.27</td>
						<td>관리자</td>
						<td>200</td>
					</tr>
					<tr>
						<td>1</td>
						<td class="notice-title">포켓샐러드 새벽 배송 안내</td>
						<td>2021.12.27</td>
						<td>관리자</td>
						<td>200</td>
					</tr>
					<tr>
						<td>1</td>
						<td class="notice-title">포켓샐러드 새벽 배송 안내</td>
						<td>2021.12.27</td>
						<td>관리자</td>
						<td>200</td>
					</tr>
					<tr>
						<td>1</td>
						<td class="notice-title">포켓샐러드 새벽 배송 안내</td>
						<td>2021.12.27</td>
						<td>관리자</td>
						<td>200</td>
					</tr>
					<tr>
						<td>1</td>
						<td>포켓샐러드 새벽 배송 안내</td>
						<td>2021.12.27</td>
						<td>관리자</td>
						<td>200</td>
					</tr>
					<tr>
						<td>1</td>
						<td>포켓샐러드 새벽 배송 안내</td>
						<td>2021.12.27</td>
						<td>관리자</td>
						<td>200</td>
					</tr>
					<tr>
						<td>1</td>
						<td>포켓샐러드 새벽 배송 안내</td>
						<td>2021.12.27</td>
						<td>관리자</td>
						<td>200</td>
					</tr>
				 -->
				</table>
			</div>	
			
		
		<div class="page-side">
			<nav class="pagination-container">
				<div class="pagination">
						<a class="pagination-newer" href="#">PREV</a>
						<span class="pagination-inner">
							<a href="#">1</a>
							<a class="pagination-active" href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
							<a href="#">6</a>
						</span>
						<a class="pagination-older" href="#">NEXT</a>
				</div>
			</nav>
		</div>
			
			
			
			
			
			
		</div>	<!-- mainbar -->
		
		
	</section>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 	
<script>

$('.pagination-inner a').on('click', function() {
	$(this).siblings().removeClass('pagination-active');
	$(this).addClass('pagination-active');
})


</script>
</body>
</html>














