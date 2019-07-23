package cn.java.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import cn.java.entity.OneMenu;


public interface LoginMapper {
	
	/**
	 * 登录
	 * @param username
	 * @param pwd
	 * @return
	 */
	@Select("select id from system_user where username = #{arg0} and pwd = #{arg1}")
	Long login(String username, String pwd);

	/**
	 * 根据id获取数据库的所有菜单
	 * @return
	 */
	List<OneMenu> getMenusByUserId(Long id);
	
	
	
}
