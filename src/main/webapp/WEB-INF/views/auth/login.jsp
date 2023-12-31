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
.btn-light{
	font-weight:bold;
	color:gray;
}
.btn{
	font-weight:bold;
}
	
        body{
            align-items: center;
        }
        #pagename{
         font-family : 'Noto Sans KR', sans-serif;
         
         
         width: 60%;
         margin: auto;
         margin-top:30px;
         font-weight:bold;
         color:black;
        }
        #loginWrapper{
        	font-family: 'Pretendard-Regular';
            margin: AUTO;
            display: flex;
            position:relative;
            width: 60%;
            height: 600px;
            align-items: center;
            text-align: left;
            border: 1px solid #EEEEEE;
            border-top: 1px solid black;
            margin-bottom: 50px;
        }

        #loginProcess{
            width: 575px;
            display: flex;
            border-right: 1px solid #EEEEEE;
            flex-direction: column;
            justify-content: center; 
            align-items: center; 
            margin: 0 auto; 
            height: 70%;

        }
        #loginProcess > tbody{
            width: 70%;
            
        }
        #registerProcess{
            width: 50%;
            display: flex;
            flex-direction: column;
            justify-content: center; 
            align-items: center; 
            margin: 0 auto; 
            height: 70%;

        }
        #registerProcess > tbody{
            width: 70%;
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
       #registerSubmit{
            width: 100%;
            height: 50px;
            border:1px solid gray;
       }
       #findidpw{
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
       #socialLoginWrapper{
       		position: absolute;
       		bottom:70px;
       		left: 85px;
       }
       #kakaoLogin{
       width:200px;
       }
       .main_title{
		font-family : 'Noto Sans KR', sans-serif;
		font-weight: 700;
		margin : 20px 0 20px 0;
		color: #777;
	  }
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>	
	<div id="pagename"> <h2 class="main_title">로그인</h2></div>
	<%
	    String errorParam = request.getParameter("error");
	    String passwordClass = "";
	    if (errorParam != null) {
	        passwordClass = "is-invalid";
	    }
	%>
    <fieldset id="loginWrapper" >
    	<form action="/dndn/login" method="Post">
    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">   
        <table id="loginProcess">
            <tbody>
                <tr>
                    <th>회원 로그인</th>
                </tr>    
                <tr>
                    <td>가입하신 아이디와 비밀번호를 입력해주세요. <br>비밀번호는 대소문자를 구분합니다. </td>
                </tr>    
                <tr>
                    <td><input type="text" placeholder="아이디" name="username" id="idInput" class="form-control <%= passwordClass %>" required> </td>
                </tr>    	
                <tr>
                    <td><input type="password" placeholder="비밀번호" class="form-control <%= passwordClass %>" name="password" id="pwInput" required>
                    <div class="valid-feedback"></div>
					<div class="invalid-feedback">아이디 혹은 비밀번호를 확인해주세요</div></td>
                </tr>    
                <tr>
                    <td><button id="loginSubmit" class="btn btn-warning">로그인</button></td>
                </tr>
                <tr>
                    <td> <input type="checkbox" name="remember-me">자동 로그인</td>
                </tr>
            </tbody>
        </table>
        </form>
        <table id="registerProcess">
            <tbody>
                <tr>
                    <th>회원가입</th>
                </tr>    
                <tr>
                    <td>아직 회원이 아니신가요?</td>
                </tr>      
                <tr>
                    <td><button class="btn btn-light" id="registerSubmit" onclick="location.href='/dndn/auth/register.do'">회원가입</button></td>
                </tr>
                <tr>
                    <td>아이디 혹은 비밀번호를 잊으셨나요?</td>
                </tr>
                <tr>
                    <td><button class="btn btn-light" id="findidpw" onclick="location.href='/dndn/auth/findidpw.do'">아이디/비밀번호 찾기</button></td>
                </tr>
            </tbody>
        </table>
        <div id="socialLoginWrapper">
        	<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=3e25d1471c8b89b2e37d2bc1eb786e27&redirect_uri=	
http://localhost:8091/dndn/kakao&response_type=code">
			    <img alt="kakaoLogin" id="kakaoLogin" src="/dndn/resources/img/kakao_login_medium_narrow.png">
			    <!-- ///dndn/resources/img/logo_edit.png -->
			</a>
        </div>
    </fieldset>
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
</script>
</body>
</html>