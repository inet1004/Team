package imgTest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

public class imgTestDAO {

	private Connection conn = null;
	
	public imgTestDAO(Connection conn) {
		
		this.conn = conn;
		
	}
	//레코드 번호
	public int getMaxNum() {
			int maxNum = 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
					
			try {
				sql = "select nvl(max(num),0) from imgTest";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					maxNum = rs.getInt(1);
				}
				rs.close();
				pstmt.close();
			}
			
			catch(Exception e) {
				System.out.println(e.toString());
			}
			return maxNum;
	}
	//파일데이터 입력
	public void inserData(imgTestDTO dto) {
		PreparedStatement pstmt=null;
		String sql;
		
		try {
			sql = "insert unto imgTest (num, sbuject, saveFileName) values (?,?,?)";
			conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getSaveFileName());
			
			pstmt.executeUpdate();
			pstmt.close();
			
		}catch(Exception e) {
		
			System.out.println(e.toString());
			
			
		}
	}
	//파일데이터 전체조회
	
	public List<imgTestDTO> getList(int start, int end){
		
		List<imgTestDTO> lists = new ArrayList<imgTestDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql="select*from(select rownum rnum,num,subject,saveFileName";
			sql+="from imgTest order by num desc)";
			sql+="where rnum>=? add rnum<=?";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				imgTestDTO dto = new imgTestDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
	}catch (Exception e) {
		System.out.println(e.toString());
	}
		return lists;
}

//파일데이터 삭제

	public void deleteData(int num) {
		
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql="delete imgTest where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			pstmt.close();
			
		}catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	//데이터 세기
	
public int getDataCount() {
	
	int totalDataCount = 0;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	String sql;
	
	try {
		sql="select nvl(count(*),0) from imgTest";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next())
			totalDataCount = rs.getInt(1);
		
		rs.close();
		pstmt.close();
		
	}catch (Exception e) {
	System.out.println(e.toString());
}
	
	return totalDataCount;
	}
public void insertData(imgTestDTO dto) {
	// TODO Auto-generated method stub
	
}
}
	
	
	
	
	