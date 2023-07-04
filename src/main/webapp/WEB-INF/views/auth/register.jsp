<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- datepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style>
	*{
	font-weight:bold;
}
	#pwd2{
		margin-bottom:15px;
	}
	#sample4_postcode{
		width:10%;
		display:inline;
		margin-top:15px;
	}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>	
	<sec:authorize access="isAnonymous()">
    <div class="container mt-3">
		<h3><strong>회원가입</strong></h3>
		<form action="/dndn/auth/registerok.do" method="post" id="signupForm" >
			
			
			<div>
			    <label class="control-label" for="name">이름</label>
			    <input class="form-control ${not empty dto.name ? 'is-valid' : ''}" type="text" name="name" id="name" maxlength="4" value="${dto.name}" required<%-- 읽기 전용 --%> ${ not empty dto.name ? 'readonly' : '' }/>
			    <div class="valid-feedback"></div>
			    <div class="invalid-feedback">숫자, 특수문자, 공백이 포함될 수 없습니다.</div>
			</div>
			
			<div>
				<label class="control-label" for="id">아이디</label>
				<input class="form-control" type="text" name="id" id="id" onchange="characterCheck(this);" required/>
				<div class="valid-feedback">사용 가능한 아이디 입니다.</div>
				<div class="invalid-feedback">사용 불가능한 아이디입니다.</div>
			</div>
			<div>
				<label class="control-label" for="pw">비밀번호</label>
				<input class="form-control" type="password" name="pw" id="pw" required/>
				<div class="valid-feedback">사용 가능합니다</div>
				<div class="invalid-feedback">비밀번호를 확인해주세요</div>
			</div>
			<div>
				<label for="pwd2" class="control-label">비밀번호 확인</label>
				<input type="password" class="form-control" name="pwd2" id="pwd2" onkeyup="pwcheck();" required/>
				<div class="invalid-feedback">입력하신 비밀번호가 다릅니다.</div>
			</div>
			
			<div>
				<label class="control-label" for="Gender">성별</label>
				<div class="btn-group" data-toggle="buttons" class="form-control ${not empty dto.gender ? 'is-valid' : ''}">
					<c:if test="${dto.gender=='male'}">
						<label class="btn btn-light">
							<input type="radio" name="Gender" autocomplete="off" value="M" checked >남자
						</label>
						
						<label class="btn btn-light">
							<input type="radio" name="Gender" autocomplete="off" value="F" disabled>여자
						</label>
					</c:if>
					<c:if test="${dto.gender!='male'}">
						<label class="btn btn-light">
							<input type="radio" name="Gender" autocomplete="off" value="M" disabled>남자
						</label>
						
						<label class="btn btn-light">
							<input type="radio" name="Gender" autocomplete="off" value="F" checked >여자
						</label>
					</c:if>
				</div>
			</div>
			
			<div>
				<label class="control-label" for="address">우편번호</label>
				<input class="form-control" type="text" id="sample4_postcode" placeholder="우편번호" onclick="sample4_execDaumPostcode()" required>
				<input type="button" class="btn btn-outline-warning" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" required><br>
				<div class="valid-feedback"></div>
				
				<label class="control-label" for="address">주소</label>
				<input class="form-control" type="text" id="sample4_roadAddress" name="address" placeholder="도로명주소" readonly required>
				<div class="valid-feedback"></div>
				<span id="guide" style="color:#999;display:none"></span>
				
				<label class="control-label" for="addressdetail">상세주소</label>
				<input class="form-control" type="text" id="sample4_detailAddress" name="addressdetail" placeholder="상세주소" onchange="forisvalid(this);" required>
				<div class="valid-feedback"></div>
				
			</div>
			
			<div>
				<label class="control-label" for="birth">생년월일</label>
				<input class="form-control" type="text" name="birth" id="birth" maxlength="10" placeholder="ex)2000-01-01" onchange="forisvalid(this);" required/>
				<div class="valid-feedback"></div>
			</div>			
			
			<div>
			    <label class="control-label" for="email">이메일</label>
			    <input class="form-control ${not empty dto.email ? 'is-valid' : ''}" type="email" name="email" id="email" value="${dto.email}" required<%-- 읽기 전용 --%> ${ not empty dto.email ? 'readonly' : '' }/>
			    <div class="valid-feedback"></div>
			    <div class="invalid-feedback">이메일 형식이 올바르지 않거나 이미 등록된 이메일입니다.</div>
			</div>
			
			<div>
				<label class="control-label" for="tel">휴대폰번호</label>
				<input class="form-control" type="tel" name="tel" id="tel" maxlength="13" placeholder="ex)010-1234-1234" required/>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">휴대폰 번호를 확인해주세요</div>
			</div>
			
			<button class="btn btn-dark mt-3" type="submit">가입하기</button>
			<input type="hidden" name="${_csrf.parameterName }" value= "${_csrf.token}"> 
		</form>
	</div>
	
	
	
	</sec:authorize>
<script>
//허용하고 싶은 특수문자가 있다면 여기서 삭제하면 됨
var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
function characterCheck(obj) {
  	if (regExp.test(obj.value) || obj.value.trim() === "") {
	    obj.value = "";
	    $(obj).removeClass("is-valid");
	    $(obj).addClass("is-invalid");
	    return;
  	}

	//아이디 유효성 검사
  	var postData = {'id':$('#id').val(), '${_csrf.parameterName}': '${_csrf.token}' };
  	$.ajax({
        url:'/dndn/idvalidcheck',
        type:'POST',
        data: JSON.stringify(postData),
        dataType : "text",
        contentType: 'application/json', 
        beforeSend: function(xhr) {
            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}'); // CSRF 토큰 헤더에 추가
        },
        success:function(data){
        	
        	if(data==null||data===''){
	        	$('#id').addClass("is-valid");
	        	$('#id').removeClass("is-invalid");
	        }else{
	        	$('#id').removeClass("is-valid");
	        	$('#id').addClass("is-invalid");
	        }
        	
        	
        },
        error: function (XMLHttpRequest, textStatus, errorThrown){
        	alert('error');
        }
    });
};

$('#name').on("focusout", function() {
	var regExps = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=0-9]/gi;
	if (regExps.test(this.value) || this.value.trim() === "") {
	    $(this).removeClass("is-valid");
	    $(this).addClass("is-invalid");
  	}
  	else{
  		$(this).addClass("is-valid");
	    $(this).removeClass("is-invalid");
  	}
});
function nameCheck(obj) {
  	if (regExp.test(obj.value) || obj.value.trim() === "") {
	    obj.value = "";
	    $(obj).removeClass("is-valid");
	    $(obj).addClass("is-invalid");
  	}
  	else{
  		$(obj).addClass("is-valid");
	    $(obj).removeClass("is-invalid");
  	}
}
function forisvalid(obj) {
	
	$(obj).removeClass("is-invalid");
	$(obj).addClass("is-valid");
}
function forisinvalid(obj) {
	 	$(obj).removeClass("is-valid");
 		$(obj).addClass("is-invalid");
}
//비밀번호 확인
function pwcheck(){
	if($('#pw').val().length!=0){
		if($('#pw').val() == $('#pwd2').val()){
			$('#pwd2').addClass("is-valid");
	    	$('#pwd2').removeClass("is-invalid");
		}
		else{
			$('#pwd2').removeClass("is-valid");
	    	$('#pwd2').addClass("is-invalid");
		}
	}
}



$('#tel').keydown(function(event) {
    var key = event.charCode || event.keyCode || 0;
    $text = $(this); 
    if (key !== 8 && key !== 9) {
        if ($text.val().length === 3) {
            $text.val($text.val() + '-');
        }
        if ($text.val().length === 8) {
            $text.val($text.val() + '-');
        }
        if ($text.val().length>=12 && $text.val().trim() != "") {
        	$('#tel').addClass("is-valid");
        	$('#tel').removeClass("is-invalid");
        } else {
        	$('#tel').removeClass("is-valid");
        	$('#tel').addClass("is-invalid");
        }
        
    }
    
    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));           
});

$('#tel').on("focusout", function() {
    if ($(obj).val().trim() === "") {
    	$('#tel').removeClass("is-valid");
    	$('#tel').addClass("is-invalid");
    } else {
    	$('#tel').addClass("is-valid");
    	$('#tel').removeClass("is-invalid");
    }
});

//이메일 체크 
$('#email').on("focusout", function() {
    if (!$('#email').val().includes('.')||!$('#email').val().includes('@')) {
    	$('#email').removeClass("is-valid");
    	$('#email').addClass("is-invalid");
    } 
    else{
		var emailData = {'email':$('#email').val(), '${_csrf.parameterName}': '${_csrf.token}' };
		console.log(emailData);
	  	$.ajax({
	        url:'/dndn/emailvalidcheck',
	        type:'POST',
	        data: JSON.stringify(emailData),
	        dataType : "text",
	        contentType: 'application/json', 
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}'); // CSRF 토큰 헤더에 추가
	        },
	        success:function(data){
	        	
	        	if(data==null||data===''){
		        	$('#email').addClass("is-valid");
		        	$('#email').removeClass("is-invalid");
		        }else{
		        	$('#email').removeClass("is-valid");
		        	$('#email').addClass("is-invalid");
		        }
	        	
	        	
	        },
	        error: function (XMLHttpRequest, textStatus, errorThrown){
	        	alert('error');
	        }
	    });
    }
});
$('#pw').on("focusout", function() {
	if($('#pw').val().length===0){
		$('#pw').removeClass("is-valid");
		$('#pw').addClass("is-invalid");
	}
	else{
   		$('#pw').addClass("is-valid");
   		$('#pw').removeClass("is-invalid");
	}
});


$('#birth').keydown(function(event) {
    var key = event.charCode || event.keyCode || 0;
    $text = $(this); 
    if (key !== 8 && key !== 9) {
        if ($text.val().length === 4) {
            $text.val($text.val() + '-');
        }
        if ($text.val().length === 7) {
            $text.val($text.val() + '-');
        }
    }
   
    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));           
});


/* 다음 주소 api */
  function sample4_execDaumPostcode() {
        new daum.Postcode({
       	 	width: 600, // 창의 가로 크기
       	    height: 800, // 창의 세로 크기
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById('sample4_postcode').setAttribute('disabled', true);
                document.getElementById("sample4_postcode").classList.add("is-valid");
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_roadAddress").classList.add("is-valid");
                

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
  //달력
  $(document).ready(function() {
	    $('#birth').datepicker({
	    	   startView: 1,
	    	    language: "ko"
	    })

	});
  $(document).ready(function() {
	  $('#signupForm').on('submit', function(event) {
	    if ($(this).find('.is-invalid').length > 0) {
	      event.preventDefault();
	      // 유효성 검사 실패 시 실행할 동작
	      alert('올바르게 작성해주세요');
	    }
	  });
	});
</script>
</body>
</html>