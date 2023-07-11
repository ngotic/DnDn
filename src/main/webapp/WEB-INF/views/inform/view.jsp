<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
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
		
		transition: all 0.2s;
	}

	.notice-btn:hover {
		border: 1.5px solid #F27C2A;
		background-color:#F27C2A;
		color: white;
		width: 50px;
		
		float:right;
		
		padding: 5px;
		margin: 5px;
		margin-top: 20px;
		margin-bottom: 20px;
		
		transform: scale(1.1);
	}
	
	
	.btn-accept {
		margin-right:10px;
		margin-bottom:10px;
		padding: 7px;
		padding-left:10px;
		padding-right:10px;
		border:none;
		border-radius: 15px;
		background-color: #1BC060;
		color: white;
		font-size: 13pt;
		
		
	
	}
	
	.btn-accept-quit {
		margin-left:10px;
		margin-bottom:10px;
		padding: 7px;
		padding-left:10px;
		padding-right:10px;
		border:none;
		border-radius: 15px;
		background-color: gray;
		color: white;
		font-size: 13pt;
		
	
	}
	
/* 	
	.container {
	
		min-height: 1200px;
		
	}
	 */
	/*  
	.mainbar {
		min-height: 1000px;
	}
	  */
	  
	.footer-area {
		transform: translateY(250%);
	}
	  

	 

</style>
</head>
<body>
	<!-- template.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<section class="container">
	<fieldset>
		<div class="side-container">
			<div class="inform-menu-box">
				<h2 class="h2-bold ">고객센터</h2>
				<ul class="inform-menu">
					<li class="active">
						<a href="/dndn/inform/notice.do" class="inform-item active menu-font">공지사항</a>
					</li>
					<li>
						<a href="/dndn/inform/faq.do" class="inform-item menu-font">FAQ</a>
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
			
			<form method="post" action="/dndn/inform/main">
			<div class="notice-box">
				<div class="notice-list notice-title">
					<span>${dto.title }</span>
					<span style="display:inline-block; float:right">${dto.regdate }</span>				
				</div>
				<div class="notice-list notice-writer">
					<span>관리자</span>

					<span style="display:inline-block; float:right">조회수 | ${dto.views }</span>
				</div>
				<div class="notice-list notice-content">
					${dto.content }
				</div>
			</div>
			<div class="notice-btn-side">
				<input type="button" class="btn notice-btn" value="목록" onclick="location.href='/dndn/inform/notice.do';" style="background-color: #2E75B6; border: #2E75B6">
				
			<sec:authorize
         access="hasRole('ROLE_ADMIN') or isAuthenticated() ">
				<button type="button" class="btn notice-btn"
            onclick="location.href='/dndn/inform/notice_edit.do?noticeseq=${dto.noticeseq}&id=${dto.id}';">수정하기</button>
         		<button type="button" class="btn notice-btn"
             data-bs-toggle="modal" data-bs-target="#exampleModalDel">삭제하기</button>
             	
             	<c:if test="${dto.mainnotice =='F'}">
             	<button type="submit" class="btn notice-btn" id="main-notice-btn" style="float:left; background-color: tomato;">메인 지정</button>
             	</c:if>	
             	<c:if test="${dto.mainnotice =='T'}">
             	<button type="submit" class="btn notice-btn" id="main-notice-btn" style="float:left; background-color: tomato;" >메인 취소</button>	
             	</c:if>	
             	
              </sec:authorize> 
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="noticeseq" value="${dto.noticeseq}">
				<input type="hidden" name="mainnotice" value="${dto.mainnotice}">
			</div>
			</form>
			

			
		

<sec:authorize
         access="hasRole('ROLE_ADMIN') or isAuthenticated()">	
<form method="POST" action="/dndn/inform/delok">
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
        <button type="button" class="btn-accept-quit" data-bs-dismiss="modal" onclick="location.href='/dndn/inform/view.do?noticeseq=${dto.noticeseq}';">취소</button>
        <button type="submit" class="btn-accept" onclick="location.href='/dndn/inform/notice.do';">삭제</button>
    
    

    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<input type="hidden" name="id" value='<sec:authentication property="principal.username"/>'>
	<input type="hidden" name="noticeseq" value="${dto.noticeseq }">
      </div>
    </div>
  </div>
  
</div>

</form>		
</sec:authorize>		
		
		
		
		
		</div>
		
	</fieldset>		 
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
	 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 	
<script>


	console.log()

/* 
$('#main-notice-btn').on('click',function() {
	
	
	
    $.ajax({
        type: 'GET',
        url: '/dndn/inform/notice.do',
        data: {
        	
        	
        	
        },
        dataType: 'json',//밑에 추가될 10개 데이터 돌려받
        success: (result)=>{
        	
        	   $(result).each((index,item)=>{

            	
        		   
        		   
        		   
        	   }
        	   
            },
            error: (a,b,c)=>console.log(a,b,c)
         });
        	
        }
 */

</script>
</body>
</html>














