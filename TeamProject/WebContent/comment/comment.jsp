<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>comment</title>
 <script>
 function writeCmt()
 {
     var form = document.getElementById("writeCommentForm");
     
     var board = form.comment_board.value
     var id = form.comment_id.value
     var content = form.comment_content.value;
     
     if(!content)
     {
         alert("내용을 입력하세요.");
         return false;
     }
     else
     {    
         var param="comment_board="+board+"&comment_id="+id+"&comment_content="+content;
             
         httpRequest = getXMLHttpRequest();
         httpRequest.onreadystatechange = checkFunc;
         httpRequest.open("POST", "", true);    
         httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=EUC-KR'); 
         httpRequest.send(param);
     }
 }
 
 function checkFunc(){
     if(httpRequest.readyState == 4){
         // 결과값을 가져온다.
         var resultText = httpRequest.responseText;
         if(resultText == 1){ 
             document.location.reload(); // 상세보기 창 새로고침
         }
     }
 }

 </script>
</head>
<body>
<form method="post" id="comment" action="">
<div>
   게시글
</div>
<div>
<label></label><textarea rows="4" cols="70"></textarea>
</div>

<!-- 댓글 등록 버튼 -->
<div id="btn">
 <button type="button" onclick="writeCmt()">등록</button>
 
</div>
</form>
</body>
</html>