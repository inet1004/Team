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


@WebServlet("/loginCheck.do")
public class LoginCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LoginCheckController() {
        super();
       
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doAction(request,response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doAction(request,response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		MemberDAO dao = new MemberDAO();
		MemberVo member = new MemberVo();
		String view = "";
		Connection conn = ConnectionManager.getConnnection();
		String path = null;
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		member.setMemberid(id);
		member.setPw(pw);
		member = dao.selectMember(member);
		
		if(member != null) {
			session.setAttribute("name", member.getMembername());
			session.setAttribute("sessionid", member.getMemberid());
			   view = "view/loginfail.jsp";
					   
		} else {
			 view = "tiles/homepage.jsp";
		}
		ConnectionManager.close(conn);
		dispatch(request,response,view);
	}
		
		private void dispatch(HttpServletRequest request, HttpServletResponse response, String view) throws ServletException, IOException{
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	
}	
