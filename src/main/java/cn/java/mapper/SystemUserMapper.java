package cn.java.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.java.entity.OneMenu;

public interface SystemUserMapper {
	
	/**
	 * 获取所有系统用户的信息与分页查询
	 * @return
	 */
	List<Map<String, Object>> getAllUserInfo(String keyword);
	
	/**
	 * 修改启用、禁用状态
	 * @param id
	 * @param useStatus
	 * @return
	 */
	@Update("update system_user set use_status=#{arg1} where id=#{arg0}")
	int updateUseStatus(Long id, String useStatus);
	
	/**
	 * 重置或修改密码
	 * @param id
	 * @param pwd
	 * @return
	 */
	@Update("update system_user set pwd=#{arg1} where id = #{arg0}")
	int updatePwd(Long id, String pwd);
	
	List<OneMenu> getAllAuthority();
	
	/**
	 * 插入数据
	 * @param username
	 * @param pwd
	 * @param createDate
	 * @return
	 */
	@Insert("insert into system_user values(null,#{arg0},#{arg1},#{arg2},'1','0')")
	int insertSystemuser(String username, String pwd, String createDate);
	
	/**
	 * 获取用户主键
	 * @param username
	 * @param pwd
	 * @return
	 */
	@Select("select id from system_user where username=#{arg0} and pwd=#{arg1}")
	Long getSystemUserId(String username, String pwd);
	
	/**
	 * 添加用户主键与权限的关联关系
	 * @param userId
	 * @param authorityId
	 * @return
	 */
	@Insert("insert into user_authority values(#{arg0},#{arg1})")
	int insertUserAuthorityRelation(Long userId, Long authorityId);
	
	
	
	
	
	
	
	
	
	
}
