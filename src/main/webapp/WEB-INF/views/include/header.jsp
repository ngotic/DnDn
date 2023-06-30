<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <div class="nav-item"><a href = "#" class="nav-link" >메뉴소개</a></div>
            <div class="nav-item"><a href = "#" class="nav-link" >매장찾기</a></div>
            <div class="nav-item"><a href = "#" class="nav-link" >이벤트</a></div>
         </div>
         <a class="navbar-toggler" id="toggleBtn"><i class="fa fa-bars"></i></a>
         
         <div class="navbar-menu" id="menu">
            <div class="nav-item"><a href = "#" class="nav-link" >고객지원</a></div> 
            <div class="nav-item"><a href = "#" class="nav-link" >회원가입</a></div>
            <div class="nav-item"><a href = "#" class="nav-link" >장바구니</a></div> 
            <!-- <div class="nav-item"><a href = "#" class="nav-link" >로그인</a></div> -->
            <div class="nav-item dropdown">
                    <a href = "" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="true">
                     로그인
                    </a>
                    <ul class="dropdown-menu">
                       <li><div class="nav-item"><a href = "#" class="nav-link" style="margin-left:20px;">로그아웃</a></div></li>
                  <li><div class="nav-item"><a href = "#" class="nav-link" style="margin-left:20px;">마이페이지</a></div></li>
                    </ul>
                </div>
         </div>
      </nav>
</header>
<div class="main_logo">
   <img src="/dndn/resources/img/logo_long.png" class="mt-1 mb-2" style="height:110px;">
</div>
<hr class="mb-0">





    