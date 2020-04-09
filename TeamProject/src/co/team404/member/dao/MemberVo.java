package co.team404.member.dao;

public class MemberVo {
	
	 String member_id;
	 String member_name;
	 String pw;
	 String addr;
	 String tell;
	 String grade;
	
	public MemberVo() {
	}
	
	public MemberVo(String id, String pw) {
		this.member_id = id;
		this.pw = pw;
		
	}
	
	public String getMemberid() {
		return member_id;
	}
	public void setMemberid(String memberid) {
		this.member_id = memberid;
	}
	public String getMembername() {
		return member_name;
	}
	public void setMembername(String membername) {
		this.member_name = membername;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	
}
