package co.team404.member.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.team404.member.dao.MemberDAO;

@WebServlet("/memberIdCheck.do")
public class memberIdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public memberIdCheck() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("searchId");
		int checkedId = MemberDAO.getInstance().memberIdCheck(id);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append(Integer.toString(checkedId));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
