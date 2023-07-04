<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <%@ include file="/WEB-INF/views/include/asset.jsp" %>
  <style>

.btn-collection{
  text-align: center;
  margin-bottom: 50px;
}
.menubtn {
  background-color: #eee;
  border: #eee;
  margin: 0 10px 0 10px;
  border-radius: 10px;
  padding: 10px;
}
.menubtn.active{
  color:white;
  background-color: var(--main-font-color);
}
.menubtn:hover{
  color:white;
  background-color: var(--main-font-color);
}

  </style>
</head>
<body>
<!-- template.jsp -->
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<section class="container">

  <div class="btn-collection">
    <button class="menubtn active">일반식</button>
    <button class="menubtn">건강식</button>
    <button class="menubtn">프리미엄</button>
  </div>
  <hr>

</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
</script>
</body>
</html>














