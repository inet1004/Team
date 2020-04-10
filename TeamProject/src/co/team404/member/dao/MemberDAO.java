package co.team404.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import co.jiae.lms.VO.MemberVo;
import common.ConnectionManager;

public class MemberDAO {
	
	
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	
	static MemberDAO instance;
	public static MemberDAO getInstance() {
		if (instance == null)
			instance = new MemberDAO();
		return instance;
	}
	
	String SELECT_ALL = "SELECT * FROM EMEMBER";
	String SELECT = "SELECT * FROM EMEMBER WHERE member_id = ?";
	String INSERT = "INSERT INTO EMEMBER VALUES(?,?,?,?,?)";
	String UPDATE = "UPDATE EMEMBER SET pw = ?, addr = ?, tell = ?, WHERE member_id = ?";
	String MEMBER_CHECK = "select * from emember where member_id = ? and pw = ?";
		 
		public int memberInsert(MemberVo member) {
			int n = 0;
			try {
				psmt = conn.prepareStatement(INSERT);
				psmt.setString(1, member.getMemberid());
				psmt.setString(2, member.getMembername());
				psmt.setString(3, member.getPw());
				psmt.setString(4, member.getAddr());
				psmt.setString(5, member.getTell());
				n = psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return n;
		}
		
		//회원 조회
		public MemberVo selectMember(String id) {
	         MemberVo member = null;
	         PreparedStatement pstmt = null;
	         ResultSet rs = null;
	         String sql = "select * from emember where id = ?";
	         
	         try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, id);
	            rs = pstmt.executeQuery();
	            if(rs.next()) {
	               String user_id = rs.getString("id");
	               String pass = rs.getString("pass");
	               member = new MemberVo(user_id, pass);
	            }
	         } catch (SQLException e) {
	            e.printStackTrace();
	            
	         }
	      
	         return member;
	      }
		//회원 목록
		public List<MemberVo> MemberList(){
			
			return list;
			
		}
		
		//회원 수정
		public void updateMember (MemberVo vo) {
			
		}
		
		//회원 삭제
		public void deleteMember (MemberVo vo) {
			
		}
}
