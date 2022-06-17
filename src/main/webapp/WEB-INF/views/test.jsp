<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
</head>
<body>

<div id="uploadedItems">
   
</div>

<script type="text/javascript" src="/resources/js/tl.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
	}
		$("#uploadedItems").on("click", ".btn_del_item", function() {
		    let filename = $(this).attr("data-filename");
		    
		    let $btn = $(this);
		    
		    $.ajax({
		       type : "post",
		       url : "/deletefile",
		       data : {
		          "uploadedFilename" : filename
		       },
		       dataType : "text",
		       success : function(result) {
		          // 버튼의 부모태그인 div 태그를 삭제했음.
		          // 업로드한 파일은 삭제되지 않았음.
		          if(result == "SUCCESS"){
		             $btn.parent().remove();
		          }else{
		             alert("삭제 실패");
		          }
		       }
		    });
 });


   $(document).ready(function() {
     let filenameList = "${filenameList}";
     
     filenameList = filenameList.substring(1, filenameList.length -1);
     
     let arr = filenameList.split(",");
     
     
     for(let i =0; i<arr.length; i++){
        let filename = arr[i].trim();
        
        let imgSrc = '';
        if(isImg(filename)){
           imgSrc = "/displayfile?filename="+filename;
        }else{
           imgSrc = "/resources/img/일반파일.png";
        }
        
        let aHref = '';
        if(isImg(filename)){
           aHref = "/displayfile?filename=" + getImgFilePath(filename);
        }else{
           aHref = "/displayfile?filename="+filename;
        }
        
        let pText = getOrgName(filename);
        let btnDataFilename = filename;
        
        let str = makeUploadItemTag(imgSrc, aHref, pText, btnDataFilename);
        $("#uploadedItems").append(str);
     }
   });
   
   

</script>
</body>
</html>