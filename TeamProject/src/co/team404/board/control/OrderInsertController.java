package co.team404.board.control;

import java.io.IOException;



import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.team404.order.dao.OrderDao;
import co.team404.order.dao.OrderVo;


@WebServlet("/orderInsert.do")
public class OrderInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderInsertController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 /*
		BoardDao dao = new BoardDao();
		BoardVo vo = new BoardVo();
		vo.setWriter(request.getParameter("writer"));
		vo.setTitle(request.getParameter("title"));
		vo.setContents(request.getParameter("contents"));
		
		String path = null;
		int n =dao.insert(vo);
		
		if (n != 0) path = "views/board/boardWriteForm.jsp";
		else path ="views/student/memberInsertFail.jsp";
		*/
		
		request.setCharacterEncoding("utf-8"); 
		
		
		OrderDao dao = new OrderDao();
		OrderVo vo = new OrderVo();
		
//		String filepath = request.getSession().getServletContext().getRealPath("fileupload");
//		int filesize = 1024 * 1024 * 10;
//		MultipartRequest multi = new MultipartRequest(request, filepath, filesize,"utf-8",new DefaultFileRenamePolicy());
//		String file = "";
//		String ofile = "";
		
//		Enumeration files = multi.getFileNames();
//		String str = (String)files.nextElement();
		
		// DB처리
//		vo.setOrderId(Integer.parseInt("orderId.NEXTVAL"));
		//vo.setOrderId(Integer.parseInt(request.getParameter("orderId")));
		vo.setWriteDate(request.getParameter("writeDate"));
		vo.setRequestDate(request.getParameter("requestDate"));
		vo.setRequestPlace(request.getParameter("requestPlace"));
		vo.setPlaceAddress(request.getParameter("placeAddress"));
		vo.setDress(request.getParameter("dress"));
		vo.setGoods(request.getParameter("goods"));
		vo.setMc(request.getParameter("mc"));
		vo.setTotalPrice(Integer.parseInt(request.getParameter("totalPrice")));
		vo.setId(request.getParameter("id"));
		// DB처리

//		vo.setFilename(request.getParameter("filename"));
//		String[] hobbys = request.getParameterValues("hobby");
//		String item = ""; // 이런방법은 편볍임
//		if (hobbys != null) { 
//			for (String h : hobbys) {
//				item += h + h.concat(",");
//			}
//		} // 여기까지
//		vo.setHobby(item);
//		String ofile = multi.getOriginalFileName(str);
//		vo.setFilename(ofile); //파일명 담음 // 이런방법은 편볍임
//		int n=dao.memberInsert(vo);
		
		int n = dao.orderInsert(vo);
		
		String view = null; 
		if(n != 0) {
//			String file = multi.getFilesystemName(str);
			view = "views/order/fileOk.jsp";
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