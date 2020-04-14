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
<h3>사원목록</h3>
<div>
검색조건<br>
<form name="searchFrm">
	부서 <input type="text" name="department_id" value="${param.department_id }"><br>
	이름 <input type="text" name="first_name" value="${param.first_name }"><br>
	<input type="hidden" name="page" value="1">
	<button>검색</button>
</form>
<c:forEach items="${list}" var="emp">
	${emp.employee_id}  ${emp.first_name} ${emp.department_id}<br>
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