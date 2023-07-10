<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link rel="stylesheet" href="/dndn/resources/css/notice_ahyun.css">
<style>

 	
 	
 	.notice-under {

 	}
 	
 
 	.add-side {
 		float:right;
 		margin-top: 50px;
    	margin-bottom: 50px;
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
 	
 	.notice-side {
 		
 	
 	}
 	
 	
 	.suggest-table {
 		
 		width: 760px;
 		
 		font-size: 11pt;
 		text-align: center;
 		
 	}
 	
 	.suggest-table td, .suggest-table tr, .suggest-table th{
 		
 		padding: 5px;
 		padding-top: 10px;
 		padding-bottom: 10px;
 	
 	}
 	

 	
 	.suggest-table thead {
 		
 		border-top: 1px solid gray;
 		border-bottom: 1px solid gray;
 	
 	}
 	
 	.suggest-title {
 		
 		text-align: left;
 		
 	}

 	.suggest-title a {
 		
 		padding: 5px;
 		text-decoration: none;
 		color: #777;
 		
 	}
 	
 	.row {
 		font-family: 'Pretendard';
		font-weight: 500;
 	
 	
 		margin-top: 40px;
 		text-align: center;
 		align-items:center;
 		color: #333;
 		font-size: 13pt;
 		border-top: 1px solid #333;
 		border-bottom: 1px solid #333;

 		
 	}
 	
 	
 	.suggest-tab {
 	 	padding-top: 10px;
 		padding-bottom: 10px;
 		
 	
 	}
 	
 	
 	.th-bold {
		font-size: 13pt;
		font-family: 'Pretendard';
		font-weight: 700;
		color: #333;
	}
 	
 	
 	
 	.suggest-tab:hover {
 		
 		background-color: #F8F8F8;
 		color: #F27C2A;
 		cursor: pointer;
 		
 	
 	}
 	


</style>
</head>
<body>
	<!-- template.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<section class="container">
		
		<%@ include file="/WEB-INF/views/inform/inform_sidebar.jsp" %>
		
		<div class="mainbar">
			
			<div class="notice-header">
				<span class="bold">1:1문의</span>
			</div>
			
			<div class="row">
				<div class="col-md-3 suggest-tab">상품</div>
				<div class="col-md-3 suggest-tab">배송</div>
				<div class="col-md-3 suggest-tab">취소</div>
				<div class="col-md-3 suggest-tab">기타</div>
			</div>
			
			
			<div class="notice-under">

				
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
				<table class="suggest-table">
					<colgroup>
	                    <col width="7%">
	                    <col width="8%">
	                    <col width="10%">
	                    <col width="auto">
	                    <col width="12%">
	                    <col width="13%">
	                </colgroup>
					<thead>
		                <tr>
		                    <th scope="col">번호</th>
		                    <th scope="col">답변여부</th>
		                    <th scope="col">구분</th>
		                    <th scope="col">내용</th>
		                    <th scope="col">작성자</th>
		                    <th scope="col">등록일자</th>
		                </tr>
	                </thead>
					<tbody>
						<tr>
							<td>200</td>
							<td>
								<strong>
									답변완료
								</strong>
							</td>
							<td>배송</td>
							<td class="suggest-title">
								<a href="">언제 보내주나요</a>
							</td>
							<td>
								yes123
							</td>
							<td>
								<strong>2023-06-30</strong>
							</td>
						</tr>
						<tr>
							<td>200</td>
							<td>
								<strong>
									답변완료
								</strong>
							</td>
							<td>배송</td>
							<td class="suggest-title">
								<a href="">언제 보내주나요</a>
							</td>
							<td>
								yes123
							</td>
							<td>
								<strong>2023-06-30</strong>
							</td>
						</tr>
						<tr>
							<td>200</td>
							<td>
								<strong>
									답변완료
								</strong>
							</td>
							<td>배송</td>
							<td class="suggest-title">
								<a href="">언제 보내주나요</a>
							</td>
							<td>
								yes123
							</td>
							<td>
								<strong>2023-06-30</strong>
							</td>
						</tr>
						<tr>
							<td>200</td>
							<td>
								<strong>
									답변완료
								</strong>
							</td>
							<td>배송</td>
							<td class="suggest-title">
								<a href="">언제 보내주나요</a>
							</td>
							<td>
								yes123
							</td>
							<td>
								<strong>2023-06-30</strong>
							</td>
						</tr>
						<tr>
							<td>200</td>
							<td>
								<strong>
									답변완료
								</strong>
							</td>
							<td>배송</td>
							<td class="suggest-title">
								<a href="">언제 보내주나요</a>
							</td>
							<td>
								yes123
							</td>
							<td>
								<strong>2023-06-30</strong>
							</td>
						</tr>
						<tr>
							<td>200</td>
							<td>
								<strong>
									답변완료
								</strong>
							</td>
							<td>배송</td>
							<td class="suggest-title">
								<a href="">언제 보내주나요</a>
							</td>
							<td>
								yes123
							</td>
							<td>
								<strong>2023-06-30</strong>
							</td>
						</tr>
						<tr>
							<td>200</td>
							<td>
								<strong>
									답변완료
								</strong>
							</td>
							<td>배송</td>
							<td class="suggest-title">
								<a href="">언제 보내주나요</a>
							</td>
							<td>
								yes123
							</td>
							<td>
								<strong>2023-06-30</strong>
							</td>
						</tr>
						<tr>
							<td>200</td>
							<td>
								<strong>
									답변완료
								</strong>
							</td>
							<td>배송</td>
							<td class="suggest-title">
								<a href="">언제 보내주나요</a>
							</td>
							<td>
								yes123
							</td>
							<td>
								<strong>2023-06-30</strong>
							</td>
						</tr>
						<tr>
							<td>200</td>
							<td>
								<strong>
									답변완료
								</strong>
							</td>
							<td>배송</td>
							<td class="suggest-title">
								<a href="">언제 보내주나요</a>
							</td>
							<td>
								yes123
							</td>
							<td>
								<strong>2023-06-30</strong>
							</td>
						</tr>
						<tr>
							<td>200</td>
							<td>
								<strong>
									답변완료
								</strong>
							</td>
							<td>배송</td>
							<td class="suggest-title">
								<a href="">언제 보내주나요</a>
							</td>
							<td>
								yes123
							</td>
							<td>
								<strong>2023-06-30</strong>
							</td>
						</tr>
					</tbody>
				</table>
				
			<div class="add-side">
				<input type="button" class="btn add-btn" value="글쓰기" onclick="location.href='/dndn/inform/add.do';">
			</div>
				
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














