package cn.java.entity;

import java.io.Serializable;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

public class InRoomInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 9192307552618634118L;

	//SpringMVC校验功能：jsr303校验
	
	private String roomNum;//房间号
	
	@NotNull(message="*姓名格式错误")
	@Pattern(regexp=".{2,20}",message="*姓名格式错误")
	private String customerName;//客人姓名
	
	@NotNull(message="*性别格式错误")
	@Pattern(regexp="[10]",message="*性别格式错误")
	private String gender;//性别：1：男；0：女
	
	@NotNull(message="*VIP格式错误")
	@Pattern(regexp="[10]",message="*VIP格式错误")
	private String isVip;//1VIP 0非VIP
	
	@NotNull(message="*身份证格式错误")
	@Pattern(regexp="\\d{17}[0-1X]",message="*身份证格式错误")
	private String idcard;
	
	@NotNull(message="*手机号格式错误")
	@Pattern(regexp="1[3589]\\d{9}",message="*手机号格式错误")
	private String phone;
	
	@NotNull(message="*押金格式错误")
	@DecimalMin(value="0",message="*押金格式错误")
	@DecimalMax(value="10000",message="*押金格式错误")
	private Float money;//押金，必须是正数
	
	private Long roomId;//房间id
	
	public Long getRoomId() {
		return roomId;
	}

	public void setRoomId(Long roomId) {
		this.roomId = roomId;
	}

	private String createDate;

	public String getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getIsVip() {
		return isVip;
	}

	public void setIsVip(String isVip) {
		this.isVip = isVip;
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

	public Float getMoney() {
		return money;
	}

	public void setMoney(Float money) {
		this.money = money;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "InRoomInfo [roomNum=" + roomNum + ", customerName=" + customerName + ", gender=" + gender + ", isVip="
				+ isVip + ", idcard=" + idcard + ", phone=" + phone + ", money=" + money + ", roomId=" + roomId
				+ ", createDate=" + createDate + "]";
	}

	
	
	
}







