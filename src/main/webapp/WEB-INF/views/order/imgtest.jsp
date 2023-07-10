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
      <%@ include file="/WEB-INF/views/order/admin-sidebar.jsp" %>
      
      <div class="mainbar">
         <h2 class="th-bold" style="font-size: 18pt; color:#333; margin-bottom:20px; margin-top:20px;">글쓰기</h2>
         <div class="underline"></div>
         <div class="add-side">
            
            
         <form method="POST" action="/dndn/inform/addok.do">
            
            
            
            <label class="label">제목</label>
            <input class="form-control" name="title" type="text" placeholder="제목을 입력하세요." style="margin-left: 10px; width: 800px;">
            
            <label class="label">내용</label>
            <div style="margin-left: 10px;">
              <textarea id="summernote" name="content" ></textarea>
            </div>
         
         <div class="btn-side">
            <input type="button" value="뒤로가기" onclick="history.back();" class="btn back-btn"> 
            <input type="submit" value="등록" class="btn add-btn" onclick="location.href='/dndn/inform/notice.do';"> 
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
/* 
$(document).ready(function() {
   //여기 아래 부분
   $('#summernote').summernote({
      
      width:800,
      minHeight: 300,
      lang: "ko-KR",
         //콜백 함수
         callbacks : { 
            onImageUpload : function(files, editor, welEditable) {
         // 파일 업로드(다중업로드를 위해 반복문 사용)
         for (var i = files.length - 1; i >= 0; i--) {
            uploadSummernoteImageFile(files[i],
            this);
               }
            }
         }
   
      });

});
   
     function uploadSummernoteImageFile(file, el) {
         data = new FormData();
         data.append("file", file);
         $.ajax({
            data : data,
            type : "POST",
            url : "uploadSummernoteImageFile",
            contentType : false,
            enctype : 'multipart/form-data',
            processData : false,
            success : function(data) {
               $(el).summernote('editor.insertImage', data.url);
            }
         });
      }

 */
 
 
 
 
 /*
 
 
   $(document).ready(function() {
        $('#summernote').summernote({
              placeholder: '게시글을 작성해주세요.',
              minHeight: 370,
              maxHeight: null,
              focus: true, 
              lang : 'ko-KR',
              toolbar: [
                 ["style", ["style"]],
                 ["font", ["bold", "underline", "clear"]],
                 ["fontname", ["fontname"]],
                 ["para", ["ul", "ol", "paragraph"]],
                 ["table", ["table"]],
                 ["insert", ["link", "picture", "video"]],
                 ["view", ["fullscreen", "codeview"]],
                 ['highlight', ['highlight']]
               ],
               callbacks: {   //여기 부분이 이미지를 첨부하는 부분
               onImageUpload : function(files) {
                  uploadSummernoteImageFile(files[0],this);
               }
            }
        });
   });
   
   function uploadSummernoteImageFile(file, editor) {
      var data = new FormData();
      data.append("file", file);
      $.ajax({
         data : data,
         type : "POST",
         url : "/uploadSummernoteImageFile",
         contentType : false,
         processData : false,
         success : function(data) {
                         //항상 업로드된 파일의 url이 있어야 한다.
                         $(editor).summernote('insertImage', data.url);
                             alert("Success");
          }
         ,error:function(request,status,error, data){
                         alert("Error");
                  }
      });
   }
   $(function() { 
      $("#commentForm").validate();
      $.extend( $.validator.messages, { 
         required: "필수 항목입니다."
      } ); 
   });
 
 
 
*/



/*
$(document).ready(function() {
   $('#summernote').summernote({                                        
      height : 300,
      minHeight : null,
      maxHeight : null,
      focus : true,
      callbacks : {                                                    
         onImageUpload : function(files, editor, welEditable) {       
            for (var i = 0; i < files.length; i++) {
               sendFile(files[i], this);
            }
         }
      }
   });
});

function sendFile(file, el) {
   var form_data = new FormData();
   form_data.append('file', file);
   $.ajax({                                                              
      data : form_data,
      type : "POST",
      url : '/dndn/resources/fileupload',
      cache : false,
      contentType : false,
      enctype : 'multipart/form-data',                                  
      processData : false,
      success : function(url) {                                         
         $(el).summernote('insertImage', url, function($image) {
            $image.css('width', "25%");
         });
      }
   });
}
 */
 
 /*
 $(document).ready(function() {
      $('#summernote').summernote({                                        
         height : 300,
         minHeight : null,
         maxHeight : null,
         focus : true,
         callbacks : {                                                    
            onImageUpload : function(files, editor, welEditable) {       
               sendFile(files[0],this);
            }
         }
      });
   });
 
 function sendFile(file,editor) {
       data = new FormData();
       data.append("file", file);
       $.ajax({
           data: data,
           type: "POST",
           url: "/dndn/resources/fileupload",
           enctype: 'multipart/form-data',
           cache: false,
           contentType: false,
           processData: false,
           success: function(response) {
               if (response.error){
                   alert('에러가 발생했습니다. ' + response.error);
               } else {
                   $('#summernote').summernote('insertImage', response.url);
               }
           }
       });
   }
 
 router.post('/imageUpload',multipartMiddleware,function(req,res){
       f = fs.readFileSync(req.files.file.path);
       base64 = Buffer.from(f).toString('base64');
       
       var imgbbAPI = require('../imgbbAPIkey.json'); // API KEY
       const options = {
           uri:'https://api.imgbb.com/1/upload?expiration=600&key='+imgbbAPI.key, 
           method: 'POST',
           form: {
             image:base64, // 이미지 첨부
           },
           json: true // json 형식으로 응답
       }
       request.post(options, function(error,httpResponse,body){
           if(error){
               res.send({error: error});
           } else{
               res.send({url: body.data.display_url});
           }
       });
   });
 */
 
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
        data.append("uploadFile", file);
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













