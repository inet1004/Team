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

	int grade = Integer.parseInt(request.getParameter("grade"));
	
    int dress = Integer.parseInt(request.getParameter("dress"));
	int goods = Integer.parseInt(request.getParameter("goods"));
	int place = Integer.parseInt(request.getParameter("place"));
	int mc = Integer.parseInt(request.getParameter("mc"));
	
	Date wDate=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("writeDate"));
	Date rDate=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("requestDate"));
	String rAddr = request.getParameter("rAddr");
	
    int goodsSet = Integer.parseInt(request.getParameter("goodsSet"));
    int money = Integer.parseInt(request.getParameter("money"));
   
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
    case 1 : danDress=3000; break;
    case 2 : danDress=3300; break;
    }
    

    //메뉴에 따라 가격 설정
    switch (goods) {
    case 1 : danGoods=3000; break;
    case 2 : danGoods=3300; break;
    }
    int goodsTotal = danGoods * goodsSet;
    

    //메뉴에 따라 가격 설정
    switch (place) {
    case 1 : danPlace=3000; break;
    case 2 : danPlace=3300; break;
    }
    

    //메뉴에 따라 가격 설정
    switch (mc) {
    case 1 : danMc=3000; break;
    case 2 : danMc=3300; break;
    }
   
    //총금액
    total = danDress + goodsTotal + danPlace + danMc;
    change = money - total;
    change = Math.abs(change);
   
%>

    <h2>주문 회원</h2> 
    	회원이름: <%=uname %> 회원아이디: <%=uid %> 회원등급: <%=grade %>
    <h2>주문 결과</h2>
         <ul>
         
            <li>writeDate : <%=wDate %></li>
            <li>requestDate : <%=rDate %></li>
            <li>rAddr : <%=rAddr %></li>
            <li>Dress : <%=danDress %> 원</li>
            <li>Goods : <%=danGoods %> * set수: <%=goodsSet %> 
                = GoodsTotal : <%=goodsTotal %> 원</li>
            <li>Place : <%=danPlace %> 원</li>
            <li>MC : <%=danMc %> 원</li>
            <br/><p>----------------------<br/>
             총 액 : <%=total %> 원  <br/>
             입금액 : <%=money %> 원  <br/>
             잔 액 : <%=change %> 원 남았습니다. <br/>
         </ul>
         
       * 위의 사항을 확인하고 주문 합니다 : <br/><p>
    <form action="qqqq.jsp">
        <input type="submit" value="주문 확인">
    </form> 
  
  