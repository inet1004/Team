
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.team404.order.dao.OrderVo"%>
<%@page import="co.team404.order.dao.OrderDao"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 
<%
	//HttpSession session = request.getSession(false);
	String id = (String)session.getAttribute("sessionID");
	if(id==null){
	out.print("설정된 세션이 없습니다.<br>");
	}else{
	//out.print("id : "+ id +"<br>");
	}
	
%>


		<%--추가 --%>
		<%
		Date nowTime = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
		%>
		<%--현재 날짜와 시간은 <%= nowTime %>, <%= sf.format(nowTime) %> 입니다.--%>

<style>
div#orderContailer { background-color: #00ffbf;}
label {color: #0000ff; font-weight: bold;}
</style>		
			
<div id="orderContailer" class="container" align="center">
<br><p>
 <div><h2>이벤트 수정</h2></div>
 <div><h5><font color="#ff00bf">여기는 이벤트 수정 하는 곳입니다.</font></h5></div> 
 
 	<form action="board/orderConfirm.jsp" class="order" id="orderConfirm"
			name="orderConfirm" method="post" >
			
		<div id="formBody" class="formBody">
			<div><br/></div>
			
			<div class="memberId">
				<label for="uuid">회원 아이디 : &nbsp;&nbsp;</label> <%=id %>
				<input type="hidden" class="inputOrder" id="id" name="id"  value="<%=id %>">
			</div>
  						
			<div><br/></div>
				<font color="#ff0080"> 이벤트 주문 orderId : ${vo.orderId}</font><br/>
				<input type="hidden" class="inputOrder" id="orderId" name="orderId"  value="${vo.orderId}">
			<div><br/></div>
			<div><br/></div>
			
			<div class="writeDate">
				<label for="writeDate">작성 일자 : &nbsp;&nbsp;</label> ${vo.writeDate}
				<input type="hidden" id="writeDate" name="writeDate" placeholder="<%= sf.format(nowTime) %>" value="<%= sf.format(nowTime) %>">
			</div>
			
			<div><br/></div>
			
			<div class="requestDate">
				<label for="requestDate">이벤트 요청 일자 : &nbsp;&nbsp;</label> ${vo.requestDate} 에서
				<input type="datetime-local" class="inputOrder" id="requestDate" name="requestDate"> 으로
			</div>
			
			<div><br/></div>
			
			<div class="place">
				<div class="unit">
				<label for="place">이벤트 신청장소 : &nbsp;&nbsp;</label>
				<input type="radio"	class="inputOrder" id="place" name="place" value="1" <c:if test="${ vo.requestPlace eq '자택'}">checked="checked"</c:if>/>출장 장소 
				<input type="radio"	class="inputOrder" id="place" name="place" value="2" <c:if test="${ vo.requestPlace eq '장소대여'}">checked="checked"</c:if>/>장소 임대
				</div>
				<div class="unit"> [ 가격: 원 ] </div>
			</div>
			
			<div><br/></div>
			
			<div class="placeAddress">
				<div class="unit">
				<label for="placeAddress">신청장소의 주소: &nbsp;&nbsp;</label>
				<textarea class="inputOrder" id="rAddr" name="rAddr" placeholder="${vo.placeAddress}" required></textarea>
				</div>
				<div class="unit"> [ 가격: 원 ] </div>
			</div>
			
			<div><br/></div>			
			
			<div class="requestDress">
				<div class="unit">
				<label for="requestDress">이벤트 의상 : &nbsp;&nbsp;</label>
				<input type="radio"	class="inputOrder" id="dress" name="dress" value="1" <c:if test="${ vo.dress eq '간편복'}">checked="checked"</c:if>/>기본 의상 
				<input type="radio"	class="inputOrder" id="dress" name="dress" value="2" <c:if test="${ vo.dress eq '풀드레스'}">checked="checked"</c:if>/>풀 드레스
				</div>
				<div class="unit"> [ 가격: 원 ] </div>
			</div>
			
			<div><br/></div>
			
			<div class="eventGoods">
				<div class="unit">
				<label for="eventGoods">이벤트 소품 : &nbsp;&nbsp;</label>
				<input type="radio"	class="inputOrder" id="goods" name="goods" value="1" <c:if test="${ vo.goods == '스몰소품'}">checked="checked"</c:if>/>기본 소품 
				<input type="radio"	class="inputOrder" id="goods" name="goods" value="2" <c:if test="${ vo.goods == '빅소품'}">checked="checked"</c:if>/>풀 소품 
        		<!-- &nbsp;&nbsp;셋트수량 : <input type="number" name="goodsSet" size="3">   --> <br>
				</div>
				<div class="unit"> [ 가격: 원 ] </div>
			</div>
			
			<div><br/></div>
			
			<div class="eventMc">
				<div class="unit">
				<label for="eventMc">사외자 요청 : &nbsp;&nbsp;</label> <!-- ${vo} 확인하기 -->
				<input type="radio" name="mc" id="mc" value="1" <c:if test="${ vo.mc eq '불필요'}">checked="checked", value="불필요"</c:if>/>
				사회자 불필요 &nbsp;&nbsp;
				<input type="radio" name="mc" id="mc" value="2" <c:if test="${ vo.mc eq '필요'}">checked="checked", value="필요"</c:if>/>
				사회자 요청
				</div>
				<div class="unit"> [ 가격: 원 ] </div>
			</div>
		
			<div><br/></div>
				
			<%--
			<div class="totalPrice">
				<label for="totalPrice">전체 가격 : </label>
				<span id="totalPrice" class="inputOrder">총합계<code id="codePrice"> [ 가격: $('#id') 원 ] </code>입니다.</span>
			</div>
			<div><br/></div>
      		  입금액 : <input type="number" name="money" size="10"><br/><p>
			<div><br/></div>
        	 --%>
		
			<div><br/></div>
        
			<div class="sendForm">
				<label for="sendForm">위의 사항을 확인하고 신청합니다.</label>
				<input type="submit" value="주문하기">&nbsp;&nbsp;&nbsp;
				<input type="button" onclick="location.href='/Team404/orderList.do'" value="취소하기">
			</div> 
			
			 
			<div><br/></div>
			
		</div>  
 	</form>
</div>
 