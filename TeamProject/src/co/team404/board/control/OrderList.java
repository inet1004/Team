package co.team404.board.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.team404.order.dao.OrderDao;
import co.team404.order.dao.OrderSearchVo;
import co.team404.order.dao.OrderVo;
import co.team404.order.dao.Paging;

@WebServlet("/orderList")
public class OrderList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderList() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderSearchVo sdto = new OrderSearchVo(); 

		//페이징처리
		Paging paging = new Paging();
		paging.setPageUnit(2);
		paging.setPageSize(5);		//현재 페이지번호
		String page = request.getParameter("page");
		int p = 1; //널이 아니면 1이 기본으로 들어감
		if (page != null)
			p = Integer.parseInt(page);
		paging.setPage(p);

		//검색 파라미터
		sdto.setOrderId(Integer.parseInt(request.getParameter("orderId")));  // EmpSearchDTO 들어감
		sdto.setId(request.getParameter("id"));
		sdto.setFirst(paging.getFirst());  // page값 계산함
		sdto.setEnd(paging.getLast());
		
		//목록조회
		//ArrayList<OrderVo> list = OrderDao.getInstance().getDBList(sdto);  // 서치 DTO를 넘겨줌
		ArrayList<OrderVo> list = OrderDao.getInstance().getDBList(sdto);  // 서치 DTO를 넘겨줌
		
		// 전체 건수
		int total = OrderDao.getInstance().count(sdto);	//getDBList(sdto);  // 같이 sdto 넘겨주어야 함
		paging.setTotalRecord(total);  //전체page를 paging에 넘김

		//결과저장
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
	
		request.getRequestDispatcher("./board/orderListNew.tiles").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
}
