
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


function button_update($oid){
	if (confirm( "예약번호 "+ $oid +" 번을 수정하시겠습니까?" ) == true){    //확인 "정말 수정하시겠습니까??"+
		
		var text1 = "/Team404/orderUpdate.do?orderId=";
		var url = text1 + $oid;
		
		location.href = url;
	    document.form.submit();  
	}else{   //취소
	    e.preventDefault();;
	}
}

</script>


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
		<th>수정</th>
		<th>삭제</th>
	</tr>


  <c:forEach items="${list}" var="b" varStatus="status">
  <%--[${status.index}]: ${gamelist[status.index]}  --%> 
	   <TR class="onMouseOver">
		    <TD>${b.orderId}</TD>
		    <TD>${b.id}</TD>
		    <TD>${b.writeDate}</TD>
		    <TD>${b.requestDate}</TD>
		    <TD>${b.requestPlace}</TD>
		    <TD>${b.placeAddress}</TD>
		    <TD>${b.dress}</TD>
		    <TD>${b.goods}</TD>
		    <TD>${b.mc}</TD>
		    <TD>${b.totalPrice}</TD>
			<TD><input type="button" id="${map.getOrderId()}" onClick="button_update(${b.orderId});" value="수정"></TD>
			<TD><input type="button" id="${map.getOrderId()}" onClick="button_event(${b.orderId});" value="삭제"><TD>
	   </TR>
  </c:forEach>

</table>
    
    <br><p>
			<div class="sendForm">
				<input type="button" onclick="location.href='/Team404/orderInsert.do'" value="이벤트 추가하기">
			</div> 
	</div>
	
	</div>