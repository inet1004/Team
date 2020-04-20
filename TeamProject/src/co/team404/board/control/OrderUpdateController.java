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

@WebServlet("/orderUpdate.do")
public class OrderUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderUpdateController() {
        super();
    } 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 회원 예약정보 읽어오기
		OrderDao dao = new OrderDao();
		OrderVo vo = new OrderVo();
//		ArrayList<OrderVo> list = new ArrayList<OrderVo>();
		String view = null; 
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		vo = OrderDao.getInstance().selectOne(orderId);
		request.setAttribute("vo", vo);
		
		String path = "/board/orderUpdateNew.tiles";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
}
