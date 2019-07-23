package cn.java.entity;

import java.io.Serializable;

/**
 * 封装退房结算信息
 * @author chenke
 *
 */
public class jieMoney implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4306653464911155029L;

	private Long roomId;//房间ID
	
	private String customerName;//顾客姓名
	
	private Float price;//房间单价
	
	private Float yajin;//押金
	
	private Float qita;//其他消费
	
	private String date1;//入住时间
	
	private String date2;//退房时间

	public Long getRoomId() {
		return roomId;
	}

	public void setRoomId(Long roomId) {
		this.roomId = roomId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Float getYajin() {
		return yajin;
	}

	public void setYajin(Float yajin) {
		this.yajin = yajin;
	}

	public Float getQita() {
		return qita;
	}

	public void setQita(Float qita) {
		this.qita = qita;
	}

	public String getDate1() {
		return date1;
	}

	public void setDate1(String date1) {
		this.date1 = date1;
	}

	public String getDate2() {
		return date2;
	}

	public void setDate2(String date2) {
		this.date2 = date2;
	}

	@Override
	public String toString() {
		return "jieMoney [roomId=" + roomId + ", customerName=" + customerName + ", price=" + price + ", yajin=" + yajin
				+ ", qita=" + qita + ", date1=" + date1 + ", date2=" + date2 + "]";
	}
	
}
















