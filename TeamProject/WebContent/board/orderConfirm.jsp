<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    //1. 넘겨받은 값 추출
    request.setCharacterEncoding("UTF-8"); 

	String uid = (String) session.getAttribute("userId");
	String uname = (String) session.getAttribute("userName");

	String grade = request.getParameter("grade");
	
    String dress = request.getParameter("dress");
    String goods = request.getParameter("goods");
    String place = request.getParameter("place");
    String mc = request.getParameter("mc");
	
	// Date wDate=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("sf"));
	// Date rDate=new SimpleDateFormat("yyyy-MM-dd'T'hh:mm").parse(request.getParameter("requestDate"));
	String rAddr = request.getParameter("rAddr");
	String writeDate = request.getParameter("writeDate");
	String reqDate = request.getParameter("requestDate");
	
    int goodsSet = Integer.parseInt(request.getParameter("goodsSet"));
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
    int goodsTotal = danGoods * goodsSet;
    

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
    total = danDress + goodsTotal + danPlace + danMc;
    //change = money - total;
    //change = Math.abs(change);
   
%>

		  
       
		<%--추가 --%>
		<%		
		String wtDate = writeDate;
		String rqDate = reqDate;
		%>

		<%--현재 날짜와 시간은 <%= nowTime %>, <%= sf.format(nowTime) %> 입니다.--%>
		
		
    <h2>주문 회원</h2> 
    	회원이름: <%=uname %> <br/> 회원아이디: <%=uid %> <br/>회원등급: <%=grade %>
    <h2>주문 결과</h2>
         <ul>
         
            <li>writeDate : <%=writeDate %></li>
            <li>requestDate : <%=rqDate %></li>
            <li>Request Place : <%=place %></li>
            <li>rAddr : <%=rAddr %></li>
            <li>Dress : <%=danDress %> 원</li>
            <li>Goods : <%=danGoods %> * set수: <%=goodsSet %> 
                = GoodsTotal : <%=goodsTotal %> 원</li>
            <li>Place : <%=danPlace %> 원</li>
            <li>MC : <%=danMc %> 원</li>
            <br/><p>----------------------<br/>
             총 액 : <%=total %> 원  <br/>
         </ul>
       * 위의 사항을 확인하고 주문 합니다 : <br/><p>
       
     
		
			
    <form action="../orderInsert.do" method="post" >
				<input type="hidden" id="orderId" name="orderId" value="1178">
				<input type="hidden" id="writeDate" name="writeDate" value="<%= wtDate %>">
				<input type="hidden" id="requestDate" name="requestDate" value="<%=rqDate %>">
				<input type="hidden" id="requestPlace" name="requestPlace" value="<%= place %>">
				<input type="hidden" id="placeAddress" name="placeAddress" value="<%= rAddr %>">
				<input type="hidden" id="dress" name="dress" value="<%= dress %>">
				<input type="hidden" id="goods" name="goods" value="<%= goods %>">
				<input type="hidden" id="mc" name="mc" value="<%= mc %>">
				<input type="hidden" id="totalPrice" name="totalPrice" value="<%=total %>">
				<input type="hidden" id="id" name="id" value="<%= 2222 %>">
        <input type="submit" value="주문 확인">
    </form>  
  
  