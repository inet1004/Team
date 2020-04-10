package co.team404.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

<<<<<<< HEAD
import co.jiae.lms.VO.MemberVo;
import common.ConnectionManager;

=======
>>>>>>> branch 'master' of https://github.com/inet1004/Team
public class MemberDAO {
<<<<<<< HEAD
	
	
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	
=======

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "hr";
	private String password = "hr";

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	private final String MEMBER_LIST = "select * from emember";
	private final String MEMBER_INSERT = "insert into emember values(?,?,?,?,?,'bronze',sysdate)";

>>>>>>> branch 'master' of https://github.com/inet1004/Team
	static MemberDAO instance;

	public static MemberDAO getInstance() {
		if (instance == null)
			instance = new MemberDAO();
		return instance;
	}
<<<<<<< HEAD
	
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
=======

	public MemberDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
>>>>>>> branch 'master' of https://github.com/inet1004/Team
		}
<<<<<<< HEAD
		
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
=======
	}

	public ArrayList<MemberVo> selectAll() {
		ArrayList<MemberVo> list = new ArrayList<MemberVo>();
		MemberVo member = null;

		try {
			psmt = conn.prepareStatement(MEMBER_LIST);
			rs = psmt.executeQuery();
			while (rs.next()) {
				member = new MemberVo();
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setPw(rs.getString("pw"));
				member.setAddr(rs.getString("addr"));
				member.setTell(rs.getString("tell"));
				member.setGrade(rs.getString("grade"));
				member.setJdate(rs.getDate("jdate"));
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int memberInsert(MemberVo member) {
		int n = 0;
		try {
			psmt = conn.prepareStatement(MEMBER_INSERT);
			psmt.setString(1, member.getId());
			psmt.setString(2, member.getName());
			psmt.setString(3, member.getPw());
			psmt.setString(4, member.getAddr());
			psmt.setString(5, member.getTell());
			psmt.setDate(6, member.getJdate());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
>>>>>>> branch 'master' of https://github.com/inet1004/Team
}