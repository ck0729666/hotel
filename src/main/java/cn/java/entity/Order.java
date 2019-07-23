package cn.java.entity;

import java.io.Serializable;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

public class Order implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8121190911172685615L;

	@NotNull(message="*名字格式错误")
	@Pattern(regexp=".{2,20}",message="*名字格式错误")
	private String customerName;//客人姓名
	
	@NotNull(message="*身份证号格式错误")
	@Pattern(regexp="\\d{17}[0-9X]",message="*身份证号格式错误")
	private String idcard;//身份证号
	
	@NotNull(message="*手机号码格式错误")
	@Pattern(regexp="1[35789]\\d{9}",message="*手机号码格式错误")
	private String phone;//手机号
	
	@NotNull(message="*金额格式错误")
	@DecimalMin(value="0",message="*金额格式错误")
	@DecimalMax(value="1000000",message="*金额格式错误")
	private Float money;//消费金额
	
	@NotNull(message="*结算状态数据错误")
	@Pattern(regexp="[10]",message="*结算状态数据错误")
	private String orderStatus;
	
	private String orderNum;
	
	private Long roomId;
	
	private String createDate;

	public Float getMoney() {
		return money;
	}

	public void setMoney(Float money) {
		this.money = money;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public Long getRoomId() {
		return roomId;
	}

	public void setRoomId(Long roomId) {
		this.roomId = roomId;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Order [customerName=" + customerName + ", idcard=" + idcard + ", phone=" + phone + ", money=" + money
				+ ", orderStatus=" + orderStatus + ", orderNum=" + orderNum + ", roomId=" + roomId + ", createDate="
				+ createDate + "]";
	}

	
}
