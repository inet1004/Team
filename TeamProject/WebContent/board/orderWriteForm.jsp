<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

			
		<%--추가 --%>
		<%
		Date nowTime = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
		%>
		<%--현재 날짜와 시간은 <%= nowTime %>, <%= sf.format(nowTime) %> 입니다.--%>


<style>
div#orderContailer { background-color: #bf00ff;}
label {color: yellow; font-weight: bold;}
</style>		

<% String id = (String) session.getAttribute("sessionID"); %>
			
<div id="orderContailer" class="container" align="center">
<br><p>
 <div><h2>이벤트 주문</h2></div>
 <div><h5><font color="#000000">여기는 이벤트 주문 하는 곳입니다.</font></h5></div> 
 	<form action="/Team404/board/orderConfirm.jsp" class="order" id="orderConfirm"
			name="orderConfirm" method="post" >
			
		<div id="formBody" class="formBody"> 
			<div><br/></div>
			 
			<div class="memberId">
				<label for="uuid">회원 아이디 :</label> <%=id %>
				<input type="hidden" class="inputOrder" id="id" name="id" value="<%=id %>">
			</div>
			
			<div><br/></div>
  			
			<div><br/></div>
			
			<div class="writeDate">
				<label for="writeDate">작성 일자 :</label>  <%= sf.format(nowTime) %>
				<input type="hidden" id="writeDate" name="writeDate" value="<%= sf.format(nowTime) %>">
			</div>
			
			<div><br/></div>
			
			<div class="requestDate">
				<label for="requestDate">이벤트 요청 일자 :</label> 
				<input type="datetime-local" class="inputOrder" id="requestDate" name="requestDate">
			</div>
			
			<div><br/></div>
			
			<div class="place">
				<div class="unit">
				<label for="place">이벤트 신청장소 : </label>
				<input type="radio"	class="inputOrder" id="place" name="place" value="1" Checked>출장 장소 
				<input type="radio"	class="inputOrder" id="place" name="place" value="2">장소 임대
				</div>
				<div class="unit"> [ 가격: 원 ] </div>
			</div>
			
			<div><br/></div>
			
			<div class="placeAddress">
				<div class="unit">
				<label for="placeAddress">신청장소의 주소: </label>
				<textarea class="inputOrder" id="rAddr" name="rAddr" placeholder="이벤트 장소의 주소 입력 "></textarea>
				</div>
				<div class="unit"> [ 가격: 원 ] </div>
			</div>
			
			<div><br/></div>			
			
			<div class="requestDress">
				<div class="unit">
				<label for="requestDress">이벤트 의상 : </label>
				<input type="radio"	class="inputOrder" id="dress" name="dress" value="1" Checked>기본 의상 
				<input type="radio"	class="inputOrder" id="dress" name="dress" value="2">풀 드레스
				</div>
				<div class="unit"> [ 가격: 원 ] </div>
			</div>
			
			<div><br/></div>
			
			<div class="eventGoods">
				<div class="unit">
				<label for="eventGoods">이벤트 소품 : </label>
				<input type="radio"	class="inputOrder" id="goods" name="goods" value="1" Checked>기본 소품 
				<input type="radio"	class="inputOrder" id="goods" name="goods" value="2">풀 소품 
        		<!--  셋트수량 : <input type="number" name="goodsSet" size="3">   --> <br>
				</div>
				<div class="unit"> [ 가격: 원 ] </div>
			</div>
			
			<div><br/></div>
			
			<div class="eventMc">
				<div class="unit">
				<label for="eventMc">이벤트 소품 : </label>
				<input type="radio"	class="inputOrder" id="mc" name="mc" value="1" Checked>사회자 불필요 
				<input type="radio"	class="inputOrder" id="mc" name="mc" value="2">사회자 요청
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
				<label for="sendForm">* 위의 사항을 확인하고 신청합니다.</label>
				<input type="submit" value="주문하기">
			</div> 
			
			
			<div><br/></div>
        
			
		</div>  
 	</form>
</div>
 