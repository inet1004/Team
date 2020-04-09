package co.team404.order.dao;

import java.sql.Date;

public class OrderVo {
	private String id;
	private String pw;
	private String name;
	private String addr;
	private String tel;
	// private String gender;
	// private String hobby;
	private String grade;
	private int orderId;
	private Date writeDate;
	private Date requestDate;
	private String requestPlace;
	private String placeAddress;
	private String dress;
	private String goods;
	private String mc;
	private int totalPrice;
	private String filename;
	
	
	public OrderVo() {
	}


	public OrderVo(String id, String pw, int orderId) {
		super();
		this.id = id;
		this.pw = pw;
		this.orderId = orderId;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


	public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public Date getWriteDate() {
		return writeDate;
	}


	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}


	public Date getRequestDate() {
		return requestDate;
	}


	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}


	public String getRequestPlace() {
		return requestPlace;
	}


	public void setRequestPlace(String requestPlace) {
		this.requestPlace = requestPlace;
	}


	public String getPlaceAddress() {
		return placeAddress;
	}


	public void setPlaceAddress(String placeAddress) {
		this.placeAddress = placeAddress;
	}


	public String getDress() {
		return dress;
	}


	public void setDress(String dress) {
		this.dress = dress;
	}


	public String getGoods() {
		return goods;
	}


	public void setGoods(String goods) {
		this.goods = goods;
	}


	public String getMc() {
		return mc;
	}


	public void setMc(String mc) {
		this.mc = mc;
	}


	public int getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
	
	
	
}
