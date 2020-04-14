package co.team404.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class MemberDAO {

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@192.168.0.116:1521:xe";
	private String user = "hr";
	private String password = "hr";

	Connection conn = null; 
	PreparedStatement psmt = null;
	ResultSet rs = null;

	private final String MEMBER_LIST = "select * from emember";
	private final String SELECT = "SELECT * FROM EMEMBER WHERE member_id = ?";
	private final String MEMBER_INSERT = "insert into emember values(?,?,?,?,?,'bronze',sysdate)";
	private final String UPDATE = "UPDATE EMEMBER SET pw = ?, addr = ?, tell = ?, WHERE member_id = ?";
    private final String DELETE_MEMBER = "delete from emember where member_id = ?";
    private final String MEMBER_ID_CHECK = "select member_id from emember where member_id = ?";
    
    
	static MemberDAO instance;

	public static MemberDAO getInstance() {
		if (instance == null)
			instance = new MemberDAO();
		return instance;
	}

	public MemberDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	// 회원 조회
	public MemberVo selectMember(String id) {
		MemberVo member = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(SELECT);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String user_id = rs.getString("id");
				String pass = rs.getString("pass");
				member = new MemberVo(user_id, pass);
			}
		} catch (SQLException e) {
			e.printStackTrace();

		}

		return member;
	}

	// 회원 수정
	public void updateMember(MemberVo vo) {
      
	}

	// 회원 삭제
	public int deleteMember(MemberVo member) {
     PreparedStatement psmt = null;
     int n = 0;
     try {
    	 psmt = conn.prepareStatement(DELETE_MEMBER);
    	 psmt.setString(1, member.getId());
    	 n = psmt.executeUpdate();
    	 } catch(SQLException e) {
    		 e.printStackTrace();
     }
     
	return n;
     
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
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public int memberIdCheck(String id) {
		int n = 0;
		try {
			psmt = conn.prepareStatement(MEMBER_ID_CHECK);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				n = 1; //레코드의 첫번째 요소를 담는 작업
			}
		}catch(SQLException e) {
		e.printStackTrace();	
		}
		return n;
	}
}
