<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dndn</title>
<%@ include file="/WEB-INF/views/include/asset.jsp"%>
<style>
#mypage {
	color: black;
}

.dash {
	font-size: 40px;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

input:disabled {
	background: #e9fae1 !important;
}

#postnum {
	background-color: #82D257;
	border: #5E74AC;
}

input,
.form-control:focus {
	outline: none !important;
	box-shadow: none !important;
}

.input-group{
	margin-top: 20px;
}
</style>
</head>
<body>
	<div id="box">
		<%@ include file="/WEB-INF/views/include/mypage-header.jsp"%>
		<section class="container">
			<h1 id="mypage">My Page</h1>

			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">아이디</span> <input
					type="text" class="form-control" placeholder="Username"
					aria-label="Username" aria-describedby="basic-addon1" disabled>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">비밀번호</span> <input
					type="number" class="form-control" placeholder="Userpassword"
					aria-label="Userpassword" aria-describedby="basic-addon1">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">전화번호</span> <input
					type="number" class="form-control" placeholder="Usertel"
					value="010" aria-label="Usertel1" aria-describedby="basic-addon1"
					disabled><span class="dash">&nbsp;-&nbsp;</span> <input
					type="number" class="form-control" placeholder="Usertel"
					aria-label="Usertel2" aria-describedby="basic-addon1" value="0000"><span
					class="dash">&nbsp;-&nbsp;</span><input type="number"
					class="form-control" placeholder="Usertel" aria-label="Usertel3"
					aria-describedby="basic-addon1" value="0000">
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="UserEmail"
					aria-label="UserEmail"> <span class="input-group-text">@</span>
				<input type="text" class="form-control" placeholder="Email.com"
					aria-label="Email.com">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">우편번호</span> <input
					type="text" id="sample4_postcode" class="form-control"
					placeholder="우편번호"> &nbsp; <input type="button"
					onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
					class="btn btn-primary" id="postnum">
			</div>
			<div class="input-group mb-3">
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소"
					class="form-control"> <input type="text"
					id="sample4_jibunAddress" placeholder="지번주소" class="form-control">
			</div>
			<div class="input-group mb-3">
				<span id="guide" style="color: #999; display: none"></span> <input
					type="text" id="sample4_detailAddress" placeholder="상세주소"
					class="form-control"> <input type="text"
					id="sample4_extraAddress" placeholder="참고항목" class="form-control">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">내 포인트 조회</span> <input
					type="text" class="form-control" placeholder="Userpoint"
					aria-label="Userpoint" aria-describedby="basic-addon1" disabled>
				<span style="font-size: 24px;">&nbsp;점</span>
			</div>
		</section>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
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














