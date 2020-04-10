package co.team404.member.dao;

import java.sql.Date;

public class MemberVo {
	private String id;
	private String name;
	private String pw;
	private String addr;
	private String tell;
	private String grade;
	/**
	 * @return the tell
	 */
	public String getTell() {
		return tell;
	}

	/**
	 * @param tell the tell to set
	 */
	public void setTell(String tell) {
		this.tell = tell;
	}

	private Date jdate;
	
	public MemberVo() {
	}
	
	public MemberVo(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the pw
	 */
	public String getPw() {
		return pw;
	}

	/**
	 * @param pw the pw to set
	 */
	public void setPw(String pw) {
		this.pw = pw;
	}

	/**
	 * @return the addr
	 */
	public String getAddr() {
		return addr;
	}

	/**
	 * @param addr the addr to set
	 */
	public void setAddr(String addr) {
		this.addr = addr;
	}


	/**
	 * @return the grade
	 */
	public String getGrade() {
		return grade;
	}

	/**
	 * @param grade the grade to set
	 */
	public void setGrade(String grade) {
		this.grade = grade;
	}

	/**
	 * @return the jdate
	 */
	public Date getJdate() {
		return jdate;
	}

	/**
	 * @param jdate the jdate to set
	 */
	public void setJdate(Date jdate) {
		this.jdate = jdate;
	}

}
