<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eventBoard.jsp</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
	  $("#accor").accordion({
	  active:2, //창열릴떄 속도 //추가시 , 무저건 잊지말기
	  animate : 1 ,
	  collapsible : true,
	  activate: function( event, ui){
		//  console.log(ui,oldHeader.html()); //html함수
		//  console.log(ui,newHeader.html());
	  }
});
	  <div>
 <h3>게시글 목록</h3>
 <table border="1" >
 	<tr>
		<th width="100">검색순위</th>
 		<th width="300">사이트 명</th>
		<th width="300">링크주소(LinkSite)</th>
					
 	<tr><td align ="center">1th</td> <td align ="center">Youtube</td><td align="center"><button type="button" onclick="" >유투브영상 Click</button></td></tr>
 	<tr><td align ="center">2th</td> <td align ="center">Twichi</td><td align="center"><button type="button" onclick="" >트위치영상 Click</button></td></tr>
 	<tr><td align ="center">3th</td> <td align ="center">InstarGram</td><td align="center"><button type="button" onclick="">인스타그램영상 Click</button></td></tr>
 	<tr><td align ="center">4th</td> <td align ="center">*</td><td align="center"><button type="button" onclick="" >* </button></td></tr>
 	<tr><td align ="center">5th</td> <td align ="center">*</td><td align="center"><button type="button" onclick="">*</button></td></tr>
 	<tr><td align ="center">6th</td> <td align ="center">*</td><td align="center"><button type="button" onclick="">*</button></td></tr>
 	
 	<body>
	<div id="modal" title=" 상세보기 " >
	광고 문구
	</div>
	<div id="accor">
		<h3>첫번쨰</h3>
		<div>첫번째 글</div>n
		<h3>두번째</h3>
		<div>두번쨰 글</div>
		<h3>세번째</h3>
		<div>세번째 글</div>
		<button type="button" id="btnOpenmodal">상세보기 </button>
		<p>
			Date: <input type="text" id="datepicker">
		</p>

	</div>

</div>
 	</body>
</table>
</head>
</html>