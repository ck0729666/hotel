package cn.java.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Insert;

import cn.java.entity.Vip;

public interface VipService {

	/**
	 * 查询数据库中所有信息
	 * @return
	 */
	List<Map<String, Object>> findAllVipInfo(Integer pageNum, Integer pageSize);

	/**
	 * 添加会员信息
	 * @param vip
	 * @return
	 */
	boolean saveVipInfo(Vip vip, HttpServletRequest request);
	
	/**
	 * 根据id值获取会员的详细信息
	 * @param id
	 * @return
	 */
	Map<String, Object> findVipInfoById(Long id);
	
	/**
	 * 修改会员信息
	 * @param vip
	 * @return
	 */
	boolean updateVipInfo(Vip vip);
	
	
	
	
}












