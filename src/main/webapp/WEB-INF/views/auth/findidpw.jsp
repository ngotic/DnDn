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
                    <button id="findpw"  class="btn btn-primary">비밀번호 찾기</button>
                    <button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
                    <button id="showpw" class="btn btn-primary" onclick="showpw();">비밀번호 재설정</button>
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
                    <td><input type="text" placeholder="변경할 비밀번호" name="inputPw" id="inputPw" class="form-control" required> <span id="pwok"></span> </td>
                </tr>    	
                <tr>
                    <td><button id="updatepw" class="btn btn-primary">비밀번호 변경</button></td>
                </tr>    	
        	</tbody>
        </table>
        </div>
    </fieldset>
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
	       	 		 $("#idlist").append("<h3>"+"아이디 : "+data.id+"</h3>");
					$('#findid').prop('disabled','true');
					$('#FindIdProcess').hide();
	        },
	        error: function (XMLHttpRequest, textStatus, errorThrown){
	
	        	alert('정보를 다시 입력해주시길 바랍니다.' );
	        }
	    });
	});
	
	//비밀번호 찾기
	$(document).on('click','#findpw',function(){
		var id = $('#idInput').val();
	 	var email = $('#emailInput').val();
		console.log(name + email);
	 	var pwData = {'id' : id , 'email' : email ,'${_csrf.parameterName}': '${_csrf.token}' };
		$.ajax({
	        url:'/dndn/findpw',
	        type:'POST',
	        data: JSON.stringify(pwData),
	        dataType : "json",
	        contentType: 'application/json', 
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}'); // CSRF 토큰 헤더에 추가
	        },
	        success:function(data){	
	        	$('#mail-Check-Btn').trigger("click");
	        	$('.mail-check-input').show();
				$('#findpw').prop('disabled','true');
	        },
	        error: function (XMLHttpRequest, textStatus, errorThrown){
	
	        	alert('정보를 다시 입력해주시길 바랍니다.' );
	        }
	    });
	});


	//이메일 인증
	$('#mail-Check-Btn').click(function() {
		const emailInput = $('#emailInput').val(); // 이메일 주소값 얻어오기!
		const idInput = $('#idInput').val();;
		console.log('완성된 이메일 : ' + emailInput); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
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
				alert('인증번호가 전송되었습니다.');
			}			
		}); // end ajax	
	}); // end send eamil
	
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').blur(function () {
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
	        },
	        error: function (XMLHttpRequest, textStatus, errorThrown){
	        	alert('정보를 다시 입력해주시길 바랍니다.' );
	        }
	    });
	});
	
	
	
</script>
</body>
</html>