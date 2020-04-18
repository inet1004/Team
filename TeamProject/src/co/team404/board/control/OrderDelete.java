package co.team404.board.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.team404.order.dao.OrderDao;

@WebServlet("/orderDelete")
public class OrderDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OrderDao dao = new OrderDao();
		
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		boolean n = dao.delete(orderId); 
		
		String view = null;  
		if(n != false) {
//			view = "views/order/fileOk.tiles";
			view = "/orderList.do";
		} else {
			view = "views/order/fileFail.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request,response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
