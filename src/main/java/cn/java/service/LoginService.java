package cn.java.service;

import java.util.List;

import cn.java.entity.OneMenu;

public interface LoginService {
	/**
	 * @param username
	 * @param pwd明文
	 * @return
	 * @throws Exception
	 */
	Long isLoginSuccess(String username, String pwd) throws Exception;
	/**
	 * 获取system_autority中的所有菜单
	 * @return
	 */
	List<OneMenu> selectMenusById(Long userId);

}