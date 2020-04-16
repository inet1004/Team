<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
div#orderContailer { background-color: yellowgreen;}
</style>	

<div id="orderContailer">
<!-- <c:if test="${member.id == admin}">  -->

	<div id="menu" class="menu" align="center">

<%
	//String id=request.getParameter("id");
	//String pwd=request.getParameter("pwd");
	// request스코프에 값 저장하기.
	//request.setAttribute("id", id);
	//request.setAttribute("pwd", pwd);

	//포워드방식으로 페이지 이동하기.
	pageContext.forward("/Team404/orderList.do");

	//redirect방식
	//response.sendRedirect("result.jsp");
%>

	</div>
<!-- </c:if>  -->

</div>
