<%@page import="co.team404.member.dao.MemberVo"%>
<%@page import="co.team404.member.dao.MemberDAO"%>
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
        
        MemberVo member = new MemberVo();
        
        String id= request.getParameter("id");
        String pw = request.getParameter("pw");
        
        // DB에서 아이디, 비밀번호 확인
        MemberDAO dao = MemberDAO.getInstance();
        int check = dao.loginCheck(id, pw);	
        
        String msg = "";
        
        if(check == 1)    // 로그인 성공
        { 
            
            session.setAttribute("sessionID", id);
            session.setAttribute("grade", member.getGrade());
            msg = "../../prontpage.do";
        }
        else if(check == 0) // 비밀번호가 틀릴경우
        {
            msg = "../login/LoginForm.jsp?msg=0";
        }
        else    // 아이디가 틀릴경우
        {
            msg = "../login/LoginForm.jsp?msg=-1";
        }
         
        // sendRedirect(String URL) : 해당 URL로 이동
        // URL뒤에 get방식 처럼 데이터를 전달가능
        response.sendRedirect(msg);
    %>


</body>
</html>