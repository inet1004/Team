package imgTest;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.DefaultFocusManager;

/**
 * Servlet implementation class ImgTestServlet
 */
@WebServlet("/ImgTestServlet")
public class ImgTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Object encType;
	
	protected void forward(HttpServletRequest request, HttpServletResponse response,String url) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		Connection conn = DBCPConn.getConnection();
		imgTestDAO dao = new imgTestDAO(conn);
		
	//페이징
		
		MyUtil myUtil = new MyUtil();
		String cp = request.getContextPath();
		String uri = request.getRequestURI();
		String url;
		
		//파일 업로드 위치 지정
		String root = getServletContext().getRealPath("/");
		String path = root + File.separator + "pds" + File.separator + "imgFile";
	File f = new File(path);
	
	if(!f.exists()) {
		f.mkdirs();
	}
	if(uri.indexOf("write.do")!= -1) {
		url = "/imgTest/write.jsp";
		forward(request, response, url);
		
	} else if (uri.indexOf("write_ok.do")!= -1) {
		String enctype = "UTF-8";
		
		int maxSize = 10 * 1024 * 1024;
		
		//파일 업로드
		MultipartRequest mr = new MultipartRequest(request, path, maxSize,
					encType, new DefaultFileRenamePolicy())	;	
		
		//DB에 파일정보 입력	
		//업로드한 파일로부터 정보 추출
		if(mr.getFile("uploadFile")!= null) { //null이 아니면 파일이 제대로 업로드된것
			imgTestDTO dto = new imgTestDTO();
			int maxNum = dao.getMaxNum();
			dto.setNum(maxNum + 1);
			dto.setSubject(mr.getParameter("subject"));
			dto.setSaveFileName(mr.getParameter("upliadFile"));
			dao.insertData(dto);
		}
		//list.do 페이지로 리다이렉트
		url = cp + "./img/list.do"
	}
	}
	

		
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
