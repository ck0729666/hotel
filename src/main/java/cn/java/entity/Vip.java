package cn.java.entity;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

public class Vip implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 8159520266474213101L;

	private Long id;//vip信息的主键
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	@NotNull(message="*会员名格式错误")
	@Pattern(regexp = ".{2,20}", message="*会员名格式错误")
	private String customerName;//姓名
	
	@NotNull(message="*性别格式错误")
	@Pattern(regexp = "[10]", message="*性别格式错误")
	private String gender;//姓名
	
	@NotNull(message="*身份证号格式错误")
	@Pattern(regexp="\\d{17}[0-9X]", message="*身份证号格式错误")
	private String idcard;//身份证号
	
	@NotNull(message="*手机号格式错误")
	@Pattern(regexp="1[35789]\\d{9}", message="*手机号格式错误")
	private String phone;//手机号
	
	private String vipNum;//会员编号
	
	private String createDate;//创建时间
	
	private Float vipRate = 0.9F;//折扣
	
	public String getVipNum() {
		return vipNum;
	}
	public void setVipNum(String vipNum) {
		this.vipNum = vipNum;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public Float getVipRate() {
		return vipRate;
	}
	public void setVipRate(Float vipRate) {
		this.vipRate = vipRate;
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
		return "Vip [id=" + id + ", customerName=" + customerName + ", gender=" + gender + ", idcard=" + idcard
				+ ", phone=" + phone + ", vipNum=" + vipNum + ", createDate=" + createDate + ", vipRate=" + vipRate
				+ "]";
	}
	
	
}
