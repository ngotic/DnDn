<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<head>

    <title>든든</title>
 <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
	<link rel="stylesheet" href="/dndn/resources/css/order.css">
	<!--  -->
    <%@ include file="/WEB-INF/views/include/asset.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
	<link href="/dndn/resources/startbootstrap-sb-admin-gh-pages/css/styles.css" rel="stylesheet" />
	<!-- <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script> -->
	
    <!-- Favicon -->
    <link href="/dndn/resources/bootstrap-admin-template-free/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/dndn/resources/bootstrap-admin-template-free/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/dndn/resources/bootstrap-admin-template-free/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/dndn/resources/bootstrap-admin-template-free/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link href="/dndn/resources/bootstrap-admin-template-free/css/style.css" rel="stylesheet">
    
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->
    

<style>

	.datatablesSimple tbody tr td:nth-child(3) input{
	width: 100%;
    height: 43px;
    border: 0px;
}
#coupon_form div label {
    text-align: left;
}
#coupon_form{
display: block;
    text-align: right;
}




</style>
</head>

<body><main>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
    
    <div class="container-fluid position-relative bg-white d-flex p-0">
        
        <!-- 사이드바 -->
        <%@ include file="/WEB-INF/views/order/admin-sidebar.jsp" %>



        <!-- Content Start -->
        <div class="content">
        

			<!-- nav -->
			<%@ include file="/WEB-INF/views/order/admin-nav.jsp" %>
			
			    <div style="padding: 50px 150px;">
			                 <c:set var="addBoolean" value="${not empty param.add}" />
	                            <c:set var="editBoolean" value="${not empty param.edit}" />
	                            <c:set var="deleteBoolean" value="${not empty param.delete}" />
		<c:if test="${ addBoolean}">
		<form method="GET"  action="./coupon-add.do">            
			</c:if>
			<c:if test="${editBoolean}">
		<!-- <form   action="./coupon-edit.do" id="coupon_edit_form">         -->    
			</c:if>
			<c:if test="${deleteBoolean }">
			
		<form  id = "coupon_form"method="GET"  action="./coupon-delete.do">            
			</c:if>

	                            <c:if test="${addBoolean}">  
		                                
		                                <div class="row mb-3">
		                                    <label for="inputEmail3" class="col-sm-2 col-form-label">쿠폰이름</label>
		                                    <div class="col-sm-10">
		                                        <input type="text" class="form-control" id="inputEmail3"  name ="name">
		                                    </div>
		                                </div>
		                                
		                                <div class="row mb-3">
		                                    <label for="inputPassword3" class="col-sm-2 col-form-label">할인 (%)</label>
		                                    <div class="col-sm-10">
		                                        <input type="number" class="form-control" id="inputPassword3" name ="sale">
		                                    </div>
		                                </div>
		                                
		                                <div class="row mb-3">
		                                    <label for="inputPassword3" class="col-sm-2 col-form-label">유효기간</label>
		                                    <div class="col-sm-10">
		                                        <input type="number" class="form-control" id="inputPassword3"  name ="period2">
		                                    </div>
		                                </div>
		                        
	                            </c:if>
	
	                            
                                <c:if test="${addBoolean }">
                                	
	                                <input type="hidden"  value="${addBoolean }" name = "add">
	                                <button type="submit" class="btn btn-primary">추가</button>
                                </c:if>
                                
                                
                            <!-- 수정페이지 아닐시 폼종료위치 -->
                            <c:if test="${!editBoolean}"> 
                            	</form>
                            </c:if>
                            
                            <table id="datatablesSimple"> 
					<thead>
						<tr>
							<th>쿠폰번호</th>
							<th>쿠폰이름</th>
							<th>할인율 (%)</th>
							<th>유효기간</th>
							 <c:if test="${editBoolean}">
							<th></th>
							</c:if>
							 <c:if test="${deleteBoolean}">
							<th></th>
							</c:if>
						</tr>
						</thead>
	<tbody>
				<c:forEach var="coupon"  items="${couponlist}" > 
			
						<tr class="coupon_edit_table_tr">
							<td><input type="hidden"  name = "couponseq" value=" ${coupon.couponseq}">  ${coupon.couponseq}</td>
							<td><input type= "text" name = "name" value="${coupon.name}" ></td>
							<td><input type= "number" name = "sale" value="${coupon.sale}"></td>
							<td class="coupon_period_value"  ><input type="hidden"  name = "period" value=" ${coupon.period}">${coupon.period}</td> 
							
							  <c:if test="${editBoolean}">
							  <input type="hidden"  name = "edit" value="true">
							<td><input type="button" value ="수정" class="coupon_edit_button"></td>
							</c:if>
							  <c:if test="${deleteBoolean}">
							   <input type="hidden"  name = "delete" value="true">
							<td><input type="button" value ="삭제" class="coupon_delete_button"></td>
							</c:if>
							
						</tr>		
			
					</c:forEach> 
					</tbody>				
					</table>
					<!-- 수정페이지시 폼종료위치 -->
					 <c:if test="${editBoolean}"> 
                        </form>
                     </c:if>          
              
                        </div>
                        </div>
                    </div>
               
</main>
					 	
					
					

        <!-- Content End -->


        <!-- Back to Top -->
        <!-- <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a> -->
    <!-- JavaScript Libraries -->
    
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/chart/chart.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/easing/easing.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/waypoints/waypoints.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/tempusdominus/js/moment.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="/dndn/resources/bootstrap-admin-template-free/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="/dndn/resources/bootstrap-admin-template-free/js/main.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="/dndn/resources/startbootstrap-sb-admin-gh-pages/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
	<script src="/dndn/resources/startbootstrap-sb-admin-gh-pages/js/datatables-simple-demo.js"></script>
    
    
</body>

<script>

setTimeout(function() {
$(document).ready(function() {
	  $('.coupon_edit_button').click(function() {
	    // Get the parent <tr> element
	    var parentRow = $(this).closest('tr');
	    
	    // Get the values of the child input elements
	    var couponseq = parentRow.find('input[name="couponseq"]').val();
	    var name = parentRow.find('input[name="name"]').val();
	    var sale = parentRow.find('input[name="sale"]').val();
	    var period = parentRow.find('input[name="period"]').val();
	    
	    // Construct the query parameters string
	    var queryParams = 'couponseq=' + encodeURIComponent(couponseq) +
	                      '&name=' + encodeURIComponent(name) +
	                      '&sale=' + encodeURIComponent(sale) +
	                      '&period=' + encodeURIComponent(period);
	    
	    // Append the query parameters to the URL
	    var url = './coupon-edit.do?' + queryParams+'&edit=true';
	    
	    // Redirect to the URL
	    window.location.href = url;
	  });
	});
},300);	


setTimeout(function() {
$(document).ready(function() {
	  $('.coupon_delete_button').click(function() {
	    // Get the parent <tr> element
	    var parentRow = $(this).closest('tr');
	    
	    // Get the values of the child input elements
	    var couponseq = parentRow.find('input[name="couponseq"]').val();
	 
	    
	    // Construct the query parameters string
	    var queryParams = 'couponseq=' + encodeURIComponent(couponseq)+'&delete=true'
	              
	    
	    // Append the query parameters to the URL
	    var url = './coupon-delete.do?' + queryParams;
	    
	    // Redirect to the URL
	    window.location.href = url;
	  });
	});
},300);	
setTimeout(function() {
	$("#datatablesSimple tbody tr td").css({
		
		"padding" : "0px"
	
	} );
}, 100);

setTimeout(function() {
	$("#datatablesSimple tbody tr td input").css({
		
		"width" : "100%",
    "height" : "43px",
    "border" : "0px"
	
	} );
}, 120);

setTimeout(function() {
	var todate_input = '"#datatablesSimple tbody tr td:nth-child(4) input"';
	$("#datatablesSimple tbody tr td:nth-child(4)").click( function(event){
		console.log("클릭이벤트");
		
		/* var couponinput = $("#datatablesSimple tbody tr td:nth-child(4) input").val(); */
		 /* var couponinput = $(this).val(); */
		var couponperiod = $(this).text().substring(0,	10);

		 console.log("Text = "+couponperiod); 
		console.log("Type = "+typeof(couponperiod));
		/* console.log("input = "+couponinput);  */
			if(couponperiod != ""){
 			$(this).html("<input class = todate type= date name = period value="+couponperiod+">");
			}
			
 			
			console.log(todate_input);
	
	setTimeout(function() {
	$("#datatablesSimple tbody tr td:nth-child(4) input").css({
		"width": "100%",
	    "height": "42px",
	    "border": "none"
	} );
	},10); 
	} );
/* 	var todate_input =  document.getElementsByClassName("todate");-
		$(document.getElementsByClassName("todate")).css({
			"width": "100%",
		    "height": "42px",
		    "border": "none"
		});
 */
	
}, 200/* ,{ once : true } */);


/* 
setTimeout(function(){
	
	 */ 
	 /* 
	 
	$(" .coupon_edit_button").click(function(){
		var tr = $(this).parent().parent();
		var list;var list2;

		console.log(tr);

		console.log(tr[0].cells.length);
		console.log("---for 시작전---");
		console.log( tr.children('td'));
		console.log(tr.children('td').children("input"));
		var td_input = tr.children('td').children("input");
		var td = tr.children('td');
		var editList = Array();
		
		if(td_input.length == 6){
		for(let i = 0; i< td_input.length-2; i++){
		
			console.log("A");
			console.log(td_input[i].value);
			
			editList[i] = td_input[i].value;
		
			
		}
		}else if(td_input.length==5){
			for(let i = 0; i< td_input.length-1; i++){
			
			console.log(td_input[i].value);
			console.log(td[i].innerHTML);
			if(i == 3)
				editList[i] = td[i].innerHTML;
			else
			 editList[i] = td_input[i].value;
			
			
			
			}
		}
		console.log(editList);
		console.log("----for 끝----");
		
		location.href='http://localhost:8092/dndn/order/coupon-edit.do?list='+editList;
		
	});
	
},300); 
  */

/* setTimeout(function(){ */
	
	/* */
	
	/*
	$(" .coupon_delete_button").click(function(){
		var tr = $(this).parent().parent();
		var list;var list2;
		/* console.log($(this).parent().parent()); */
		/* console.log(tr); */
		/*  console.log($(this).innerHTML); */
		/*
		console.log(tr[0].cells.length);
		console.log("---for 시작전---");
		console.log( tr.children('td'));
		console.log(tr.children('td').children("input"));
		
		var td_input = tr.children('td').children("input");
		var td = tr.children('td');



			console.log(td_input[0].value);
			
			editList[i] = td_input[0].value;
		


		console.log("----for 끝----");
		
		location.href='http://localhost:8092/dndn/order/coupon-delete.do?list='+td_input[0].value;
		
	});
	
},300);
  */
  
/* 
setTimeout(function(){
	$(".coupon_add_button").click(function(){
		
			
		
		}
	}
	 */
	 /* .coupon_add_button */
/* 	 
	$(".testbtn2").click( function(event){
		console.log("클릭이벤트");
		var date_td = '"#datatablesSimple tbody"';	
		
		/* document.querySelector('#datatablesSimple tbody').innerHTML = '<tr class="coupon_edit_table_tr"><td><input type="hidden" name="couponseq" value=""></td><td><input type="text" name="name" value=""></td><td><input type="number" name="sale" value=""></td><td class="coupon_period_value"></td><td><input type="button" value="수정" class="coupon_edit_button"></td><td><input type="button" value="삭제" class="coupon_delete_button"></td></tr>'; */
	
	/* 	
		$('#datatablesSimple tbody:first').append('<tr class="coupon_edit_table_tr"><td><input type="hidden" name="couponseq" value=""></td><td><input type="text" name="name" value=""></td><td><input type="number" name="sale" value=""></td><td class="coupon_period_value"></td><td><input type="button" value="수정" class="coupon_edit_button"></td><td><input type="button" value="삭제" class="coupon_delete_button"></td></tr>');
		/* <input class = todate type= date name = period value="+couponperiod+"> */
 		/* $(this).html("<input class = todate type= date name = period value="+couponperiod+">"); */
 			
 	/*		
 			setTimeout(function() {
 				$("#datatablesSimple tbody:first").css({
 					
 					"width" : "100%",
 			    "height" : "43px",
 			    "border" : "0px"
 				
 				} );
 			}, 120);
 *//* 
	 setTimeout(function(){	 
	 $(document).ready(function() {
		  // Button click event handler
		  $(".testbtn2").click(function() {
		    // Create a new row HTML string
		    var newRow = '<tr class="coupon_edit_table_tr">' +
		      '<td><input type="hidden" name="couponseq" value=""></td>' +
		      '<td><input type="text" name="name" value=""></td>' +
		      '<td><input type="number" name="sale" value=""></td>' +
		      '<td class="coupon_period_value"></td>' +
		      '<td><input type="button" value="수정" class="coupon_edit_button"></td>' +
		      '<td><input type="button" value="삭제" class="coupon_delete_button"></td>' +
		      '</tr>';

		    // Append the new row to the table body
		    $("#datatablesSimple tbody").append(newRow);
		  });
		});
	 });
 */
/* 
$("#testbtn").click(function(){
	 var coupon_update_list = []; 	
	var table = document.getElementById("datatablesSimple");
	var table_row = table.rows;

	console.log(table);

	
	for (var i = 1; i < table_row.length; i++) {
		
		var row = table.cells;
		var row_row = row.rows;
		
		
		var row_count = row.childElementCount;
		console.log(row);
		for(var j =0; j < row.length; j++){
			
			var row_ch_value = row_ch.cells[j].innerHTML;	
			
		}
		
		 console.log(row_row);
	console.log(row_ch);
		
	}
	 */
	
	
/* 
	$('#datatablesSimple tbody tr').each((index,item) =>{
		
			coupon_update_list.push(item.value);
		
	});
	console.log(coupon_update_list);
	
	$.ajax({
	
		 url: '/order/coupon_edit.do',
		    method: 'POST',
		    data: {
		        couponseq: $('input[name="couponseq"]').val(),
		        name: $('input[name="name"]').val(),
		        sale: $('input[name="sale"]').val(),
		        period:$('input[name="period"]').val(),
		
		    },
		    success: (result) => {
		        console.log(result);
		    }
		
	});
	 */
	
	/* 
	<c:forEach var="coupon"  items="${couponList}" > 
				 
						<tr class="coupon_edit_table_tr">
							<td><input type="hidden"  name = "couponseq" value=" ${coupon.couponseq}">  ${coupon.couponseq}</td>
							<td><input type= "text" name = "name" value="${coupon.name}" ></td>
							<td><input type= "number" name = "sale" value="${coupon.sale}"></td>
							<td class="coupon_period_value" >${coupon.period}</td> 
							 <td><input class = "todate" type= "date" name = "period" value="${coupon.period}"></td> 
						</tr>							
	
	</c:forEach> 

});
 */
 
 
	
 </script>			


</html>