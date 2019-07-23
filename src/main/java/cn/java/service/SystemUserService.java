package cn.java.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Update;

import cn.java.entity.OneMenu;

public interface SystemUserService {

	List<Map<String, Object>> getAllUserInfo(Integer pageNum, Integer pageSize, String keyword);
	
	/**
	 * 修改启用、禁用状态
	 * @param id
	 * @param useStatus
	 * @return
	 */
	public boolean updateUseStatus(Long id, String useStatus);
	
	boolean updatePwd(Long id) throws Exception;

	List<OneMenu> findAllAuthority();
	
	boolean saveUser(String username,String password,String oneIds,String twoIds) throws Exception;
	
	
	
}
