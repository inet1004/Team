<%@page import="java.sql.SQLException"%>
<%@page import="oracle.jdbc.driver.DBConversion"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="co.team404.member.dao.MemberDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   Connection con = null;
   PreparedStatement pstmt = null;
   
   String id = request.getParameter("id");
   int n = 0;
    try {
    	
    	String sql = "delete from emember where member_id=?";
    	pstmt = con.prepareStatement(sql);
    	pstmt.setString(1, id);
    	
    	n = pstmt.executeUpdate();
    } catch(SQLException e) {
    	e.printStackTrace();
    }finally{
    	if(pstmt!=null) pstmt.close();
    	if(con!=null) con.close();
    }
 response.sendRedirect("memberlist.jsp");
   
   %>

</body>
</html>