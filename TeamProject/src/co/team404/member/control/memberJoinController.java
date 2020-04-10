package co.team404.member.control;

import java.io.IOException;
import java.sql.Date;

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
@WebServlet("/memberJoin.do")
public class memberJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public memberJoinController() {
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
		vo.setGrade(request.getParameter("grade"));
		vo.setJdate(Date.valueOf(request.getParameter("jdate")));
		int n = MemberDAO.getInstance().memberInsert(vo);
		
		String path = null;
		if (n !=0) {
			path = "views/member/memberJoin.tiles";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
