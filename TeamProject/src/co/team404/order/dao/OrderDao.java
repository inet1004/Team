package co.team404.order.dao;

import java.sql.Connection;


import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class OrderDao {

	Connection conn = null;
	PreparedStatement psmt = null;
	Statement stmt = null;
	
	private ResultSet rs;

	//싱글톤 구현
	static OrderDao instance;	
	public static OrderDao getInstance() {
		if (instance == null)
			instance = new OrderDao();
		return instance;
	}
	
	private final String ORDER_LIST = "select * from eorder";
	private final String ORDER_CHECK = "select * from eorder where orderid = ? and id = ?" ;
	private final String ORDER_INSERT = "insert into eorder values (orderseq.NEXTVAL,?,?,?,?,?,?,?,?,?)";
	// private final String ORDER_IDCHECK = "select id from member where id = ?";
	//vo.setOrderId(Integer.parseInt("orderId.NEXTVAL"));
	
	
	public ArrayList<OrderVo> select(){
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@192.168.0.116:1521:xe";
//		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user="hr";
		String password = "hr";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
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
	
	public OrderVo selectOrder(OrderVo order) {
		OrderVo vo = null;
		try {
			psmt = conn.prepareStatement(ORDER_CHECK);
			psmt.setInt(1, order.getOrderId());
			psmt.setString(2, order.getId());
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int orderId = rs.getInt("orderId");
				String id = rs.getString("id");
				vo = new OrderVo(orderId, id );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	//public int orderInsert(OrderVo order) {
	public int orderInsert(OrderVo order) {
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@192.168.0.116:1521:xe";
//		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user="hr";
		String password = "hr";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		int n=0;
		try {
			psmt = conn.prepareStatement(ORDER_INSERT);
//			psmt.setInt(1, order.getOrderId());
//			pstmt.setDate(1, new java.sql.Timestamp(dat.getTime());
//			당연히 뺄때도 Timestamp로 빼와야 시간까지 가져옵니다. ^^
//			rs.getTimestamp("save_time");
			psmt.setString(1, order.getWriteDate());
			psmt.setString(2, order.getRequestDate());
			psmt.setString(3, order.getRequestPlace());
			psmt.setString(4, order.getPlaceAddress());
			psmt.setString(5, order.getDress());
			psmt.setString(6, order.getGoods());
			psmt.setString(7, order.getMc());
			psmt.setInt(8, order.getTotalPrice());
			psmt.setString(9, order.getId());
//			psmt.setString(10, order.getFilename());
			n=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	

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
