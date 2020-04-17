
<%@page import="co.team404.order.dao.OrderVo"%>
<%@page import="co.team404.order.dao.OrderDao"%>
<%@ page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
/* 전체박스 */
#wrap {
	width: 50%;
	heigth: 500px;
	margin: 0 auto;
}
</style>
<title>주문목록</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" align="center" id="wrap">
		<br />
		<br />
		<h1>주문 내역</h1>
		<br />

<%
	OrderDao dao = new OrderDao();
	OrderVo vo = new OrderVo();
	String view = null;
	String member_id =  (String)session.getAttribute("sessionID");
	vo = dao.selectOrder(member_id);
//	  request.setAttribute("vo", vo);
	%>
	<table class="table table-hover" border="1">

<tr>
<th>예약ID</th>
<th>회원ID</th>
<th>신청일</th>
<th>이벤트일</th>
<th>이벤트장소</th>
<th>이벤트주소</th>
<th>신청의상</th>
<th>신청소품</th>
<th>사회자</th>
<th>총액</th>
<th colspan="2">수정/삭제</th>
</tr>


<tr>
<td><%= vo.getOrderId() %></td>
<td><%= vo.getId() %> </td>
<td><%= vo.getWriteDate() %> </td>
<td><%= vo.getRequestDate() %> </td>
<td><%= vo.getRequestPlace() %> </td>
<td><%= vo.getPlaceAddress() %> </td>
<td><%= vo.getDress() %> </td>
<td><%= vo.getGoods() %> </td>
<td><%= vo.getMc() %> </td>
<td><%= vo.getTotalPrice() %> </td>
<td><input type="button" id="<%= vo.getOrderId() %>" onClick="location.href='/Team404/orderUpdate.do?orderId=<%= vo.getOrderId() %>'" value="수정"></td>
<td><input type="button" id="<%= vo.getOrderId() %>" onClick="location.href='/Team404/orderDelete?orderId=<%= vo.getOrderId() %>'" value="삭제"></td>
</tr>


</table>
 
	
	
	</div>

	
</body>
</html>