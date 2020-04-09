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
	

	private final String ORDER_LIST = "select * from order";
	private final String ORDER_CHECK = "select * from order where id = ? and pw = ? and orderid = ?";
	private final String ORDER_INSERT = "insert into order values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	// private final String ORDER_IDCHECK = "select id from member where id = ?";
	
	
///	public OrderDao() {
///		try {
///			Class.forName(driver);
///			conn = DriverManager.getConnection(url,user,password);
///		} catch (ClassNotFoundException | SQLException e) {
///			e.printStackTrace();
///		}
///	}
	
	public ArrayList<OrderVo> select(){
		ArrayList<OrderVo> list = new ArrayList<OrderVo>();
		OrderVo order = null;
		try {
			psmt = conn.prepareStatement(ORDER_LIST);
			rs = psmt.executeQuery();
			while(rs.next()) {
				order = new OrderVo();
				order.setId(rs.getString("id"));
				order.setName(rs.getString("name"));
				order.setAddr(rs.getString("addr"));
				order.setTel(rs.getString("tel"));
				// member.setGender(rs.getString("gender"));
				// member.setHobby(rs.getString("hobby"));
				order.setGrade(rs.getString("grade"));
				order.setOrderId(rs.getInt("orderId"));
				order.setWriteDate(rs.getDate("writeDate"));
				order.setRequestDate(rs.getDate("requestDate"));
				order.setRequestPlace(rs.getString("requestPlace"));
				order.setPlaceAddress(rs.getString("placeAddress"));
				order.setDress(rs.getString("dress"));
				order.setGoods(rs.getString("goods"));
				order.setMc(rs.getString("mc"));
				order.setTotalPrice(rs.getInt("totalPrice"));
				order.setFilename(rs.getString("filename"));
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
			psmt.setString(1, order.getId());
			psmt.setString(2, order.getPw());
			psmt.setInt(3, order.getOrderId());
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				int orderId = rs.getInt("orderId");
				vo = new OrderVo(id, pw, orderId);
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
			psmt.setString(1, order.getId());
			psmt.setString(2, order.getName());
			psmt.setString(3, order.getPw());
			psmt.setString(4, order.getAddr());
			psmt.setString(5, order.getTel());
			// psmt.setString(6, member.getGender());
			// psmt.setString(7, member.getHobby());
			psmt.setString(6, order.getGrade());
			psmt.setInt(7, order.getOrderId());
			
//			pstmt.setDate(1, new java.sql.Timestamp(dat.getTime());
//			당연히 뺄때도 Timestamp로 빼와야 시간까지 가져옵니다. ^^
//			rs.getTimestamp("save_time");
			
			psmt.setDate(8, order.getWriteDate());
			psmt.setDate(9, order.getRequestDate());
			psmt.setString(10, order.getRequestPlace());
			psmt.setString(11, order.getPlaceAddress());
			psmt.setString(12, order.getGoods());
			psmt.setString(13, order.getMc());
			psmt.setInt(14, order.getTotalPrice());
			psmt.setString(15, order.getFilename());
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
