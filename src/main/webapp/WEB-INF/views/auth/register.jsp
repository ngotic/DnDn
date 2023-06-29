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
<style>
	#address{
		width: 270px;
	}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>	
    <div class="container mt-3">
		<h3><strong>회원가입</strong></h3>
		<form action="/dndn/auth/registerok.do" method="post" id="signupForm">
			
			<div>
				<label class="control-label" for="name">이름</label>
				<input class="form-control" type="text" name="name" id="name" maxlength="4"/>
				<div class="invalid-feedback">비밀 번호를 확인하세요.</div>
			</div>   
			
			<div class="mt-3">
				<label class="control-label" for="id">아이디</label>
				<input class="form-control" type="text" name="id" id="id"/>
				<div class="valid-feedback">사용 가능한 아이디 입니다.</div>
				<div class="invalid-feedback">사용할 수 없는 아이디입니다.</div>
			</div>
			<div>
				<label class="control-label" for="pw">비밀번호</label>
				<input class="form-control" type="password" name="pw" id="pw"/>
				<div class="invalid-feedback">비밀 번호를 확인하세요.</div>
			</div>
			<div>
				<label for="pwd2" class="control-label">비밀번호 확인</label>
				<input type="password" class="form-control" name="pwd2" id="pwd2"/>
			</div>
			
			<div>
				<label class="control-label" for="Gender">성별</label>
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-light">
						<input type="radio" name="Gender" autocomplete="off" value="M" checked>남자
					</label>
					<label class="btn btn-light">
						<input type="radio" name="Gender" autocomplete="off" value="F" checked>여자
					</label>
				</div>
			</div>
			
			<div>
				<label class="control-label" for="address">우편번호</label>
				<input class="form-control" type="text" id="sample4_postcode" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				
				<label class="control-label" for="address">주소</label>
				<input class="form-control" type="text" id="sample4_roadAddress" name="address" placeholder="도로명주소" readonly>
				<span id="guide" style="color:#999;display:none"></span>
				
				<label class="control-label" for="addressD">상세주소</label>
				<input class="form-control" type="text" id="sample4_detailAddress" name="addressD" placeholder="상세주소" >
				
			</div>
						
			<div>
				<label class="control-label" for="email">이메일</label>
				<input class="form-control" type="email" name="email" id="email"/>
				<div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
				
			</div>
				<div>
				<label class="control-label" for="tel">휴대폰번호</label>
				<input class="form-control" type="tel" name="tel" id="tel" maxlength="13" placeholder="핸드폰번호"/>
				<div class="invalid-feedback">번호 확인</div>
			</div>
			
			<button class="btn btn-dark mt-3" type="submit">가입</button>
			<input type="hidden" name="${_csrf.parameterName }" value= "${_csrf.token}"> 
		</form>
	</div>
	
	
	

<script>
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
    }
    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));           
});

/* 다음 주소 api */
  function sample4_execDaumPostcode() {
        new daum.Postcode({
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
                document.getElementById("sample4_roadAddress").value = roadAddr;
                

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


</script>
</body>
</html>