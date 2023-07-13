<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta name="_csrf" content="${_csrf.token}">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp"%>
<link rel="stylesheet" href="/dndn/resources/css/notice_ahyun.css">
<style>
.board-pagination {
	margin-top: 20px;
	text-align: center;
}

.board-pagination .pagination-table {
	display: inline-block;
	margin-top: 5px;
}

.board-pagination .pagination-table td {
	padding: 5px 10px;
	background-color: #f5f5f5;
	color: #333;
	cursor: pointer;
	transition: background-color 0.2s ease-in-out;
	font-size: 16px;
	border-radius: 3px;
}

.board-pagination .pagination-table td.active {
	background-color: #333;
	color: #fff;
}

.add-side {
	float: left;
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

.pagination-container {
	margin: 50px auto;
	text-align: center;
}

.pagination {
	position: relative;
}

.pagination td {
	position: relative;
	display: inline-block;
	color: #2c3e50;
	text-decoration: none;
	font-size: 1rem;
	padding: 8px 16px 10px;
}

.pagination td:before {
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
/* 
.pagination tr:nth-child(n):hover, {
.pagination tr:nth-child(n) .pagination-active {
  color: #fff;
}
 */
.pagination td:hover, .pagination td .pagination-active {
	color: #fff;
}

.pagination td:hover:before, .pagination td .pagination-active:before {
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
	display: flex;
	justify-content: center;
	align-items: center;
}

a {
	text-decoration: none;
	color: #333;
}

.main-list {
	background-color: #eee;
}

.main-list notice-title {
	color: tomato;
}

.notice-under {
	
}

.row {
	
}

.add-side {
	/* 		float:right; */
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

.suggest-table {
	width: 800px;
	font-size: 11pt;
	text-align: center;
	margin-left: -10px;
}

.suggest-table td, .suggest-table tr, .suggest-table th {
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
	margin: 5px;
	
	margin-top : 10px;
	margin-bottom: 10px;
	
}

.suggest-title a {
	padding: 5px;
	text-decoration: none;
	color: #777;
}

.row {
	font-family: 'Pretendard';
	font-weight: 500;
	margin-top: 20px;
	margin-bottom: 40px;
	text-align: center;
	align-items: center;
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

.search-bar {
	margin-top: 0px;
	margin-bottom: 0px;
}

.faq-tr {
	background-color: #F8F8F8;
}

.faq-question {
	float: left;
	padding-left: 20px;
	margin-top: 20px;
}

.faq-answer {
	clear: both;
}

.faq-answer {
	padding: 10px;
	dislplay: flex;
	justify-content: space-between;
}


.suggest-title span,
.faq-question span {
	color: #F27C2A;
}

.item-category {
	padding: 5px;
	border-radius: 20px;
}

#suggest-table-tbody tr {
	border-top: 1px solid #cecece;
	border-bottom: 1px solid #cecece;
}

.icon_qan {
	float:left;
}

.icon {
	float:left;
	min-height: 100px;
	width: auto;
	margin-left: 10px;	
}

.icon-content {
	margin-left: 10px;	
}

.faq-td {
	margin-top : 20px;
}

	.footer-area {
		transform: translateY(250%);
	}


</style>
</head>
<body>
	<!-- template.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<section class="container">
		<fieldset>
		<div class="side-container">
			<div class="inform-menu-box">
				<h2 class="h2-bold ">고객센터</h2>
				<ul class="inform-menu">
					<li >
						<a href="/dndn/inform/notice.do" class="inform-item  menu-font">공지사항</a>
					</li>
					<li class="active">
						<a href="/dndn/inform/faq.do" class="inform-item active menu-font">FAQ</a>
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
			<div class="notice-header">
				<span class="bold">1:1문의</span>
			</div>

			<div class="notice-under">
				<div style="display: flex; justify-content: space-between">
					<div class="add-side">
						<input type="button" class="btn add-btn" value="글쓰기"
							onclick="location.href='/dndn/inform/notice_add.do';">
					</div>

					<div class="board-search search-bar" style="height: 30px;margin-top: 40px;">
						<input type="text" id="search-input"
							class="form-control form-control-sm" placeholder="검색어를 입력하세요">
						<button id="search-button" class="search-btn btn btn-sm"
							style="margin-left: 10px;">검색</button>
					</div>
				</div>


				<form method="post" action="/dndn/inform/category">
					<div class="row">
						<div class="col-md-3 suggest-tab">상품</div>
						<div class="col-md-3 suggest-tab">배송</div>
						<div class="col-md-3 suggest-tab">취소</div>
						<div class="col-md-3 suggest-tab">기타</div>
					</div>
					<input type="hidden" name="category">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</form>

			</div>



			<div class="notice-side">

				<table class="suggest-table" id="suggest-table">
					<colgroup>
						<col width="15%">
						<col width="15%">
						<col width="70%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">분류</th>
							<th scope="col">내용</th>
						</tr>
					</thead>
					<tbody id="suggest-table-tbody">

						<c:forEach items="${faqlist }" var="dto">
							<tr>
								<td>${dto.faqseq }</td>
								
								<c:if test="${dto.category == '상품' }">
									<td><span class="item-category" style="background-color: #F27C2A; color:white;">${dto.category }</span></td>
								</c:if>
								
								<c:if test="${dto.category == '배송' }">
									<td><span class="item-category" style="background-color: tomato; color:white;">${dto.category }</span></td>
								</c:if>
								
								<c:if test="${dto.category == '취소' }">
									<td><span class="item-category" style="background-color: #00AF85; color:white;">${dto.category }</span></td>
								</c:if>
								
								<c:if test="${dto.category == '기타' }">
									<td><span class="item-category" style="background-color: cornflowerblue; color:white;">${dto.category }</span></td>
								</c:if>
								

								
								
								<td class="suggest-title" style="padding-left: 10px;"><span >Q.</span>  <span style="padding-left: 10px; color: #333;">${dto.title }</span></td>
							</tr>
							<tr class="faq-tr" style="display: none;">
								<td colspan="3" class="faq-td">
									<div class="faq-question">
										<span>Q.</span> <span>${dto.title }</span>
									</div>
									<div class="faq-answer">
										<div class="icon">
											<span class="icon_qan a" style="width: 5%; color:#F27C2A;">A.</span>
										</div>
										<div class="icon icon-content" style="width: 95%; text-align:left;">
											${dto.content }
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
				
				<div style="height: 200px;">
				
				</div>

			</div>

		</div>
		<!-- mainbar -->
	</fieldset>
	</section>
	<%-- <%@ include file="/WEB-INF/views/include/footer.jsp" %> --%>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
		var header = $("meta[name='_csrf_header']").attr('content');
	   var token = $("meta[name='_csrf']").attr('content');
	   
function tablist(category){
	
	
		
		$.ajax({
			type:'POST',
			url:'/dndn/inform/faq.do?category='+category,
			dataType:'json',
			beforeSend: function(xhr){
                 xhr.setRequestHeader(header, token);
             },
			success : (result) => {
			
				
				$('#suggest-table-tbody').html('');
				$(result).each((index, item)=>{
							let text='';	
							
							text+=`<tr>
								<td>\${item.faqseq }</td>`;
								
							if (item.category == '상품') {
								text += `<td><span class="item-category" style="background-color: #F27C2A; color:white;">\${item.category }</span></td>`;
							} else if (item.category == '배송') {
								text += `<td><span class="item-category" style="background-color: tomato; color:white;">\${item.category }</span></td>`;
							} else if (item.category == '취소') {
								text += `<td><span class="item-category" style="background-color: #00AF85; color:white;">\${item.category }</span></td>`;
							} else if (item.category == '기타') {
								text += `<td><span class="item-category" style="background-color: cornflowerblue; color:white;">\${item.category }</span></td>`;
							}
							
							
							
							text+=`<td class="suggest-title" style="padding-left: 10px;"><span >Q.</span>  <span style="padding-left: 10px; color: #333;">\${item.title }</span></td>
							</tr>
							<tr class="faq-tr" style="display: none;">
								<td colspan="3" class="faq-td">
									<div class="faq-question">
										<span>Q.</span> <span style="margin-left: 10px;">\${item.title }</span>
									</div>
									<div class="faq-answer">
										<div class="icon">
											<span class="icon_qan a" style="width: 5%; color:#F27C2A;">A.</span>
										</div>
										<div class="icon icon-content" style="width: 95%; text-align:left;">
											\${item.content }
										</div>
									</div>
								</td>
							</tr>`;
							
							$('#suggest-table-tbody').append(text);	
							
							
				}); //result.each
				
				$('.suggest-title').on('click', function() {
					
					$('.suggest-title').removeClass('active');
					$(this).addClass('active');
					
					var faqTr = $(this).closest('tr').next('.faq-tr');

					if (faqTr.css("display") == "none") {
						faqTr.slideDown('slow');
					} else {
						faqTr.slideUp('slow');
					}

				});
				
				
            }, 
            
            error: (a,b,c) => console.log(a,b,c)
            	
		});
}
	



$('.suggest-title').on('click', function() {
	
	$('.suggest-title').removeClass('active');
	$(this).addClass('active');
	
	var faqTr = $(this).closest('tr').next('.faq-tr');

	if (faqTr.css("display") == "none") {
		faqTr.slideDown('slow');
	} else {
		faqTr.slideUp('slow');
	}

});

$('.suggest-tab').on('click', function() {
	

	tablist($(this).text().trim());

});
	
</script>




