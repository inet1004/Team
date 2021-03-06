package co.team404.board.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.team404.order.dao.OrderDao;
import co.team404.order.dao.OrderVo;

/**
 * Servlet implementation class OrderInsert
 */
@WebServlet("/orderInsert")
public class OrderInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); 
		
		OrderDao dao = new OrderDao();
		OrderVo vo = new OrderVo();

		vo.setWriteDate(request.getParameter("writeDate"));
		vo.setRequestDate(request.getParameter("requestDate"));
		vo.setRequestPlace(request.getParameter("requestPlace"));
		vo.setPlaceAddress(request.getParameter("placeAddress"));
		vo.setDress(request.getParameter("dress"));
		vo.setGoods(request.getParameter("goods"));
		vo.setMc(request.getParameter("mc"));
		vo.setTotalPrice(Integer.parseInt(request.getParameter("totalPrice")));
		vo.setId(request.getParameter("id"));
		
		int n = OrderDao.getInstance().orderInsert(vo);
		
		String view = null; 
		if(n != 0) {
			view = "/orderView.do";
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