package co.team404.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.jiae.lmstest.student.dao.MemberDao;
import co.jiae.lmstest.student.dao.MemberVo;
import co.team404.member.dao.MemberDAO;

@WebServlet("/memberList.do")
public class MemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberListController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doAction(request, response);
	}

	private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//DB작업
		MemberDAO dao = new MemberDAO();
		List<co.team404.member.dao.MemberVo> list = new ArrayList<co.team404.member.dao.MemberVo>();
		list = dao.MemberList();
		
		//request객체에 실어주는 구문
		request.setAttribute("members", list);
		String path = "memberlist/memberlist.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	}

}
