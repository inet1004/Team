package co.team404.order.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class OrderDao {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@192.168.0.116:1521:xe";  // Team DB
//	String url = "jdbc:oracle:thin:@localhost:1521:xe";		 // Local DB
	String user="hr";
	String password = "hr";

	Connection conn = null;
	PreparedStatement psmt = null;
	Statement stmt = null;
	ResultSet rs=null;;

	//싱글톤 구현
	static OrderDao instance;	
	public static OrderDao getInstance() {
		if (instance == null)
			instance = new OrderDao();
		return instance;
	}
	
	public OrderDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	private final String ORDER_LIST = "select * from eorder order by orderId";
	private final String ORDER_ONE = "select * from eorder where orderid = ?" ;
	private final String ORDER_SELECT = "select * from eorder where id = ?" ;
	private final String ORDER_CHECK = "select * from eorder where orderid = ? and id = ?" ;
	private final String ORDER_INSERT = "insert into eorder values (orderseq.NEXTVAL,?,?,?,?,?,?,?,?,?)";
//	private final String ORDER_INSERT_CHECK = "insert into eorder values (orderseq.NEXTVAL,?,?,?,?,?,?,?,?,?) "
//			+ " where not exists (select requireDate from eorder where requireDate LIKE rDate ) ";
//	private final String ORDER_IDCHECK = "select id from member where id = ?";
//	vo.setOrderId(Integer.parseInt("orderId.NEXTVAL"));


	public ArrayList<OrderVo> select(){
		ArrayList<OrderVo> list = new ArrayList<OrderVo>();
		OrderVo order = null;
		try {
			psmt = conn.prepareStatement(ORDER_LIST);
			rs = psmt.executeQuery();
			while(rs.next()) {
				order = new OrderVo();
				order.setOrderId(rs.getInt("orderId"));
				order.setWriteDate(rs.getString("writeDate"));
				order.setRequestDate(rs.getString("requestDate"));
				order.setRequestPlace(rs.getString("requestPlace"));
				order.setPlaceAddress(rs.getString("placeAddress"));
				order.setDress(rs.getString("dress"));
				order.setGoods(rs.getString("goods"));
				order.setMc(rs.getString("mc"));
				order.setTotalPrice(rs.getInt("totalPrice"));
				order.setId(rs.getString("id"));
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	
	// 수정된 사원정보 내용 갱신을 위한 메서드
	public boolean update(OrderVo oid, String OrderId) {

		String sql ="UPDATE EORDER SET "
						+ " WRITEDATE = ?, "
						+ " REQUESTDATE = ?, "
						+ " REQUESTPLACE = ?, "
						+ " PLACEADDRESS = ?, "
						+ " DRESS = ?, "
						+ " GOODS = ?, "
						+ " MC = ?, "
						+ " TOTALPRICE = ?, "
						+ " ID = ? "
				   +" WHERE ORDERID = ?";			 
		try {			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,oid.getWriteDate());
			psmt.setString(2,oid.getRequestDate());
			psmt.setString(3,oid.getRequestPlace());
			psmt.setString(4,oid.getPlaceAddress());
			psmt.setString(5,oid.getDress());
			psmt.setString(6,oid.getGoods());
			psmt.setString(7,oid.getMc());
			psmt.setInt(8,oid.getTotalPrice());
			psmt.setString(9, oid.getId());
			psmt.setInt(10,Integer.parseInt(OrderId));
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	

	// 주문정보 삭제 메서드
	public boolean delete(int orderId) {
		
		String sql ="DELETE FROM EORDER WHERE ORDERID=?";
		try {
//			conn = ConnectionManager.getConnnection();			//ConnectionManager
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, orderId);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			ConnectionManager.close(conn);
		}
		return true;
	}
	
	

	public OrderVo selectOne(int order) {
		OrderVo vo = new OrderVo();
		try {
//			conn = ConnectionManager.getConnnection();			//ConnectionManager
			psmt = conn.prepareStatement(ORDER_ONE);
			psmt.setInt(1, order);
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setOrderId(rs.getInt("orderId"));
				vo.setWriteDate(rs.getString("writeDate"));
				vo.setRequestDate(rs.getString("requestDate"));
				vo.setRequestPlace(rs.getString("requestPlace"));
				vo.setPlaceAddress(rs.getString("placeAddress"));
				vo.setDress(rs.getString("dress"));
				vo.setGoods(rs.getString("goods"));
				vo.setMc(rs.getString("mc"));
				vo.setTotalPrice(rs.getInt("totalPrice"));
				vo.setId(rs.getString("id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	

	public int orderInsert(OrderVo order) {
		
		int n=0;
		try {
			psmt = conn.prepareStatement(ORDER_INSERT);
			psmt.setString(1, order.getWriteDate());
			psmt.setString(2, order.getRequestDate());
			psmt.setString(3, order.getRequestPlace());
			psmt.setString(4, order.getPlaceAddress());
			psmt.setString(5, order.getDress());
			psmt.setString(6, order.getGoods());
			psmt.setString(7, order.getMc());
			psmt.setInt(8, order.getTotalPrice());
			psmt.setString(9, order.getId());
			n=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	
	public ArrayList<OrderVo> selectOrder(String id) {
		ArrayList<OrderVo> list = new ArrayList<OrderVo>(); 
		OrderVo voo = null;
		try {
//			conn = ConnectionManager.getConnnection();			//ConnectionManager
			psmt = conn.prepareStatement(ORDER_SELECT);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while(rs.next()) {
				voo = new OrderVo();
				voo.setOrderId(rs.getInt("orderId"));
				voo.setWriteDate(rs.getString("writeDate"));
				voo.setRequestDate(rs.getString("requestDate"));
				voo.setRequestPlace(rs.getString("requestPlace"));
				voo.setPlaceAddress(rs.getString("placeAddress"));
				voo.setDress(rs.getString("dress"));
				voo.setGoods(rs.getString("goods"));
				voo.setMc(rs.getString("mc"));
				voo.setTotalPrice(rs.getInt("totalPrice"));
				voo.setId(rs.getString("id"));
				list.add(voo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	//전체 건수 조회 //
	public int count(OrderSearchVo dto) {
		int result = 0;
		try{
			conn = ConnectionManager.getConnnection();	
			//부서, first_name 풀다운 목록
			String where = " where 1=1 ";
			String oid = Integer.toString(dto.getOrderId());
			if(oid != null && ! oid.isEmpty()) {
				where += " and orderId = ? ";
			}
			if (dto.getId() != null && ! dto.getId().isEmpty()) {
				where += " and upper(id) like '%' || upper(?) || '%' ";
			}  // upper 는 대소문자 구분안하기 위함
			String sql = "select count(*) from eorder " + where ;
			psmt = conn.prepareStatement(sql);
			int p = 0;
			String oid2 = Integer.toString(dto.getOrderId());
			if(oid2 != null && ! oid2.isEmpty()) {
				where += " and orderId = ? ";
				psmt.setInt(++p,  dto.getOrderId());
			}
			if(dto.getId() != null && ! dto.getId().isEmpty()) {
				where += " and id = ? ";
				psmt.setString(++p,  dto.getId());
			}
			ResultSet rs = psmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return result;
	}


	//페이지 처리 목록
	public ArrayList<OrderVo> getDBPageList(int start, int end) {
		ArrayList<OrderVo> datas = new ArrayList<OrderVo>();
		try{
			conn = ConnectionManager.getConnnection();
			String sql = "select b.*   from (		select rownum rn, a.*  from ("
					+ "			select * from eorder order by orderId "
					+ ") a		) b   where rn between ? and ? 	";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				OrderVo order = new OrderVo();
				order.setOrderId(rs.getInt("orderId"));
				order.setWriteDate(rs.getString("writeDate"));
				order.setRequestDate(rs.getString("requestDate"));
				order.setRequestPlace(rs.getString("requestPlace"));
				order.setPlaceAddress(rs.getString("placeAddress"));
				order.setDress(rs.getString("dress"));
				order.setGoods(rs.getString("goods"));
				order.setMc(rs.getString("mc"));
				order.setTotalPrice(rs.getInt("totalPrice"));
				order.setId(rs.getString("id"));
				datas.add(order);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(conn);
		}
		return datas;
	}
	

	// 주문 단건 조회
	public OrderVo getOrder(int order_id) {  //단건 조회
		conn = ConnectionManager.getConnnection();		
		String sql = " SELECT ORDERID,"
							+ "WRITEDATE,"
							+ "REQUESTDATE,"
							+ "REQUESTPLACE,"
							+ "PLACEADDRESS,"
							+ "DRESS,"
							+ "GOODS,"
							+ "MC,"
							+ "TOTALPRICE,"
							+ "ID "
					+ "  FROM EORDER "
					+ " WHERE ORDERID = ? ";
		OrderVo order = new OrderVo();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1,order_id);
			ResultSet rs = psmt.executeQuery();			
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			rs.next();
			order.setOrderId(rs.getInt("orderId"));
			order.setWriteDate(rs.getString("writeDate"));
			order.setRequestDate(rs.getString("requestDate"));
			order.setRequestPlace(rs.getString("requestPlace"));
			order.setPlaceAddress(rs.getString("placeAddress"));
			order.setDress(rs.getString("dress"));
			order.setGoods(rs.getString("goods"));
			order.setMc(rs.getString("mc"));
			order.setTotalPrice(rs.getInt("totalPrice"));
			order.setId(rs.getString("id"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			ConnectionManager.close(conn);
		}
		return order;
	}
	

	// 주문 목록을 가져오는 메써드
	public ArrayList<OrderVo> getDBList(OrderSearchVo dto){
		
		ArrayList<OrderVo> datas = new ArrayList<OrderVo>();
		
		//부서, first_name 풀다운 목록
		String where = " where 1=1 ";
		String oid = Integer.toString(dto.getOrderId());
		if(oid != null && ! oid.isEmpty()) {
			where += " and orderId = ? ";
		}
		
		if (dto.getId() != null && ! dto.getId().isEmpty()) {
			where += " and upper(id) like '%' || upper(?) || '%' ";
		}  // upper 는 대소문자 구분안하기 위함
		
		String sql ="select a.* from ( select rownum rn, b.* from ( " +
					"select * from eorder " + where + " order by ORDERID desc" +
					") b ) a where rn between ? and ? ";


		try {
			psmt = conn.prepareStatement(ORDER_LIST);
			
			int p = 0;
			String oid2 = Integer.toString(dto.getOrderId());
			if(oid2 != null && ! oid2.isEmpty()) {
				where += " and orderId = ? ";
				psmt.setInt(++p,  dto.getOrderId());
			}
			if(dto.getId() != null && ! dto.getId().isEmpty()) {
				where += " and id = ? ";
				psmt.setString(++p,  dto.getId());
			}
			psmt.setInt(++p, dto.getFirst());
			psmt.setInt(++p, dto.getEnd());
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				OrderVo order = new OrderVo();
				order.setOrderId(rs.getInt("orderId"));
				order.setWriteDate(rs.getString("writeDate"));
				order.setRequestDate(rs.getString("requestDate"));
				order.setRequestPlace(rs.getString("requestPlace"));
				order.setPlaceAddress(rs.getString("placeAddress"));
				order.setDress(rs.getString("dress"));
				order.setGoods(rs.getString("goods"));
				order.setMc(rs.getString("mc"));
				order.setTotalPrice(rs.getInt("totalPrice"));
				order.setId(rs.getString("id"));
				datas.add(order);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			ConnectionManager.close(conn);
		}
		return datas; 
	}
	
	
	// 주문 목록을 가져오는 메써드
//	public ArrayList<OrderVo> select(OrderSearchVo dto){
//		
//		ArrayList<OrderVo> datas = new ArrayList<OrderVo>();
//		
//		//부서, first_name 풀다운 목록
//		String where = " where 1=1 ";
//		String oid = Integer.toString(dto.getOrderId());
//		if(oid != null && ! oid.isEmpty()) {
//			where += " and orderId = ? ";
//		}
//		
//		if (dto.getId() != null && ! dto.getId().isEmpty()) {
//			where += " and upper(id) like '%' || upper(?) || '%' ";
//		}  // upper 는 대소문자 구분안하기 위함
//		
//		String sql ="select a.* from ( select rownum rn, b.* from ( " +
//					"select * from eorder " + where + " order by ORDERID desc" +
//					") b ) a where rn between ? and ? ";
//
//		String driver = "oracle.jdbc.driver.OracleDriver";
////		String url = "jdbc:oracle:thin:@192.168.0.116:1521:xe";  // team의 local server
//		String url = "jdbc:oracle:thin:@localhost:1521:xe";
//		String user="hr";
//		String password = "hr";
//		
//		try {
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url,user,password);
//		} catch (ClassNotFoundException | SQLException e) {
//			e.printStackTrace();
//		}
//		
//		try {
//			psmt = conn.prepareStatement(ORDER_LIST);
//			
//			int p = 0;
//			String oid2 = Integer.toString(dto.getOrderId());
//			if(oid2 != null && ! oid2.isEmpty()) {
//				where += " and orderId = ? ";
//				psmt.setInt(++p,  dto.getOrderId());
//			}
//			if(dto.getId() != null && ! dto.getId().isEmpty()) {
//				where += " and id = ? ";
//				psmt.setString(++p,  dto.getId());
//			}
//			psmt.setInt(++p, dto.getFirst());
//			psmt.setInt(++p, dto.getEnd());
//			
//			rs = psmt.executeQuery();
//			while(rs.next()) {
//				OrderVo order = new OrderVo();
//				order.setOrderId(rs.getInt("orderId"));
//				order.setWriteDate(rs.getString("writeDate"));
//				order.setRequestDate(rs.getString("requestDate"));
//				order.setRequestPlace(rs.getString("requestPlace"));
//				order.setPlaceAddress(rs.getString("placeAddress"));
//				order.setDress(rs.getString("dress"));
//				order.setGoods(rs.getString("goods"));
//				order.setMc(rs.getString("mc"));
//				order.setTotalPrice(rs.getInt("totalPrice"));
//				order.setId(rs.getString("id"));
//				datas.add(order);
//			}
//			rs.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		finally {
//			ConnectionManager.close(conn);
//		}
//		return datas; 
//	}

	

//	public int memberIdCheck(String id) {
//		int n=0;;
//		try {
//			psmt = conn.prepareStatement(ORDER_IDCHECK);
//			psmt.setString(1, id);
//			rs = psmt.executeQuery();
//			
//			if(rs.next()) {
//				n=1;
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return n;
//	}

	
}

