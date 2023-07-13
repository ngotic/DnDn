<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/asset.jsp" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
    
    .notice-under {

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
	display:flex;
	justify-content: center;

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


.pagination td:hover,
 .pagination-active {
  color: #fff;
}
 
 
.pagination td .pagination-active {
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
	
	background-color: #F6F6F6;

}

.main-list notice-title{
	
	color: tomato;
	
}

	.footer-area {
		transform: translateY(50%);
	}
    


</style>
</head>
<body>
   <!-- template.jsp -->
   <%@ include file="/WEB-INF/views/include/header.jsp" %>
   <section class="container">
      <fieldset>
      <%@ include file="/WEB-INF/views/inform/inform_sidebar.jsp" %>
      <div class="mainbar">
         <div class="notice-header">
            <span class="bold">공지사항</span>
         </div>
         <div class="notice-under">
            <div style="display: flex; justify-content: space-between">
					<div class="add-side">
						<input type="button" class="btn add-btn" value="글쓰기"
							onclick="location.href='/dndn/inform/notice_add.do';">
					</div>

					<div class="board-search search-bar">
						<input type="text" id="search-input"
							class="form-control form-control-sm" placeholder="검색어를 입력하세요">
						<button id="search-button" class="search-btn btn btn-sm"
							style="margin-left: 10px;">검색</button>
					</div>
				</div>
        
         <div class="notice-side">
            <table class="notice-table" id="board-posts" style="width:100%;">

            	
            </table>
         </div> 
         
<!--           
         <div class="board-pagination">
            <table class="pagination-table">
                 <tr>
                 <td class="arrow previous-arrow" id="previous">&lt;</td>
                   <td id="page-numbers"></td>
                   <td class="arrow next-arrow" id="next">&gt;</td>
                 </tr>
               </table>
         </div>
       -->
          
         <div class="pagination-container">
            <table class="pagination">
                 <tr>
                 	<td class="pagination-active .pagination-newer" id="previous">&lt;</td>
                   <td id="page-numbers"></td>
                   <td class="pagination-active pagination-older" id="next">&gt;</td>
                 </tr>
               </table>
         </div>
      
      </div>   <!-- mainbar -->
     </fieldset>
   </section>   
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>    
<script>
var noticelist = [
    // noticelist 배열에 데이터를 추가해주세요
    <c:forEach items="${noticelist}" var="dto" varStatus="status">
      {
    	rnum: '${dto.rnum}',
        noticeseq: '${dto.noticeseq}',
        title: '${dto.title}',
        regdate: '${dto.regdate}',
        id: '${dto.id}',
        views: '${dto.views}'
      }${!status.last ? ',' : ''}
    </c:forEach>
  ];



var originalNoticelist = noticelist.slice();
var itemsPerPage = 10;
var totalPages = Math.ceil(noticelist.length / itemsPerPage);
var currentPage = 1;

function renderPosts() {
  var startIndex = (currentPage - 1) * itemsPerPage;
  var endIndex = startIndex + itemsPerPage;

  var searchInput = document.getElementById('search-input');
  var searchQuery = searchInput.value.toLowerCase();

  var filteredNoticelist = originalNoticelist.filter(function (item) {
    return item.title.toLowerCase().includes(searchQuery);
  });

  totalPages = Math.ceil(filteredNoticelist.length / itemsPerPage);

  var boardPosts = document.getElementById('board-posts');
  boardPosts.innerHTML = `
    <tr class="table-head">
      <th class="th-bold" style="width:10%;">번호</th>
      <th class="th-bold" style="width:50%;">제목</th>
      <th class="th-bold" style="width:15%;">날짜</th>
      <th class="th-bold" style="width:15%;">작성자</th>
      <th class="th-bold" style="width:10%;">조회수</th>
    </tr>
   	<c:forEach items="${mainlist}" var="dto">
    <tr class="main-list">
       <td><span class="material-symbols-outlined">
       priority_high
       </span></td>
       <td class="notice-title"><a href="/dndn/inform/view.do?noticeseq=${dto.noticeseq }">${dto.title} </a></td>
       <td>${dto.regdate} </td>
       <td>${dto.id} </td>
       <td>${dto.views }</td>
    </tr>
    </c:forEach>
  `;

  
  for (var i = startIndex; i < endIndex; i++) {
    if (filteredNoticelist[i]) {
      var tr = document.createElement('tr');
      tr.className = 'boards';

      var td1 = document.createElement('td');
      td1.textContent = filteredNoticelist[i].rnum;
      tr.appendChild(td1);

      var td2 = document.createElement('td');
      var link = document.createElement('a');
      link.href = '/dndn/inform/view.do?noticeseq=' + filteredNoticelist[i].noticeseq;
      link.textContent = filteredNoticelist[i].title;
      td2.appendChild(link);
      td2.classList.add('notice-title');
      tr.appendChild(td2);

      var td3 = document.createElement('td');
      td3.textContent = filteredNoticelist[i].regdate;
      tr.appendChild(td3);

      var td4 = document.createElement('td');
      td4.textContent = filteredNoticelist[i].id;
      tr.appendChild(td4);

      var td5 = document.createElement('td');
      td5.textContent = filteredNoticelist[i].views;
      tr.appendChild(td5);

      boardPosts.appendChild(tr);
    }
  }
}


/*
function renderPagination() {
  var pageNumbers = document.getElementById('page-numbers');
  pageNumbers.innerHTML = '';

  for (var i = 1; i <= totalPages; i++) {
    var td = document.createElement('td');
    td.textContent = i;

    if (i === currentPage) {
      td.classList.add('pagination-active');
    }

    td.addEventListener('click', function () {
      currentPage = parseInt(this.textContent);
      renderPosts();
      renderPagination();
    });

    pageNumbers.appendChild(td);
  }
}
*/


/*
function renderPagination() {
	  var pageNumbers = document.getElementById('page-numbers');
	  pageNumbers.innerHTML = '';


	  for (var i = 1; i <= totalPages; i++) {
	    var td = document.createElement('td');
	    td.textContent = i;

	    if (i == currentPage) {
	      td.classList.add('pagination-active');
	    }
	    
	    
	    td.addEventListener('mouseover', function () {
	    		
		      currentPage = parseInt(this.textContent);

		      var tdList = document.querySelectorAll('.pagination td');
		      tdList.forEach(function (item) {
		        item.classList.remove('pagination-active');
		      });
		      this.classList.add('pagination-active');
	    });

	    td.addEventListener('click', function () {
	      currentPage = parseInt(this.textContent);
	      renderPosts();
	      renderPagination();

	      // 개별 td에 CSS 클래스 추가
	      var tdList = document.querySelectorAll('.pagination td');
	      tdList.forEach(function (item) {
	        item.classList.remove('pagination-active');
	      });
	      this.classList.add('pagination-active');
	    });

	    pageNumbers.appendChild(td);
	  }

	}
*/

/*
function renderPagination() {
	  var pageNumbers = document.getElementById('page-numbers');
	  pageNumbers.innerHTML = '';

	  for (var i = 1; i <= totalPages; i++) {
	    var td = document.createElement('td');
	    td.textContent = i;

	    if (i === currentPage) {
	      td.classList.add('pagination-active');
	    }

	    td.addEventListener('mouseover', function () {
	      var tdList = document.querySelectorAll('.pagination td');
	      tdList.forEach(function (item) {
	        item.classList.remove('pagination-active');
	      });
	      this.classList.add('pagination-active');
	    });

	    td.addEventListener('click', function () {
	      currentPage = parseInt(this.textContent);
	      renderPosts();
	      renderPagination();

	      var tdList = document.querySelectorAll('.pagination td');
	      tdList.forEach(function (item) {
	        item.classList.remove('pagination-active');
	      });
	      this.classList.add('pagination-active');
	    });

	    pageNumbers.appendChild(td);
	  }
	}
*/

function renderPagination() {
	  var pageNumbers = document.getElementById('page-numbers');
	  pageNumbers.innerHTML = '';

	  for (var i = 1; i <= totalPages; i++) {
	    var td = document.createElement('td');
	    td.textContent = i;

	    
	    
	    if (i === currentPage) {
	      td.classList.add('pagination-active');
	    }
	    

	    td.addEventListener('mouseover', function () {
	      var tdList = document.querySelectorAll('#page-numbers td');
	      tdList.forEach(function (item) {
	        item.classList.remove('pagination-active');
	      });
	      this.classList.add('pagination-active');
	    });

	    
	    td.addEventListener('click', function () {
	      currentPage = parseInt(this.textContent);
	      renderPosts();
	      renderPagination();

	      var tdList = document.querySelectorAll('page-numbers td');
	      tdList.forEach(function (item) {
	        item.classList.remove('pagination-active');
	      });
	      this.classList.add('pagination-active');
	    });

	    pageNumbers.appendChild(td);
	  }
	}









var searchButton = document.getElementById('search-button');
searchButton.addEventListener('click', function () {
  currentPage = 1;
  renderPosts();
  renderPagination();
});

var previousArrow = document.getElementById('previous');
previousArrow.addEventListener('click', function () {
  if (currentPage > 1) {
    currentPage--;
    renderPosts();
    renderPagination();
  }
});

var nextArrow = document.getElementById('next');
nextArrow.addEventListener('click', function () {
  if (currentPage < totalPages) {
    currentPage++;
    renderPosts();
    renderPagination();
  }
});

renderPosts();
renderPagination();




</script>
</body>
</html>



