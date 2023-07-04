<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<style>
section {

	min-height: 100vh;
 	/* height: auto; */
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
		<h1>시작 페이지<small>없음</small></h1>
		<sec:authorize access="isAuthenticated()">
			<div title="사용자 아이디">
		<sec:authentication property="principal.username"/>
		</div>
		<div class="message" title="principal">
			<sec:authentication property="principal"/>
		</div>
		<div class="message" title="MemberDTO">
			<sec:authentication property="principal.member"/>
	 	</div>
		<div class="message" title="사용자 아이디">
			<sec:authentication property="principal.member.id"/>
		</div>
		<div class="message" title="사용자 아이디">
			<sec:authentication property="principal.username"/>
		</div>
		<div class="message" title="사용자 이름">
			<sec:authentication property="principal.member.name"/>
		</div>
				 
		<div class="message" title="사용자 권한">
			<sec:authentication property="principal.member.authlist"/>
		</div>
			<form method="POST" action="/dndn/delacc">
				<div>
					<button type="submit"  class="btn btn-outline-warning">회원탈퇴</button>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="id" value='<sec:authentication property="principal.username"/>'>
			</form>
			
			
		</sec:authorize>
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 	
<script>
</script>
</body>
</html>



