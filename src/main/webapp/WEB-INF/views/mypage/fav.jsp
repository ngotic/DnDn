<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta name="_csrf" content="${_csrf.token}">
<meta charset="UTF-8">
<title>dndn</title>
<%@ include file="/WEB-INF/views/include/asset.jsp"%>
<style>

#side-content > table > tbody > tr:nth-child(4) {
	background-color: #F1F1F1 !important;
}
#cardbox {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	margin-bottom: 10px;
	margin: 20px;
	padding: 10px;
}

#card {
	text-align: center;
	border-radius: 10px;
	margin: 10px;
	padding: 10px;
	background-color: #F9F9D4;
	cursor: pointer;
}

#card>div {
	color: black;
	font-weight: bold;
	margin: 5px 5px 0px 5px;
}

#cimg {
	padding: 10px 10px 0px 10px;
}

#cimg>div {
	text-align: right;
}

#fimg {
	width: 200px;
}
.name{
	font-weight: bold;
	font-size: 1.3rem;
}
.day{
	font-size: 0.8rem;
	color: gray !important;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div id="box">
		<%@ include file="/WEB-INF/views/include/mypage-header.jsp"%>
		<section class="container">
		<div id="pageTitle">찜</div>
				<div id="cardbox">
			<c:forEach items="${wlist }" var="dto">
					<div id="card">
						<div id="cimg">
							<img id="fimg" src="${dto.lunchpic }">
							<div id="heart">
								<img src="/dndn/resources/img/mypage/heart.png" id="himg" onclick="hate('${dto.wishlistseq}','${dto.sellboardseq }');">
							</div>
						</div>
						<div class="name">${dto.lunchname }</div>
						<div class="day">${dto.regdate.substring(0,10) }</div>
					</div>
			</c:forEach>
				</div>
		</section>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script>
	
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	var num = '0';
	
		function hate(wishlistseq,wishsellboardseq){
			
			let temp = event.target;

			if($(event.target).attr("src")=='/dndn/resources/img/mypage/heart.png'){
				num='1';
			console.log(num);
				$.ajax({
					url: '/dndn/mypage/fav/'+wishlistseq+'/'+wishsellboardseq+'/'+num,
					type : 'post',
		            contentType : 'application/json; charset=utf-8',
		            dataType : 'json',
		            
		            data : JSON.stringify({
		            		'wishlistseq': wishlistseq,
		            		'wishsellboardseq': wishsellboardseq
		            		}),
		            beforeSend: function(xhr){
		                xhr.setRequestHeader(header, token);
		            },
		            success : function (result) {
		                console.log('hi');
		                $(temp).attr("src","/dndn/resources/img/mypage/blackheart.png")
		            },
		            error: function(a,b,c){
						console.log(a,b,c); 
					}
				})
			}else{
			num='0';
			console.log(num);
			$.ajax({
				url: '/dndn/mypage/fav/'+wishlistseq+'/'+wishsellboardseq+'/'+num,
				type : 'post',
	            contentType : 'application/json; charset=utf-8',
	            dataType : 'json',
	            
	            data : JSON.stringify({
            		'wishlistseq': wishlistseq,
            		'wishsellboardseq': wishsellboardseq
            		}),
	            beforeSend: function(xhr){
	                xhr.setRequestHeader(header, token);
	            },
	            success : function (result) {
	                console.log(result);
	                $(temp).attr("src","/dndn/resources/img/mypage/heart.png")
	            },
	            error: function(a,b,c){
					console.log(a,b,c); 
				}
			})
				
			}
			
		};
		
		
		
	</script>
</body>
</html>














