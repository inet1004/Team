<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my"  tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>이벤트 Order List</h3> 
<div>
검색조건<br>
<form name="searchFrm">
	주문 ID <input type="text" name="orderId" value="${param.orderId }"><br>
	회원 ID <input type="text" name="id" value="${param.id }"><br>
	<input type="hidden" name="page" value="1">
	<button>검색</button>
</form>
<c:forEach items="${list}" var="order">
	${order.orderId}  ${emp.first_name} ${order.id}<br>
</c:forEach>
<my:paging paging="${paging}" jsfunc="gopage"></my:paging>
<script>
	function gopage(p) {
		searchFrm.page.value = p;
		searchFrm.submit();
	}
</script>
</div>
</body>
</html> 