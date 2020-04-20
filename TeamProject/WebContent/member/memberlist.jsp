<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="co.team404.member.dao.MemberVo" %>
<%@ page import="co.team404.member.dao.MemberDAO" %>
<% %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <style>
    /* 전체박스 */
    #wrap {
        width: 70%;
        heigth: 500px;
        margin: 0 auto;
    }
    
    </style>
    <script>
  

</script>
<title>Member List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" align="center" id="wrap">
	<br/><br />
		<h1>Member List</h1>
	<br /><br />
	
	<%
	  MemberDAO dao = new MemberDAO();
	  MemberVo vo = new MemberVo();
	  
	  ArrayList<MemberVo> list = new ArrayList<MemberVo>();
	  
	  String view = null;
	  
	  list = dao.selectAll();
	%>
	
	<table border="1" class="table">
	 <tr>
	   <th>아이디</th>
	   <th>이  름</th>
	   <th>주  소</th>
	   <th>전화번호</th>
	   <th>등   급</th>
	 </tr>	
	 
	 <%
	 for(MemberVo member : list){
	 %>
	 
	 <tr>
	 <td><%= member.getId() %></td>
	 <td><%= member.getName() %></td>
	 <td><%= member.getAddr() %></td>
	 <td><%= member.getTell() %></td>
	 <td><%= member.getGrade() %></td>
	 </tr>
	 
	 <% } %>
	</table>
	</div>
	<br/>
</body>
</html>