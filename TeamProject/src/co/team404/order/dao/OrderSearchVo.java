package co.team404.order.dao;

public class OrderSearchVo extends OrderVo {
	
	String keyword;
	String searchWorld;
	int first;
	int end;
	
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchWorld() {
		return searchWorld;
	}
	public void setSearchWorld(String searchWorld) {
		this.searchWorld = searchWorld;
	}
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	

}
