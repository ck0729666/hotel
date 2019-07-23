package cn.java.entity;

import java.io.Serializable;
import java.util.List;

public class OneMenu implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1048109638050311353L;
	
	private Long id;
	
	private String oneName;
	
	private List<TwoMenu> twoMenuList;
	
	public List<TwoMenu> getTwoMenuList() {
		return twoMenuList;
	}
	public void setTwoMenusList(List<TwoMenu> twoMenuList) {
		this.twoMenuList = twoMenuList;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getOneName() {
		return oneName;
	}
	public void setOneName(String oneName) {
		this.oneName = oneName;
	}
}
