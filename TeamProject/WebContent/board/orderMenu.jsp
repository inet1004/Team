<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
div#orderContailer { background-color: yellowgreen;}
</style>	

<div id="orderContailer">
<!-- <c:if test="${member.id == admin}">  -->

	<div id="menu" class="menu" align="center">
	<h2>
		<ul>
			<br><p>
			<li>
				<a href="orderList.do">이벤트 리스트 보기</a> 
			</li> 
			<br><p>
			<li>
			 	<a href="orderInsert.do">이벤트 추가</a> 
			</li> 
			<br><p>
			<li>
			 	<a href="orderDelete.do">이벤트 삭제</a> 
			</li> 
			<br><p>
			<li>
			 	<a href="orderUpdate.do">이벤트 수정</a> 
			</li> 
			<br><p>
			<li>
			 	<a href="${pageContext.request.contextPath}/home.do">메인 화면</a> 
			</li> 
			<br><p>
			<li>
			 	<a href="logOut.do">로그아웃</a> 
			</li> 
			<br><p>
		</ul>
	</h2>
	</div>
<!-- </c:if>  -->

</div>
