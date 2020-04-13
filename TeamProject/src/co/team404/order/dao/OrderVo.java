package co.team404.order.dao;

import java.sql.Date;

public class OrderVo {
	private int orderId;
	private String writeDate;
	private String requestDate;
	private String requestPlace;
	private String placeAddress;
	private String dress;
	private String goods;
	private String mc;
	private int totalPrice;
	private String id;
	
	
	public OrderVo() {
	}

	public OrderVo(int orderId, String id) {
		super();
		this.orderId = orderId;
		this.id = id;
	}
	
	

	public OrderVo(String writeDate, String requestDate, String requestPlace, String placeAddress, String dress,
			String goods, String mc, int totalPrice, String id) {
		super();
		this.writeDate = writeDate;
		this.requestDate = requestDate;
		this.requestPlace = requestPlace;
		this.placeAddress = placeAddress;
		this.dress = dress;
		this.goods = goods;
		this.mc = mc;
		this.totalPrice = totalPrice;
		this.id = id;
	}

	public OrderVo(int orderId, String writeDate, String requestDate, String requestPlace, String placeAddress,
			String dress, String goods, String mc, int totalPrice, String id) {
		super();
		this.orderId = orderId;
		this.writeDate = writeDate;
		this.requestDate = requestDate;
		this.requestPlace = requestPlace;
		this.placeAddress = placeAddress;
		this.dress = dress;
		this.goods = goods;
		this.mc = mc;
		this.totalPrice = totalPrice;
		this.id = id;
	}


	public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public String getWriteDate() {
		return writeDate;
	}


	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}


	public String getRequestDate() {
		return requestDate;
	}


	public void setRequestDate(String requestDate) {
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


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	
}
