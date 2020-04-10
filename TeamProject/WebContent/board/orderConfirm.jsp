<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    //1. 넘겨받은 값 추출
    request.setCharacterEncoding("UTF-8"); 
    
    //int idd = Integer.parseInt(request.getParameter("id"));
	String namee = request.getParameter("name");
	
    int dress = Integer.parseInt(request.getParameter("dress"));
	int goods = Integer.parseInt(request.getParameter("goods"));
	int place = Integer.parseInt(request.getParameter("place"));
	int mc = Integer.parseInt(request.getParameter("mc"));
	
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
   
%>


    <h2>주문 회원</h2> 회원이름: <%=namee%>

    <h2>주문 결과</h2>
         <ul>
            <li>Dress : <%=danDress %></li>
            <li>Goods : <%=danGoods %> * set수: <%=goodsSet %>
                = GoodsTotal : <%=goodsTotal %></li>
            <li>Place : <%=danPlace %></li>
            <li>MC : <%=danMc %></li>
            <br/><p>----------------------<br/>
             총 액 : <%=total %>   <br/>
             입금액 : <%=money %>   <br/>
             잔 액 : <%=change %>   <br/>
         </ul>
         
       * 위의 사항을 확인하고 주문 합니다 : <br/><p>
    <form action="qqqq.jsp">
        <input type="submit" value="주문 확인">
    </form>
  
  