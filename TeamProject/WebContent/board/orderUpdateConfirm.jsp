<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
div#orderContailer { background-color:#ff33ff ; color: #ffffff; }
div.p , h2 {color: #800080; font-weight: bold; display: inline-block;}
li { list-style-type : none; }
</style>	
 
 
<%-- ID:<%=id %><br> --%>

<%
    request.setCharacterEncoding("UTF-8"); 

	String orderId = request.getParameter("orderId");
    String dress = request.getParameter("dress");
    String goods = request.getParameter("goods");
    String place = request.getParameter("place");
    String mc = request.getParameter("mc");
	String rAddr = request.getParameter("rAddr");
	String writeDate = request.getParameter("writeDate");
	String reqDate = request.getParameter("requestDate");
	String id = request.getParameter("id");
	
    //int goodsSet = Integer.parseInt(request.getParameter("goodsSet"));
    // int money = Integer.parseInt(request.getParameter("money"));
   
    //2. 계산처리  
    String menu = ""; 
    int danDress = 0;
    int danGoods = 0; 
    int danPlace = 0; 
    int danMc = 0; 
    int total = 0;
    int change = 0;
   
    //메뉴에 따라 가격 설정
    switch (dress) {
    case "1" : dress="간편복"; danDress=30000; break;
    case "2" : dress="풀드레스"; danDress=50000; break;
    }
    

    //메뉴에 따라 가격 설정
    switch (goods) {
    case "1" : goods="스몰소품"; danGoods=30000; break;
    case "2" : goods="빅소품"; danGoods=50000; break;
    }
    //int goodsTotal = danGoods * goodsSet;
    

    //메뉴에 따라 가격 설정
    switch (place) {
    case "1" : place="자택"; danPlace=30000; break;
    case "2" : place="장소대여"; danPlace=50000; break;
    }
    

    //메뉴에 따라 가격 설정
    switch (mc) {
    case "1" : mc="불필요"; danMc=30000; break;
    case "2" : mc="필요"; danMc=50000; break;
    }
   
    //총금액
    total = danDress + danGoods + danPlace + danMc;
   
%>
		<%--추가 --%>
		<%		
		String wtDate = writeDate;
		String rqDate = reqDate;
		%>

		<%--현재 날짜와 시간은 <%= nowTime %>, <%= sf.format(nowTime) %> 입니다.--%>
	

<div id="orderContailer" align="center" >

		
		<br><p>
    <h2>회원 정보</h2><br/>
 <%--  	회원이름: <br/>  --%>  
    	 회원아이디 : <%=id %> <br/>
    	 오더 아이디 : <%=orderId %> <br/>
    	 
    <c:if test="${orderId != null }">
    	 오더 아이디 : <%=orderId %> <br/>
    </c:if>
    
    	<br><p>
    	
    <h2>주문 내용 체크</h2> <br><p>
         <ul>
         
            <li><div class="p">Write Date :</div> &nbsp;&nbsp; <%=writeDate %></li>
            <li><div class="p">RequestvDate :</div> &nbsp;&nbsp;  <%=rqDate %></li>
            <li><div class="p">Request Place :</div> &nbsp;&nbsp;  <%=place %></li>
            <li><div class="p">Address :</div> &nbsp;&nbsp;  <%=rAddr %></li>
            <li><div class="p">Dress :</div> &nbsp;&nbsp;  <%=dress %> <%=danDress %> 원</li>
            <li><div class="p">Goods :</div> &nbsp;&nbsp;  <%=goods %> <%=danGoods %>  원</li>
            <%-- 
            	* set수: <%=goodsSet %>  -->
                = GoodsTotal : <%=goodsTotal %> 원</li>
            --%>
            <li><div class="p">Place :</div> &nbsp;&nbsp; <%=place %>  <%=danPlace %> 원</li>
            <li><div class="p">MC :</div> &nbsp;&nbsp;  <%=mc %> <%=danMc %> 원</li>
            <br/><p>----------------------<br/>
             총 액 : <%=total %> 원  <br/>
         </ul>
       * 위의 사항을 확인하고 주문 합니다 : <br/><p>
       
			
    <form action="../orderUpdate" method="post" >
				<input type="hidden" id="orderId" name="orderId" value=<%= orderId %>>
				<input type="hidden" id="writeDate" name="writeDate" value="<%= wtDate %>">
				<input type="hidden" id="requestDate" name="requestDate" value="<%=rqDate %>">
				<input type="hidden" id="requestPlace" name="requestPlace" value="<%= place %>">
				<input type="hidden" id="placeAddress" name="placeAddress" value="<%= rAddr %>">
				<input type="hidden" id="dress" name="dress" value="<%= dress %>">
				<input type="hidden" id="goods" name="goods" value="<%= goods %>">
				<input type="hidden" id="mc" name="mc" value="<%= mc %>">
				<input type="hidden" id="totalPrice" name="totalPrice" value="<%= total %>">
				<input type="hidden" id="id" name="id" value="<%= id %>">
    			<br><p>
        <input type="submit" value="주문 확인">  &nbsp;&nbsp; <input type="button" onclick="location.href='../orderJoin.do'" value="추문 취소">
    </form>  
    
    <br><p>
    
    
  
  </div>