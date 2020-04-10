package co.team404.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "hr";
	private String password = "hr";

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	private final String MEMBER_LIST = "select * from emember";
	private final String MEMBER_INSERT = "insert into emember values(?,?,?,?,?,'bronze',sysdate)";

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
}
