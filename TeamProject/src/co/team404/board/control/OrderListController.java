package co.team404.board.control;

import java.io.IOException;

import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.team404.order.dao.OrderDao;
import co.team404.order.dao.OrderSearchVo;
import co.team404.order.dao.OrderVo;
import co.team404.order.dao.Paging;

@WebServlet("/orderList.do")
public class OrderListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public OrderListController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		OrderDao dao = new OrderDao();
		OrderVo vo = new OrderVo();
		ArrayList<OrderVo> list = new ArrayList<OrderVo>();
		String view = null; 
		list = OrderDao.getInstance().select();
		
		request.setAttribute("list", list);
				
		String path = "/board/orderList.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}