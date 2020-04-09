package co.team404.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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
		
		
	}

