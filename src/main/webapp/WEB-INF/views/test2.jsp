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
<div>
<a href="/displayfile?filename=${uploadFilename}">
<img alt="업로드한 파일의 썸네일" src="">
</a>
<p>업로드한 파일의 원래 이름</p>
<button>삭제</button>
</div>

<script type="text/javascript">
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
		
		
		
		
		if(isImg(uploadFilename)) {
			$("img").attr("src", "/displayfile?filename="+uploadFilename);
		}else {
			$("img").attr("src", "/resources/img/일반파일.png");
		}
		
		function getOrgName(filename) {
			
			let orgName = "";
			let idx = -1;
			
			if(isImg(filename)) {
			 	idx = filename.indexOf("_", 14) + 1;
				
			}else{
				idx = filename.indexOf("_") + 1;
			}
			orgName = filename.substring(idx);
			
			return orgName;
		}
		
		if(isImg(uploadFilename)) {
			let oriName = getImgFilePath(uploadFilename);
			alert(oriName);
			$("a").attr("href", "/displayfile?filename="+oriName);
		}
		
		$("p").text(getOrgName(uploadFilename));
		
		function getImgFilePath(filename) {
			let prefix = filename.substring(0, 12);
			let suffix = filename.substring(14);
			return prefix + suffix;
		}
		
		function isImg(filename) {
			let idx = filename.lastIndexOf(".") + 1;
			let formatName = filename.substring(idx).toLowerCase();
			if(formatName == "png" || formatName == "gif" || formatName == "jpg" || formatName =="jpeg") {
				return true;		
			}
		}
	});
	
	

</script>
</body>
</html>