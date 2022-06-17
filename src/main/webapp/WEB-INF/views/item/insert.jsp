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
<style type="text/css">
#uploadFile{
	width : 100%;
	height : 250px;
	border: 1px solid red;
}


</style>	

</head>



<body>
<h1>상품등록</h1>
<form action="" method="post">
<%-- <input type="hidden" name="id" value="${mDto.id}">
판매자 : <input value = "${login.id}" name = "id" readonly="readonly"><br> --%>
상품 아이디 : <input id = "iId" name = "iId"><br>
상품 이름 : <input id ="iName" name = "iName"><br>
상품 가격 : <input id = "iPrice" name = "iPrice"><br>
상품 할인율 : <input id = "iDc" name = "iDc"><br>
상품 수량 : <input id = "iCount" name = "iCount"><br>
</form>

<input id = "item_btn_submit" type="submit", value = "상품 등록">

<div class ="form-group">
<div id = "uploadFile" class ="form-control text-center"></div>
	</div>
<div id = "uploadedItems" class ="row row-cols-3">

</div>	
<script type="text/javascript" src ="/resources/js/tl.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	   let formData = new FormData();
	   let idx = 0;
	   $("#uploadFile").on("dragenter dragover", function(event) {
	      event.preventDefault();
	   });
	   
	   $("#uploadFile").on("drop", function(event) {
	      event.preventDefault();
	      let files = event.originalEvent.dataTransfer.files;
	      let file = files[0];
	      
	      formData.append("file"+idx,file);
	      
	      let reader = new FileReader();
	      
	      reader.readAsDataURL(file);
	      
	      reader.onload = function(event) {
	         
	         let str = test(event.target.result, file["name"],"file"+idx++);
	         
	         $("#uploadedItems").append(str);
	         
	      }
	   
	      
	   });
	   $("#uploadedItems").on("click",".btn_del_item", function() {
	      let filekey = $(this).attr("data-filekey");
	      formData.delete(filekey);
	      $(this).parent().parent().parent().remove();
	   })   
	   
	   $("#item_btn_submit").click(function() {
	      let iId = $("#iId").val();
	      let iName = $("#iName").val();
	      let iPrice = $("#iPrice").val();
	      let iDc = $("#iDc").val();
	      let iCount = $("#iCount").val();
	      
	      formData.append("iId", iId);
	      formData.append("iName", iName);
	      formData.append("iPrice", iPrice);
	      formData.append("iDc", iDc);
	      formData.append("iCount", iCount);
	      
	      $.ajax({
	         
	         type : "post",
	         url : "/item/insert",
	         data : formData,
	         processData : false,
	         contentType : false,
	         dataType : "text",
	         success : function(result) {
	            if(result == "SUCCESS"){
	               location.assign("/item/list");
	            }
	         
	         }
	         
	      })
	   })
	   
	   
	})

</script>
</body>
</html>