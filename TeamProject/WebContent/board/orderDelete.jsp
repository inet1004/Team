
<%@page import="co.team404.order.dao.OrderVo"%>
<%@page import="co.team404.order.dao.OrderDao"%>
<%@page import="jdk.nashorn.internal.ir.TryNode"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>

<div align="center"> 
<body><h3>이벤트 삭제</h3></body>
	
		<%--추가 --%>
		<%
		Date nowTime = new Date();
		SimpleDateFormat cf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
		%>
		<%--현재 날짜와 시간은 <%= nowTime %>, <%= sf.format(nowTime) %> 입니다.--%>
			
		조회 일시 : <%= cf.format(nowTime) %>
 
<%
		OrderDao dao = new OrderDao();
		OrderVo vo = new OrderVo();

		ArrayList<OrderVo> list = new ArrayList<OrderVo>();

		String view = null; 
		
		list = dao.select();
	
//for (OrderVo dto : list) {
//	System.out.print(dto.getOrderId() + " ");
//	System.out.print(dto.getWriteDate() + " ");
//	System.out.print(dto.getRequestDate() + " ");
//	System.out.print(dto.getRequestPlace() + " ");
//	System.out.print(dto.getPlaceAddress() + " ");
//	System.out.print(dto.getDress() + " ");
//	System.out.print(dto.getGoods() + " ");
//	System.out.print(dto.getMc() + " ");
//	System.out.print(dto.getTotalPrice() + " ");
//	System.out.println(dto.getId() + " ");
//	}
	 %>
	 
	 
<table border="1">

<tr>
<th>예약ID</th><th>회원ID</th><th>신청일</th><th>이벤트일</th><th>이벤트장소</th><th>이벤트주소</th><th>신청의상</th><th>신청소품</th><th>사회자</th><th>총액</th>
</tr>

<%
for ( OrderVo dto : list ) {
%>

<tr>
<td><%= dto.getOrderId() %></td><td><%= dto.getId() %> </td><td><%= dto.getWriteDate() %> </td><td><%= dto.getRequestDate() %> </td><td><%= dto.getRequestPlace() %> </td><td><%= dto.getPlaceAddress() %> </td>
<td><%= dto.getDress() %> </td><td><%= dto.getGoods() %> </td><td><%= dto.getMc() %> </td><td><%= dto.getTotalPrice() %> </td>
</tr>

<% } %>

</table>

        </tbody>
    </table>
</div>
