<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link rel="stylesheet" href="/dndn/resources/css/notice_ahyun.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"> 

<style>
	.notice-box {
		font-size: 13pt;
		border-bottom: 1px solid black;
		border-top: 1px solid black;
	
	}
	
	.notice-list {
		margin-top: 10px;	
		border-bottom: 1px solid #ccc;
		padding: 10px;
	
	}
	
	.notice-btn {
		border: 1.5px solid #F27C2A;
		background-color:#F27C2A;
		color: white;
		width: 50px;
		
		float:right;
		
		padding: 5px;
		margin: 5px;
		margin-top: 20px;
		margin-bottom: 20px;
		
	}
	
	.add-side {
		width: 800px;
		padding: 10px;
		
	
	}
	
	.underline{
		
		width: 150px;
		border-bottom: 2px solid #eee;
		
	}
	
	.label {
		
		font-size: 12pt;
		margin-top: 10px;
		margin-bottom: 10px;
	
	}
	
	.add-btn {
		
		font-size: 11pt;
 		background-color: #F27C2A;
 		color: white;
 		
 		transition: all 0.1s linear;
		
	}
	
	 .add-btn:hover {
 	 	background-color: #F27C2A;
 		color: white;
 	 	font-size: 11pt;
 		transform: scale(1.1);
 		
 	}
 	
	.back-btn {

		font-size: 11pt;
 		background-color: #2E75B6;
 		color: white;
 		
 		transition: all 0.1s linear;
		
	}
	
	 .back-btn:hover {
	 
	  	background-color: #2E75B6;
 		color: white;
 	 	font-size: 11pt;
 		transform: scale(1.1);
 		
 	}
 	
 	.btn-side {
 		
 		width: 800px;
 		margin-top: 30px;
 		margin-left: 10px;
 		display:flex;
 		justify-content: space-between;
 		
 	
 	}
	
	

</style>
</head>
<body>
	<!-- template.jsp -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<section class="container">
		<%@ include file="/WEB-INF/views/inform/inform_sidebar.jsp" %>
		
		<div class="mainbar">
			<h2 class="th-bold" style="font-size: 18pt; color:#333; margin-bottom:20px; margin-top:20px;">글쓰기</h2>
			<div class="underline"></div>
			<div class="add-side">
				
				
			<form method="POST" action="/dndn/inform/addok.do">
				
				
				
				<label class="label">제목</label>
				<input class="form-control" name="title" type="text" placeholder="제목을 입력하세요." style="margin-left: 10px; width: 800px;" value="${dto.title }">
				
				<label class="label">내용</label>
				<div style="margin-left: 10px;">
				  <textarea id="summernote" name="content" >${dto.content }</textarea>
				</div>
			
			<div class="btn-side">
				<input type="button" value="뒤로가기" onclick="history.back();" class="btn back-btn"> 
				<input type="submit" value="수정" class="btn add-btn" onclick="location.href='/dndn/inform/view.do?noticeseq=${dto.noticeseq }';"> 
			</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="id" value='<sec:authentication property="principal.username"/>'>
			
			</form>
			
			
			</div>
				
			
			
		
		</div>
	</section>
	



	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 


<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"
></script>	
<script>

 
 var a = $('#summernote');

 /*
 var insertText = function () { // 이거 실행시 
     // 현재 커서 위치에 'hello world'라는 텍스트 생성 할수 있음  
     a.summernote('editor.insertText', 'hello world');
 };
*/
 
 function sendFile(file, editor) {
     // 파일 전송을 위한 폼생성
       data = new FormData();
       data.append("file", file); // "uploadFile"에서 "file"로 변경
        $.ajax({ // ajax를 통해 파일 업로드 처리
            type : "POST",
            url : "/dndn/notice_add.do",
            data : data,
            dataType: 'json',
            cache : false,
            contentType : false,
            processData : false,
            beforeSend: function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}'); // CSRF 토큰 헤더에 추가
            },
            success : function(data) { // 처리가 성공할 경우
               $(editor).summernote('editor.insertImage', '/dndn/resources/fileupload/'+data[0].filename);
            }
        });
 }
 // width은정하면 글 커지면 오른쪼긍로 터짐;; 
 $(document).ready(function() {
     $('#summernote').summernote({
           width:600,
           minHeight: 300,
           lang: "ko-KR",
           codeviewFilter: false,
           codeviewIframeFilter: true,
           callbacks: {
              onImageUpload: function(files, editor, welEditable){
                 sendFile(files[0], this);
              }
           }
     });
 });

 
 
 
     
     
</script>
</body>
</html>














