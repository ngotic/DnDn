<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dndn</title>
<%@ include file="/WEB-INF/views/include/asset.jsp"%>
<style>
#side-content > table > tbody > tr:nth-child(1) {
	background-color: #F1F1F1 !important;
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
#editForm{
	margin: 20px;
	padding: 10px;
}
</style>
</head>
<body>
		<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<div id="box">
		<%@ include file="/WEB-INF/views/include/mypage-header.jsp" %>
		<section class="container">
			<div id="pageTitle">내 정보</div>
			<form method="POST" action="/dndn/mypage/editok.do" id="editForm">
			<c:forEach var="user" items="${list }">
				<div class="input-group mb-3">
					<span class="input-group-text">아이디</span> <input
						type="text" class="form-control" value="${user.id }"
						 readonly name="id">
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text">비밀번호</span> <input
						type="number" class="form-control" placeholder="비밀번호"
						 name="pw">
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text">전화번호</span> <input
						type="number" class="form-control"
						value="010" disabled><span class="dash">&nbsp;-&nbsp;</span> <input
						type="number" class="form-control"  value="${user.tel.substring(tFidx,tLidx-1) }"
						 name="telList"><span
						class="dash">&nbsp;-&nbsp;</span><input type="number"
						class="form-control" value="${user.tel.substring(tLidx)}"  name="telList">
				</div>
				<div class="input-group mb-3">
					<input type="text" class="form-control" value="${user.email.substring(0,eidx) }" name="emailList"
						> <span class="input-group-text">@</span>
            <input type="text" name="emailList" id="em2" class="form-control" value="${user.email.substring(eidx+1) }" readonly>
            <select class="form-select" id="em3">
            <option selected value="" disabled  hidden>  메일 선택  </option>
 <option value="">  이메일주소 직접입력  </option>
                <option value="naver.com">naver.com</option>
                <option value="nate.com">nate.com</option>
                <option value="gmail.com">gmail.com</option>
                <option value="yahoo.com">yahoo.com</option>
                <option value="hanmail.net">hanmail.net</option>
</select>
        </div>
				<div class="input-group mb-3">
					<span class="input-group-text">우편번호</span> <input
						type="text" id="sample4_postcode" class="form-control"
						placeholder="우편번호"> &nbsp; <input type="button"
						onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
						class="btn btn-primary" id="postnum">
				</div>
				<div class="input-group mb-3">
					<input type="text" id="sample4_roadAddress" value="${user.address }" name="address"
						class="form-control">
				</div>
				
				
				<div class="input-group mb-3">
					<span id="guide" style="color: #999; display: none"></span> <input
						type="text" id="sample4_detailAddress" value="${user.addressdetail } "
						class="form-control" name="addressdetail"><input type="text"
						id="sample4_extraAddress" placeholder="참고항목" class="form-control">
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text">내 포인트 조회</span> <input
						type="text" class="form-control" value="${user.point }"
						 disabled>
					<span style="font-size: 24px;">&nbsp;점</span>
				</div>
				<div><input type="submit" value="변경하기"></div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
				</c:forEach>
			</form>
		</section>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	/* 전화번호 4자리 */
	$("input[name=telList]").keyup(function(){
		
		if($(event.target).val().length > 4){

			$(event.target).val($(event.target).val().slice(0, 4));

        }
	});
	
	/* value 초기화 */
	$(".form-control").focus(function(){
		$(event.target).val("");
		$(event.target).attr("required",true);
		
	});
	
	
	$(".form-control").keyup(function(){
		
		if($(event.target).val()==""){
			
			$(event.target).attr("required",true); 
		}

	});
	
	/* 이메일 select change value */
	$("#em3").change(function(){
		
		$("#em2").removeAttr("readonly"); 
			
		if($("#em3").val()==""){
			
		$("#em2").val( $("#em3").val());
		$("#em2").removeAttr("readonly"); 

		}else{
			$("#em2").attr("readonly",true); 
			 $("#em2").val( $("#em3").val());
		}
		
	});
	
	</script>
	<script>
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
								guideTextBox.innerHTML = 'expJibunAddr';
								guideTextBox.style.display = 'block';
								$('#sample4_jibunAddress').attr('placeholder', expJibunAddr);
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














