<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="/dndn/resources/css/headerstyle.css">
<link rel="stylesheet" href="/dndn/resources/css/mypage-headerstyle.css">
<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<div id="sidebar">
		<div id="circle" onclick="location.href='/dndn/main.do';" style=" cursor: pointer;">
			<div id="in_circle">
				<img id="dlogo" src="/dndn/resources/img/logo_short.png">
			</div>
		</div>
		<div id="side-content">
			<div>유저명</div>
			<button onclick="location.href='/dndn/mypage/edit.do';">내 정보</button>
			<button onclick="location.href='/dndn/mypage/order.do';">주문조회</button>
			<button onclick="location.href='/dndn/mypage/food.do';">식단관리</button>
			<button onclick="location.href='/dndn/mypage/fav.do';">찜</button>
			<button onclick="location.href='/dndn/mypage/buylist.do';">장바구니</button>
			
			<form method="POST" action="/dndn/auth/logout.do">
			<button>LOGOUT</button>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>	
               <button type="submit" id="memberout">회원탈퇴</button>
	            <input type="hidden" name="id" id="id" value='<sec:authentication property="principal.username"/>'>
	         <script>
	         $('#memberout').click(function(){
	        	 var postData = {'id':$('#id').val(), '${_csrf.parameterName}': '${_csrf.token}' };
	        	
	        	  if( confirm("정말로 탈퇴하시겠습니까?") ){

	        	  } else {
	        	    return false;
	        	  }
	        	  $.ajax({
	        		  	url: '/dndn/delacc',
	        		  	type:'POST',
	        	        data: JSON.stringify(postData),
	        	        dataType : "text",
	        	        contentType: 'application/json',
        	        	beforeSend: function(xhr) {
        	                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}'); // CSRF 토큰 헤더에 추가
        	            },
	        		    success : function(result) {
	        		      new Swal('탈퇴', '탈퇴하였습니다.','success').then(function() {
	        		        location.href='/dndn/main.do';
	        		      });
	        		    } ,
	        		    error : function (a, b, c){
	        		      console.log(a ,b, c)
	        		      if(b == 'error') {
	        		        new Swal('탈퇴 실패','error').then(function() {
	        		        	window.location.reload();
	        		        });
	        		      }
	        		    }
	        		  });
	         });
	         </script>
		</div>
	</div>