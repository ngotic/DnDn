<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="/dndn/resources/css/headerstyle.css">

<style>
	.navbar-menu .nav-item:hover{
        background-color: #eee;
    }

	.dropdown-menu.show {
    	width:95%;
		border-radius: 0px;
	}
	#navbar {
		display: flex;
		justify-content: space-between;
	}
	a .icon-color:hover {
        color : #FF5B5B;
    }
    .icon-color {
        color : #FF5B5B;
    }
	
	.btn-close{
		font-size:12px;
	}
	span.material-symbols-outlined {
	    margin-top: 1px;
	    color: tomato;
	}
	
	.main_logo {
		display:flex; 
		justify-content: center;
		align-items : center;
	}
</style>
<body>
<header class="header-area navbar-fade" id="header">

		<nav id="navbar">
			
			<div id="brand-logo" style="margin-right:20px;">
				<a class="navbar-brand" id="navbarBrand" href="/dndn/main.do">
					<img src="/dndn/resources/img/logo_edit.png" class="mt-1 mb-2" style="width:40px;">			
				</a>
			</div>
			<div class="navbar-menu">
				<div class="nav-item"><a href = "/dndn/list.do?page=1&category=0&sort=1" class="nav-link" >메뉴소개</a></div>
				<div class="nav-item"><a href = "/dndn/storemap/storehome.do" class="nav-link" >매장찾기</a></div>
				<div class="nav-item"><a href = "/dndn/order/event.do" class="nav-link" >이벤트</a></div>
			</div>
			<a class="navbar-toggler" id="toggleBtn"><i class="fa fa-bars"></i></a>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="navbar-menu" id="menu"  style="padding-left: 300px;">
			</sec:authorize>
			<sec:authorize access="!hasRole('ROLE_ADMIN')">
			<div class="navbar-menu" id="menu" style="padding-left: 220px;">
			</sec:authorize>
				<div class="nav-item"><a href = "/dndn/inform/notice.do" class="nav-link" >고객지원</a></div>
				<sec:authorize access="isAnonymous()">
				<div class="nav-item"><a href = "/dndn/auth/register.do" class="nav-link" >회원가입</a></div>
				</sec:authorize>
				 <sec:authorize access="hasRole('ROLE_MEMBER')">
				<div class="nav-item"><a href = "/dndn/userorder/usercart.do?right=false" class="nav-link" >장바구니</a></div>
				 </sec:authorize>
				<sec:authorize access="isAnonymous()">
				<div class="nav-item"><a href = "/dndn/auth/login.do" class="nav-link" >로그인</a></div>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
				<div class="nav-item dropdown">
                    <span class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="true">
            			<sec:authentication property="principal.username"/>
                    </span>
                    <sec:authorize access="hasRole('ROLE_MEMBER')">
                    <ul class="dropdown-menu">
                    <form method="POST" action="/dndn/auth/logout.do">
                    	<li><div class="nav-item"><button class="nav-link" style="margin-left:20px;">로그아웃</button></div></li>
                    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>	
						<li><div class="nav-item"><button class="nav-link" style="margin-left:20px;" onclick="location.href='/dndn/mypage/fav.do';">찜목록</button></div></li>
						<li><div class="nav-item"><a href = "/dndn/mypage/edit.do" class="nav-link" style="margin-left:20px;">마이페이지</a></div></li>
                    </ul>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <ul class="dropdown-menu">
                    <form method="POST" action="/dndn/auth/logout.do">
                    	<li><div class="nav-item"><button class="nav-link" style="margin-left:20px;">로그아웃</button></div></li>
                    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>	
					 <form method="POST" action="/dndn/order/user.do">
						<li><div class="nav-item"><input type="submit" class="nav-link" style="margin-left:20px;" value= "관리자페이지"></div></li>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    	</form>
                    </ul>
                     </sec:authorize>
                </div>
                </sec:authorize>
			</div>
		</nav>
</header>
<div class="main_logo">
	<img src="/dndn/resources/img/logo_long.png" class="mt-3 mb-4" style="height:130px;">
</div>
<hr class="mb-0" style="color:#A8A8A8;">





    