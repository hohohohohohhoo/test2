<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax를 이용한 파일 업로드</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
<style type="text/css">
#uploadFile {
   width: 100%;
   height: 250px;
   border: 1px solid red;
}
</style>

</head>
<body>	

   <div id="uploadFile"></div>
   
   <div id="uploadedItems" class="row row-cols-1 row-cols-lg-3">

   </div>
   
   <script type="text/javascript" src="/resources/js/tl.js"></script>
   
   
   
      <script type="text/javascript">
      
      
      
      	$("#uploadedItems").on("click", ".btn_del_item", function() {
			let $delBtn = $(this);
			let filename = $(this).attr("data-filename");
			
			$.ajax({
				type : "post",
				url : "/deletefile",
				data : {
					"uploadedFilename" : filename
				},
				dataType : "text",
				success : function(result) {
					if(result == "SUCCESS") {
						$delBtn.parent().parent().parent().remove();
					}
				}
			});
		});
      
      
      
      
         $("#uploadFile").on("dragenter dragover", function(event) {
            event.preventDefault();
         })

         $("#uploadFile").on("drop", function(event) {
        	 event.preventDefault();
        	 let formData=new FormData(); // 폼태그의 역할 , form태그를 클래스로 구현한것이 FormData클래스임, ajax를 이용해서 파일 전송이 가능함.

            let files = event.originalEvent.dataTransfer.files; //드래그 드랍한 파일들의 데이터를 files에 넣겠다.
          
            for(let i=0; i<files.length; i++) {
            	let file = files[i];
            	formData.append("file",file); //file이라는 이름으로 파일을 넣어준다., append는 추가한다는 의미.
            }
           /*  let file = files[0]; // files에 들어간 배열중에 인덱스가 0번인 파일의 정보만 가져와서 file에 넣는다. */
            
            
           	
            
            
            $.ajax({
               type:'post',
               url:"/ajaxform",
               processData:false, // format가 url쪽에 쿼리스트링 형태로 넘어가서 false로 한다.
               contentType:false, // 파일을 보낼 수 있는 형태로 바뀐다.     
               data:formData,
               dataType:"text",
               success: function(filenameArr){
            	   
            	   filenameArr = filenameArr.substring(1, filenameArr.length-1);
            	   let arr = filenameArr.split(",");
            	   
            	   for(let i=0;i<arr.length;i++){
            		   let filename = arr[i].trim();
            		   let str = makeUploadItemTag2(filename);
            		   $("#uploadedItems").append(str);
            	   }
            	   
            	/* filename = filename.substring(1, filename.length-1).trim();
              	  
            	   let str = makeUploadItemTag2(filename);
            	   
            	   $("#uploadedItems").append(str); */
               }
               
            });
         });
      </script>

   

</body>
</html>