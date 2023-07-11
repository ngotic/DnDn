<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<style>
*{
	font-weight:bold;
}


.btn-outline-warning{
	font-weight:bold;
}
        body{
            align-items: center;
        }
        .FindPWContainer{
        	width:575px;
        	height:350px;
        	overflow:hidden;
        	transition-property: all;
    		transition-duration: 2s;
        }
        #pagename{
        width: 60%;
        margin: auto;
         margin-top:30px;
         font-weight:bold;
         color:black;
        }
        #loginWrapper{
            margin: AUTO;
            display: flex;
            width: 60%;
            height: 600px;
            align-items: center;
            text-align: left;
            border: 1px solid #EEEEEE;
            border-top: 1px solid black;
        }

        #FindIdProcess{
            width: 575px;
            display: flex;
            border-right: 1px solid #EEEEEE;
            flex-direction: column;
            justify-content: center; 
            align-items: center; 
            margin: 0 auto; 
            height: 70%;

        }
        #FindIdProcess > tbody{
            width: 70%;
            
        }
        .membertable{
         	width: 575px;
            display: flex;
            border-right: 1px solid #EEEEEE;
            flex-direction: column;
            justify-content: center; 
            align-items: center; 
            margin: 0 auto; 
            height: 70%;
        
        }
         #membertable > tbody{
            width: 70%;
            
        }
        #FindPwProcess{
            width: 575px;
            display: flex;
            flex-direction: column;
            justify-content: center; 
            align-items: center; 
            margin: 0 auto; 
            height: 100%;

        }
        #UpdatePw{
        	 width: 575px;
            display: flex;
            flex-direction: column;
            justify-content: center; 
            align-items: center; 
            margin: 0 auto; 
            height: 70%;
        	
        }
        #FindPwProcess > tbody{
            width: 70%;
        }
       #findid{
            width: 100%;
            height: 50px;        
            font-weight:bold;
       }
       #loginSubmit{
            width: 100%;
            height: 50px;        
            
       }
       #name  {
            width: 100%;
            height: 50px;
       }
       #idInput  {
            width: 100%;
            height: 50px;
       }
       #pwInput{
            width: 100%;
            height: 50px;
       }
       #email{
            width: 100%;
            height: 50px;
       }
       #emailInput{
            width: 100%;
            height: 50px;
       }
       #registerSubmit{
            width: 100%;
            height: 50px;
            border:1px solid gray;
       }
       #findIdPw{
            width: 100%;
            height: 50px;
            border:1px solid gray;
       }
       th{
        width: 330px;
        padding-bottom: 15px;
       }
       td{
        padding-bottom: 15px;
       }
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>	
	<input type="hidden" id="csrf" name="${_csrf.parameterName }" value= "${_csrf.token}"> 
	<div id="pagename"> <h2>ID PW 찾기</h2> </div>
    <fieldset id="loginWrapper" >
	    <table class="membertable" id="findidtable">
	    	<tr>
	    		<td><span id="idlist"></span></td>
	    	</tr>
	    </table>
        <table id="FindIdProcess" class="membertable">
            <tbody>
                <tr>
                    <th>아이디 찾기</th>
                </tr>    
                <tr>
                    <td>가입하신 이름과 이메일을 입력해주세요.
                </tr>    
                <tr>
                    <td><input type="text" placeholder="이름" name="name" id="name" required> </td>
                </tr>    	
                <tr>
                    <td><input type="email" placeholder="이메일" name="email" id="email" required></td>
                </tr>    
                <tr>
                    <td><button id="findid" class="btn btn-warning">아이디 찾기</button></td>
                </tr>
            </tbody>
        </table>
        <div class="FindPWContainer">
        <table id="FindPwProcess">
            <tbody>
                 <tr>
                    <th>비밀번호 찾기</th>
                </tr>    
                <tr>
                    <td>가입하신 아이디와 이메일를 입력해주세요. <br>비밀번호는 대소문자를 구분합니다. </td>
                </tr>    
                <tr>
                    <td><input type="text" placeholder="아이디" name="id" id="idInput" required> </td>
                </tr>    	
                <tr>
                    <td><input type="email" placeholder="이메일" name="emailInput" id="emailInput" required></td>
                </tr>
                <tr>
                    <td>
                    <button id="findpw"  class="btn btn-outline-warning">비밀번호 찾기</button>
                    <button type="button" class="btn btn-outline-warning" id="mail-Check-Btn">본인인증</button>
                    <button id="showpw" class="btn btn-outline-warning" onclick="showpw();">비밀번호 재설정</button>
                    </td>
                </tr>
                <tr>
                    <td> 
						<div class="mail-check-box">
							<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
						</div>
						<span id="mail-check-warn"></span>
                    </td>
                </tr>
            </tbody>
        </table>
        <table id ="UpdatePw">
        	<tbody>
        		 <tr>
                    <th>비밀번호 변경</th>
                </tr>    
                <tr>
                    <td>변경하실 비밀번호를 입력해주세요. <br>비밀번호는 대소문자를 구분합니다. </td>
                </tr>    
                <tr>
                    <td><input type="password" placeholder="변경할 비밀번호" name="inputPw" id="inputPw" class="form-control" required> <span id="pwok"></span> </td>
                </tr>    	
                <tr>
                    <td><button id="updatepw" class="btn btn-outline-warning">비밀번호 변경</button></td>
                </tr>    	
        	</tbody>
        </table>
        </div>
    </fieldset>
<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	$('#findidtable').hide();
	$('#showpw').hide();
	$('#mail-Check-Btn').hide();
	$('.mail-check-input').hide();
	//아이디 찾기
	$(document).on('click','#findid',function(){
		var name = $('#name').val();
	 	var email = $('#email').val();
	 	var csrf = $('#csrf').val();
		console.log(name + email +csrf);
	 	var postData = {'name' : name , 'email' : email ,'${_csrf.parameterName}': '${_csrf.token}' };
		$.ajax({
	        url:'/dndn/auth/findidpw.do',
	        type:'POST',
	        data: JSON.stringify(postData),
	        dataType : "json",
	        contentType: 'application/json', 
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}'); // CSRF 토큰 헤더에 추가
	        },
	        success:function(data){
	        		$('#findidtable').show();
	       	 		 $("#idlist").append("<h3 style=color:black;text-align:center;>"+name+" 회원님의 아이디는"+"<br><strong style=color:orange;>"+data.id+"</strong>입니다.</h3>");
					$('#findid').prop('disabled','true');
					$('#FindIdProcess').hide();
					$('#findpw').removeClass("btn-outline-warning");
					$('#findpw').addClass("btn-warning");
					new Swal('확인', '확인되었습니다.','success').then(function() {
		        	});
		        	
	        },
	        error: function (XMLHttpRequest, textStatus, errorThrown){
	
	        	new Swal('Error','정보를 확인해주세요', 'error');
	        }
	    });
	});
	
	//비밀번호 찾기
	$(document).on('click','#findpw',function(){
		var id = $('#idInput').val();
	 	var email = $('#emailInput').val();
	 	var pwData = {'id' : id , 'email' : email ,'${_csrf.parameterName}': '${_csrf.token}' };
		$.ajax({
	        url:'/dndn/findpw',
	        type:'POST',
	        data: JSON.stringify(pwData),
	        dataType : "text",
	        contentType: 'application/json', 
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}'); // CSRF 토큰 헤더에 추가
	        },
	        success:function(data){	
	        	console.log(data);
	        	if(data==="result"){
	        	
	        	$('#mail-Check-Btn').trigger("click");
	        	$('#idInput').prop('readonly',true);
	        	$('#emailInput').prop('readonly',true);
	        	$('.mail-check-input').show();
				$('#findpw').prop('disabled',true);
				$('#findpw').text('인증 메일 발송중');
	        	}
	        	else{
	        		$('#findpw').text('비밀번호 찾기'); 	
		        	$('#findpw').prop('disabled',false);
		        	new Swal('Error','정보를 확인해주세요', 'error');
		        	
		        	
	        	}
		
	        },
	        error: function (XMLHttpRequest, textStatus, errorThrown){
	        	
	        	$('#findpw').text('비밀번호 찾기'); 	
	        	$('#findpw').prop('disabled',false);
	        	new Swal('Error','1정보를 확인해주세요', 'error');
	        	
	        }
	    });
	});


	//이메일 인증
	$('#mail-Check-Btn').click(function() {
		const emailInput = $('#emailInput').val(); // 이메일 주소값 얻어오기!
		const idInput = $('#idInput').val();;
		console.log('완성된 이메일 : ' + emailInput); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		$('#mail-Check-Btn').val('인증메일 전송중');
		$.ajax({
			type : 'POST',
			url : '/dndn/emailVerify', 
			data: {"emailInput":emailInput, "id":idInput},
		 	beforeSend: function(xhr) {
		            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}'); // CSRF 토큰 헤더에 추가
		        },
			success : function (data) {
				console.log("data : " +  data.result);
				checkInput.attr('disabled',false);
				code =data;
				new Swal('인증번호', '인증번호가 전송되었습니다.','success');
			},		
		  error: function (XMLHttpRequest, textStatus, errorThrown){
				
	        	new Swal('Error','이메일 인증 실패', 'error');
	        }    
		}); // end ajax	
	}); // end send eamil
	
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').on('keyup', function(){
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#emailInput').attr('readonly',true);
			$('#showpw').show();
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
		}
	});
	function showpw(){
	     $('#FindPwProcess').hide();
	}
	
	$(document).on('click','#updatepw',function(){
	 	var pw = $('#inputPw').val();
	 	var id = $('#idInput').val();
		console.log(pw);
	 	var postData = {'id':id ,'pw' : pw , '${_csrf.parameterName}': '${_csrf.token}' };
	 	if(pw.length>=6){
		$.ajax({
	        url:'/dndn/updatepw',
	        type:'POST',
	        data: JSON.stringify(postData),
	        dataType : "text",
	        contentType: "application/json; charset=UTF-8",
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}'); // CSRF 토큰 헤더에 추가
	        },
	        success:function(data){
	        		$('#inputPw').hide();
	       	 		 $("#pwok").append("<h3>변경완료</h3>");
					$('#updatepw').prop('disabled',true);
					new Swal('변경', '변경완료되었습니다.','success').then(function() {
		        	    location.href='/dndn/auth/login.do';
		        	    
		        	});
	        },
	        error: function (XMLHttpRequest, textStatus, errorThrown){
	        	new Swal('Error','변경 실패', 'error');
	        }
	    });
	 	}
	 	else{
	 		new Swal('변경할 비밀번호를 확인해주세요', 'error');
	 	}
	});
	
	
	
</script>
</body>
</html>