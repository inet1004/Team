<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

 <%--
 div.menu { align: center; }
 ul li a { display:yellowgreen; width:100%; padding:10px 0; }
 ul li a:hover { background:#f00; }
 --%>
 a { color: green; }
</style>
 
<title>이벤트 관리</title>
</head>
<body>

<!-- <c:if test="${member.id == admin}">  -->

	<div id="menu" class="menu" align="center">
		<ul>
			<li>
				<a href="orderList.do">이벤트 리스트 보기</a> 
			</li> 
			<li>
			 	<a href="orderInsert.do">이벤트 추가</a> 
			</li> 
			<li>
			 	<a href="orderDelete.do">이벤트 삭제</a> 
			</li> 
			<li>
			 	<a href="orderUpdate.do">이벤트 수정</a> 
			</li> 
			<li>
			 	<a href="main.do">메인 화면</a> 
			</li> 
			<li>
			 	<a href="logOut.do">로그아웃</a> 
			</li> 
		</ul>
	</div>
</c:if>

</body>
</html>