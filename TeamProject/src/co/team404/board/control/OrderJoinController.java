package co.team404.board.control;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.team404.order.dao.OrderDao;
import co.team404.order.dao.OrderVo;

@WebServlet("/orderJoin.do")
public class OrderJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderJoinController() {
        super();
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//
		OrderDao dao = new OrderDao();
		OrderVo vo = new OrderVo();
		ArrayList<OrderVo> list = new ArrayList<OrderVo>();
		String view = null; 

		HttpSession session = request.getSession(false);
		String id =  (String)session.getAttribute("sessionID");
		
    	list = OrderDao.getInstance().selectOrder(id);
		
		request.setAttribute("list", list);
		//		
		String path = "/board/orderView.tiles";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
}
