<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>

</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

    <center>
    <h1>쇼핑몰</h1>
    </center>
 <div class="bd-example">
  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="4"></li>   
    </ol>
    
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="../resources/img/img1.png" class="d-block w-100" width="100px" height="350px" alt="그림1">
        <div class="carousel-caption d-none d-md-block">
          <h5>First slide label</h5>
        </div>
      </div>
      
      <div class="carousel-item">
        <img src="../resources/img/img2.png" class="d-block w-100" width="100px" height="350px" alt="그림2">
        <div class="carousel-caption d-none d-md-block">
          <h5>Second slide label</h5>
        </div>
      </div>
      
      <div class="carousel-item">
        <img src="../resources/img/img3.png" class="d-block w-100" width="100px" height="350px" alt="그림3">
        <div class="carousel-caption d-none d-md-block">
          <h5>Third slide label</h5>
        </div>
      </div>
      
       <div class="carousel-item">
        <img src="../resources/img/img4.png" class="d-block w-100" width="100px" height="350px" alt="그림4">
        <div class="carousel-caption d-none d-md-block">
          <h5>Four slide label</h5>
        </div>
      </div>
      
       <div class="carousel-item">
        <img src="../resources/img/img5.png" class="d-block w-100" width="100px" height="350px" alt="그림5">
        <div class="carousel-caption d-none d-md-block">
          <h5>Five slide label</h5>
        </div>
      </div>
      
    </div>
    
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
    
<br>
<br>

<c:forEach items="${list}" var = "list">
 <div class = "col mb-4">
<div class="card " style="width: 18rem;">
 <a href = "/item/read/${list.iId}">

 <div>
  <img src="/displayfile?filename=${list.filename}"class="card-img-top" alt="..." width="100px" height="200px">
  </div>
  </a>
  <div class="card-body">
    <p class="card-text">상품이름:${list.iName} </p>
    <p class="card-price">상품가격:${list.iPrice} </p>
  </div>
</div>
</div>

</c:forEach>



</body>
</html>