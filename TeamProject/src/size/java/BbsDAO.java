package size.java;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			 
			String dbURL= "jdbc:sqlserver://0.0.0.0;databaseName=BBS";
			String dbID="#";
			String dbPassword="#";
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		    conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		    
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "Select GETDATE();";
		//String SQL = "Select NOW()";
		//Select GETDATE();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}
	
	public int getNext() {
		String SQL = "SELECT bbsID FROM dbo.[BBS] ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫번째 게시물인 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) {
		//String SQL = "INSERT INTO BBS VALUE (?,?,?,?,?)";
		String SQL = "insert into dbo.[BBS](bbsID, bbsTitle, userID, bbsDate, bbsContent, bbsAvailable) values(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			//rs = pstmt.executeQuery();
			//System.out.println(SQL);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public ArrayList<Bbs> getList(int pageNumber){ 
		//String SQL = "SELECT * FROM BBS WHERE bbsID < ? bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		String SQL = "SELECT * FROM  dbo.[BBS] WHERE 1=1 AND bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC OFFSET  0 ROWS FETCH NEXT 10 ROWS ONLY";
		//SELECT * FROM  dbo.[BBS] WHERE 1=1 AND bbsID < 10 AND bbsAvailable = 1 ORDER BY bbsID DESC OFFSET  1 ROWS FETCH NEXT 10 ROWS ONLY;
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}

	//10 단위 페이징 처리를 위한 함수
	public boolean nextPage (int pageNumber) {
		//String SQL = "SELECT * FROM BBS WHERE bbsID < ? bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		String SQL = "SELECT * FROM  dbo.[BBS] WHERE 1=1 AND bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC OFFSET  0 ROWS FETCH NEXT 10 ROWS ONLY";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; 		
	}
	
	public Bbs getBbs(int bbsID) {
		String SQL = "SELECT * FROM dbo.[BBS] WHERE bbsID = ?";
		//String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));

				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
	
	//수정 함수
	public int update(int bbsID, String bbsTitle, String bbsContent) {
			String SQL = "UPDATE dbo.[BBS] SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, bbsTitle);
				pstmt.setString(2, bbsContent);
				pstmt.setInt(3, bbsID);
				return pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; // 데이터베이스 오류
	}
	

	//삭제 함수
	public int delete(int bbsID) {
		String SQL = "UPDATE dbo.[BBS] SET bbsAvailable = 0 WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);   
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	
}