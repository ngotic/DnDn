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
            width: 50%;
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
        <table id="FindPwProcess">
            <tbody>
                 <tr>
                    <th>비밀번호 찾기</th>
                </tr>    
                <tr>
                    <td>가입하신 아이디와 이메일를 입력해주세요. <br>비밀번호는 대소문자를 구분합니다. </td>
                </tr>    
                <tr>
                    <td><input type="text" value="아이디" name="username" id="idInput" required> </td>
                </tr>    	
                <tr>
                    <td><input type="password" value="비밀번호" name="password" id="pwInput" required></td>
                </tr>    
                <tr>
                    <td><button id="loginSubmit" class="btn btn-warning">로그인</button></td>
                </tr>
                <tr>
                    <td> <input type="checkbox">아이디 저장</td>
                </tr>
            </tbody>
        </table>
    </fieldset>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	$('#findidtable').hide();
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


</script>
</body>
</html>