package co.team404.board.control;

import java.io.IOException;

import java.util.ArrayList;

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
		
		String path = "/board/orderList.tiles";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}