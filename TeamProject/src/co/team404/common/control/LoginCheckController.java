package co.team404.common.control;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.team404.member.dao.MemberDAO;
import co.team404.member.dao.MemberVo;
import common.ConnectionManager;


@WebServlet("/LoginCheck.do")
public class LoginCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LoginCheckController() {
        super();
       
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        MemberVo vo = new MemberVo();
        HttpSession session = request.getSession();
        String id= request.getParameter("id");
        String pw = request.getParameter("pw");
        
        // DB에서 아이디, 비밀번호 확인
        MemberDAO dao = MemberDAO.getInstance();
        int check = dao.loginCheck(id, pw);	
        
        String msg = "";
        
        if(check == 1)    // 로그인 성공
        {   
        	vo.setId(id);
        	vo = dao.selectMember(vo);
            session.setAttribute("sessionID", id);
            session.setAttribute("grade", vo.getGrade());
            msg = "home.do";
        }
        else if(check == 0) // 비밀번호가 틀릴경우
        {
            msg = "login.do?msg=0";
        }
        else    // 아이디가 틀릴경우
        {
            msg = "login.do?msg=-1";
        }
         
        // sendRedirect(String URL) : 해당 URL로 이동
        // URL뒤에 get방식 처럼 데이터를 전달가능
        response.sendRedirect(msg);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doGet(request,response);
	}

	
	
}	
