
<%@page import="co.team404.order.dao.OrderVo"%>
<%@page import="co.team404.order.dao.OrderDao"%>
<%@page import="jdk.nashorn.internal.ir.TryNode"%>
<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
div#orderContailer { background-color: yellowgreen;}
tr.onMouseOver:hover { background-color: yellow; }
</style>		

<%
	//HttpSession session = request.getSession(false);
	String id = (String)session.getAttribute("sessionID");
	if(id==null){
	out.print("설정된 세션이 없습니다.<br>");
	}else{
	//out.print("id : "+ id +"<br>");
	}
%>


<div id="orderContailer" >
	<div align="center">
	<h2>이벤트 Order List</h2>
	
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


<script type="text/javascript">
function button_event($oid){
	if (confirm( "예약번호 "+ $oid +" 번을 정말 삭제하시겠습니까?" ) == true){    //확인 "정말 삭제하시겠습니까??"+
		
		var text1 = "/Team404/orderDelete?orderId=";
		var url = text1 + $oid;
		
		location.href = url;
	    document.form.submit();  
	}else{   //취소
	    e.preventDefault();;
	}
}
</script>


		<br><p>
    <h3>회원 정보</h3> 
    	 회원아이디:  <%=id %><br/>
    	<br><p>
    	
    	
<table border="1">
	<tr  bgcolor="#ff4000">
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

<%
for ( OrderVo dto : list ) {
%>

	<tr onmouseover="this.className='onMouseOver'" onmouseout="this.className='onMouseOut'">
		<td>${dto.getOrderId() }</td>
		<td><%=dto.getId() %> </td>
		<td><%= dto.getWriteDate() %> </td>
		<td><%= dto.getRequestDate() %> </td>
		<td><%= dto.getRequestPlace() %> </td>
		<td><%= dto.getPlaceAddress() %> </td>
		<td><%= dto.getDress() %> </td>
		<td><%= dto.getGoods() %> </td>
		<td><%= dto.getMc() %> </td>
		<td><%= dto.getTotalPrice() %> </td>
		<td><input type="button" id="<%= dto.getOrderId() %>" onClick="location.href='/Team404/orderUpdate.do?orderId='<%= dto.getOrderId() %>'" value="수정"></td>
		<td><input type="button" id="<%= dto.getOrderId() %>" onClick="button_event(<%= dto.getOrderId() %>);" value="삭제"></td>
	</tr>

<% } %>


</table>

        </tbody>
    </table>
    
    <br><p>
			<div class="sendForm">
				<input type="button" onclick="location.href='/Team404/orderInsert.do'" value="이벤트 추가하기">
			</div> 
	</div>
	
	</div>