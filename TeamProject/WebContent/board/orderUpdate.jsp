
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.team404.order.dao.OrderVo"%>
<%@page import="co.team404.order.dao.OrderDao"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	 String iid = "ccc" ;
	 String iname = "tttt";
	 session.setAttribute("id",iid);
	 session.setAttribute("member_name",iname);
%>

<script>
setTimeout(function() {
	}, 100);
</script>

 <%
	try{
		String uuid = (String)session.getAttribute("id"); 
		String uuname = (String)session.getAttribute("member_name");            
			 if(uuname==null||uuname.equals("")){ 
				response.sendRedirect("loginform.jsp");  
			 }
	} catch ( Exception e ) {
		e.printStackTrace();
	}
%>




		<%
		OrderDao dao = new OrderDao();
		OrderVo vo = new OrderVo();

//		ArrayList<OrderVo> list = new ArrayList<OrderVo>();

		String view = null; 
		
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		vo = dao.selectOne(orderId);
		request.setAttribute("vo", vo);
		%>



			
		<%--추가 --%>
		<%
		Date nowTime = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
		%>
		<%--현재 날짜와 시간은 <%= nowTime %>, <%= sf.format(nowTime) %> 입니다.--%>

<style>
div#orderContailer { background-color: yellowgreen;}
</style>		
			
<div id="orderContailer" class="container" align="center">
<br><p>
 <div><h2>이벤트 주문</h2></div>
 <div><h3>여기는 <code>이벤트 수정</code> 하는 곳입니다.</h3></div> 
 
 	<form action="board/orderConfirm.tiles" class="order" id="orderConfirm"
			name="orderConfirm" method="post" >
			
		<div id="formBody" class="formBody">
			<div><br/></div>
			
			<div class="memberId">
				<label for="uuid">회원 아이디 :</label> <%= vo.getId() %>
				<input type="hidden" class="inputOrder" id="id" name="id" placeholder="<%= vo.getId() %>" value="<%= vo.getId() %>">
			</div>
			
			<div><br/></div>
  
			<div class="memberName">
				<label for="uuname">회원명 :</label> <%= session.getAttribute("member_name") %>
			</div>
			
			<div><br/></div>
			
			<div class="writeDate">
				<label for="writeDate">작성 일자 :</label> String writeDate = <%= vo.getWriteDate() %>
				<input type="hidden" id="writeDate" name="writeDate" placeholder="<%= sf.format(nowTime) %>" value="<%= sf.format(nowTime) %>">
			</div>
			
			<div><br/></div>
			
			<div class="requestDate">
				<label for="requestDate">이벤트 요청 일자 :</label> 
				<input type="datetime-local" class="inputOrder" id="requestDate" name="requestDate" placeholder="<%= vo.getRequestDate() %>">
			</div>
			
			<div><br/></div>
			
			<div class="place">
				<div class="unit">
				<label for="place">이벤트 신청장소 : </label>
				<input type="radio"	class="inputOrder" id="place" name="place" value="1" <c:if test="${ vo.placeAddress eq '1'}">checked="checked"</c:if>/>출장 장소 
				<input type="radio"	class="inputOrder" id="place" name="place" value="2" <c:if test="${ vo.placeAddress eq '2'}">checked="checked"</c:if>/>장소 임대
				</div>
				<div class="unit"> [ 가격: 원 ] </div>
			</div>
			
			<div><br/></div>
			
			<div class="placeAddress">
				<div class="unit">
				<label for="placeAddress">신청장소의 주소: </label>
				<textarea class="inputOrder" id="rAddr" name="rAddr" placeholder="<%= vo.getPlaceAddress() %>"></textarea>
				</div>
				<div class="unit"> [ 가격: 원 ] </div>
			</div>
			
			<div><br/></div>			
			
			<div class="requestDress">
				<div class="unit">
				<label for="requestDress">이벤트 의상 : </label>
				<input type="radio"	class="inputOrder" id="dress" name="dress" value="1" <c:if test="${ vo.dress eq '1'}">checked="checked"</c:if>/>기본 의상 
				<input type="radio"	class="inputOrder" id="dress" name="dress" value="2" <c:if test="${ vo.dress eq '1'}">checked="checked"</c:if>/>풀 드레스
				</div>
				<div class="unit"> [ 가격: 원 ] </div>
			</div>
			
			<div><br/></div>
			
			<div class="eventGoods">
				<div class="unit">
				<label for="eventGoods">이벤트 소품 : </label>
				<input type="radio"	class="inputOrder" id="goods" name="goods" value="1" <c:if test="${ vo.goods == '1'}">checked="checked"</c:if>/>기본 소품 
				<input type="radio"	class="inputOrder" id="goods" name="goods" value="2" <c:if test="${ vo.goods == '2'}">checked="checked"</c:if>/>풀 소품 
        		&nbsp;&nbsp;셋트수량 : <input type="number" name="goodsSet" size="3"><br>
				</div>
				<div class="unit"> [ 가격: 원 ] </div>
			</div>
			
			<div><br/></div>
			
			<div class="eventMc">
				<div class="unit">
				<label for="eventMc">사외자 요청 : </label>${vo}========================
				<input type="radio" name="mc" id="mc" value="1" <c:if test="${ vo.mc eq '1'}">checked="checked", value="사회자 불필요"</c:if>/>
				<label for="mc1">사회자 불필요</label> &nbsp;&nbsp;
				<input type="radio" name="mc" id="mc" value="2" <c:if test="${ vo.mc eq '2'}">checked="checked", value="사회자 요청함"</c:if>/>
				<label for="mc2">사회자 요청</label>
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
 