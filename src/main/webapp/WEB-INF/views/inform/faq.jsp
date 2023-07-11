<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link rel="stylesheet" href="/dndn/resources/css/notice_ahyun.css">
<style>
.board-pagination {
      margin-top: 20px;
      text-align: center;
    }

    .board-pagination .pagination-table {
      display: inline-block;
      margin-top: 5px;
    }

    .board-pagination .pagination-table td {
      padding: 5px 10px;
      background-color: #f5f5f5;
      color: #333;
      cursor: pointer;
      transition: background-color 0.2s ease-in-out;
      font-size: 16px;
      border-radius: 3px;
    }

    .board-pagination .pagination-table td.active {
      background-color: #333;
      color: #fff;
    }
    

    
 
    .add-side {
       float:left;
       margin-top: 40px;
       margin-bottom: 30px;
       margin-left: 10px;
    }
    
    .add-btn {
       font-size: 12px;
       background-color: #F27C2A;
       color: white;
       
       transition: all 0.1s linear;
    }
    
    .add-btn:hover {
    
        font-size: 12px;
       background-color: #F27C2A;
       color: white;
       
       transform: scale(1.1);
       
    }
    
    .pagination-container {
  margin: 50px auto;
  text-align: center;
}
.pagination {
  position: relative;
}
.pagination td {
  position: relative;
  display: inline-block;
  color: #2c3e50;
  text-decoration: none;
  font-size: 1rem;
  padding: 8px 16px 10px;
}
.pagination td:before {
  z-index: -1;
  position: absolute;
  height: 100%;
  width: 100%;
  content: "";
  top: 0;
  left: 0;
  background-color: #F27C2A;
  border-radius: 24px;
  transform: scale(0);
  transition: all 0.2s;
}
/* 
.pagination tr:nth-child(n):hover, {
.pagination tr:nth-child(n) .pagination-active {
  color: #fff;
}
 */
.pagination td:hover,
.pagination td .pagination-active {
  color: #fff;
}
.pagination td:hover:before,
.pagination td .pagination-active:before {
  transform: scale(1);
}
.pagination .pagination-active {
  color: #fff;
}
.pagination .pagination-active:before {
  transform: scale(1);
}
.pagination-newer {
  margin-right: 50px;
}
.pagination-older {
  margin-left: 50px;
}

.page-side {
	display:flex;
	justify-content: center;
	align-items:center;
}


a {
	
	text-decoration:none;
	color: #333;

}

.main-list {
	
	background-color: #eee;

}

.main-list notice-title{
	
	color: tomato;
	
}








 	.notice-under {

 	}
 	
 	.row {

 	}
 	
 
 	.add-side {
 /* 		float:right; */

    	margin-left: 10px;
 	}
 	
 	.add-btn {
 		font-size: 12px;
 		background-color: #F27C2A;
 		color: white;
 		
 		transition: all 0.1s linear;
 	}
 	
 	.add-btn:hover {
 	
 	 	font-size: 12px;
 		background-color: #F27C2A;
 		color: white;
 		
 		transform: scale(1.1);
 		
 	}

 	
 	
 	.suggest-table {
		width: 800px;
 		font-size: 11pt;
 		text-align: center;
 		margin-left: -10px;
 		
 	}
 	
 	.suggest-table td, .suggest-table tr, .suggest-table th{
 		
 		padding: 5px;
 		padding-top: 10px;
 		padding-bottom: 10px;
 	
 	}
 	

 	
 	.suggest-table thead {
 		
 		border-top: 1px solid gray;
 		border-bottom: 1px solid gray;
 	
 	}
 	
 	.suggest-title {
 		
 		text-align: left;
 		
 	}

 	.suggest-title a {
 		
 		padding: 5px;
 		text-decoration: none;
 		color: #777;
 		
 	}
 	
 	.row {
 		font-family: 'Pretendard';
		font-weight: 500;
 	
 	
 		margin-top: 40px;
 		text-align: center;
 		align-items:center;
 		color: #333;
 		font-size: 13pt;
 		border-top: 1px solid #333;
 		border-bottom: 1px solid #333;

 		
 	}
 	
 	
 	.suggest-tab {
 	 	padding-top: 10px;
 		padding-bottom: 10px;

 	}
 	
 	
 	.th-bold {
		font-size: 13pt;
		font-family: 'Pretendard';
		font-weight: 700;
		color: #333;
	}
 	
 	
 	
 	.suggest-tab:hover {
 		
 		background-color: #F8F8F8;
 		color: #F27C2A;
 		cursor: pointer;
 		
 	
 	}

	.search-bar {
		margin-top: 0px;
		margin-bottom: 0px;
	}







	.faq-tr {
		background-color: #F8F8F8;
	}
	
	.faq-question {
		float:left;
		padding-left: 20px;
	}
	
	.faq-answer {
		clear:both;
	}

	.faq-answer  {
		
		dislplay:flex;
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
        			<div class="notice-header">
				<span class="bold">1:1문의</span>
			</div>
			
		<div class="notice-under">
			<div style="display:flex; justify-content: space-between">
	            <div class="add-side">
	               <input type="button" class="btn add-btn" value="글쓰기" onclick="location.href='/dndn/inform/notice_add.do';">
	            </div>
            
		          <div class="board-search search-bar">
		               <input type="text" id="search-input" class="form-control form-control-sm" placeholder="검색어를 입력하세요">
		          	   <button id="search-button" class="search-btn btn btn-sm" style="margin-left: 10px;">검색</button>
		          </div>
	        </div>
	          
	        <div class="row">
				<div class="col-md-3 suggest-tab">상품</div>
				<div class="col-md-3 suggest-tab">배송</div>
				<div class="col-md-3 suggest-tab">취소</div>
				<div class="col-md-3 suggest-tab">기타</div>
			</div>
	          
         </div>
			
			
			
			
			

			
			
			<div class="notice-side">
			
				<table class="suggest-table">
					<colgroup>
	                    <col width="10%">
	                    <col width="10%">
	                    <col width="80%">
	                </colgroup>
					<thead>
		                <tr>
		                    <th scope="col">번호</th>
		                    <th scope="col">분류</th>
		                    <th scope="col">내용</th>
		                </tr>
	                </thead>
					<tbody>
					
						<%-- <c:forEach items="${faqlist }" var="dto"> --%>
						<tr>
							<td>200</td>
							<td>배송</td>
							<td class="suggest-title">
								<a href="">Q. 언제 보내주나요</a>
							</td>
						</tr>
						<tr class="faq-tr">
					        <td colspan="3" class="faq-td">
					            <div class="faq-question">
					                <p></p><p>Q. 정기배송은 매일 제품을 받아볼 수 있는 건가요?&nbsp;</p><p></p>
					            </div>
					            <div class="faq-answer">
					            	<div>
					                	<span class="icon_qan a" style="width: 5%;">A.</span>
					                </div>
					                <div style="width: 95%;">
					                	<p></p><p>포켓샐러드 정기배송은 일주일에 한 번 배송하고 있습니다.(매일 배송X)&nbsp;</p><p>일주일 치 식단을 한 번에 보내드려요.</p><p>(4주 정기배송 샐러드 주 5일 상품 구매 시 1회 배송 5팩씩, 총 4회 수령)</p><p>&nbsp;</p><p></p>
					                </div>
					            </div>
					        </td>
					    </tr>
					    <%-- </c:forEach> --%>
					    
						<tr>
							<td>200</td>
							<td>배송</td>
							<td class="suggest-title">
								<a href="">언제 보내주나요</a>
							</td>
						</tr>
						<tr>
							<td>200</td>
							<td>배송</td>
							<td class="suggest-title">
								<a href="">언제 보내주나요</a>
							</td>
						</tr>
						<tr>
							<td>200</td>
							<td>배송</td>
							<td class="suggest-title">
								<a href="">언제 보내주나요</a>
							</td>
						</tr>
						
					</tbody>
				</table>
				
			<div class="add-side">
				<input type="button" class="btn add-btn" value="글쓰기" onclick="location.href='/dndn/inform/add.do';">
			</div>
				
			</div>	
      
      </div>   <!-- mainbar -->
   </section>   
   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>    
<script>





</script>
</body>
</html>



