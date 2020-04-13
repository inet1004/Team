<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>


<style type="text/css">
	div.container { background-color: yellow; width: 100%; align:"center"; }
	div.formBody { background-color: yellowgreen; }
	.unit { display: inline-block; }
	label { display: inline-block; }
	input, select, textarea, label { font-size: 1.5em; }
</style>


<%
	 String iid = "ccc" ;
	 String iname = "tttt";
	 session.setAttribute("id",iid);
	 session.setAttribute("member_name",iname);
%>

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

		<%--추가 --%>
		<%--
		<%
			if (session.getAttribute("userID") == null) {
		%>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">접속하기<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="login.jsp">로그인</a></li>
					<li><a href="join.jsp">회원가입</a></li>
				</ul></li>
		</ul>
		<%
			} 
		%>
		 --%>	
			
		<%--추가 --%>
		<%
		Date nowTime = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
		%>
		<%--현재 날짜와 시간은 <%= nowTime %>, <%= sf.format(nowTime) %> 입니다.--%>
			
			
<div class="container" align="center">
< 주의> orderWriteForm.jsp 페이지의
	  String iid = "ccc" <--- emember table의 member_id 이름이어야 합니다

 <div><h3>이벤트 주문</h3></div>
 <div><h4>여기는 <code>이벤트 주문</code> 하는 곳입니다.</h4></div> 
 	<form action="orderConfirm.jsp" class="order" id="orderConfirm"
			name="orderConfirm" method="post" >
			
		<div id="formBody" class="formBody">
			<div><br/></div>
			
			<div class="memberId">
				<label for="uuid">회원 아이디 :</label> <%= session.getAttribute("id") %>
				<input type="hidden" class="inputOrder" id="id" name="id" value="<%= session.getAttribute("id") %>">
			</div>
			
			<div><br/></div>
  
			<div class="memberName">
				<label for="uuname">회원명 :</label> <%= session.getAttribute("member_name") %>
			</div>
			
			<div><br/></div>
			
			<div class="memberGrade">
				<label for="grade">회원 등급 :</label> 
				<input type="hidden" class="inputOrder" id="grade" name="grade" value="골드">
			</div>
			
			<div><br/></div>
			
			<div class="writeDate">
				<label for="writeDate">작성 일자 :</label> String writeDate = <%= sf.format(nowTime) %>
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
        		셋트수량 : <input type="number" name="goodsSet" size="3"><br>
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
				<label for="sendForm">위의 사항을 확인하고 신청합니다.</label>
				<input type="submit" value="주문하기">
			</div> 
			
			 
			<div><br/></div>
			
		</div>  
 	</form>
</div>
 