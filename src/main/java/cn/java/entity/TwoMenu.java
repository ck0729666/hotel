package cn.java.entity;

import java.io.Serializable;

public class TwoMenu implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6127660137621301600L;
	
	private Long twoId;//二级权限的id
	
	private String twoName;
	
	private String twoUrl;
	
	private Long parent;
	
	public Long getTwoId() {
		return twoId;
	}
	public void setTwoId(Long twoId) {
		this.twoId = twoId;
	}
	public String getTwoName() {
		return twoName;
	}
	public void setTwoName(String twoName) {
		this.twoName = twoName;
	}
	public String getTwoUrl() {
		return twoUrl;
	}
	public void setTwoUrl(String twoUrl) {
		this.twoUrl = twoUrl;
	}
	public Long getParent() {
		return parent;
	}
	public void setParent(Long parent) {
		this.parent = parent;
	}
}
