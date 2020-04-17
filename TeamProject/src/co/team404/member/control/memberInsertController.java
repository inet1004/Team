package co.team404.member.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.team404.member.dao.MemberDAO;
import co.team404.member.dao.MemberVo;

/**
 * Servlet implementation class memberJoinController
 */
@WebServlet("/memberInsert.do")
public class memberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public memberInsertController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberVo vo = new MemberVo();
		
		vo.setId(request.getParameter("id"));
		vo.setName(request.getParameter("name"));
		vo.setPw(request.getParameter("pw"));
		vo.setAddr(request.getParameter("addr"));
		vo.setTell(request.getParameter("tell"));
		int n = MemberDAO.getInstance().memberInsert(vo);
		
		String path = null;
		if (n !=0) {
			path = "views/member/memberJoinOk.jsp";
		}else {
			path = "views/member/memberJoinFail.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
