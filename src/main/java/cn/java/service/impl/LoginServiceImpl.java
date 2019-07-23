package cn.java.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.java.entity.OneMenu;
import cn.java.mapper.LoginMapper;
import cn.java.service.LoginService;
import cn.java.utils.MD5;

@Service
@Transactional(readOnly = false)
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginMapper loginMapper;
	
	/**
	 * 登录业务方法
	 */
	@Override
	public Long isLoginSuccess(String username, String pwd) throws Exception{
		//判断username，pwd是否等于null
		if(username==null||pwd==null){
			return null;
		}
		//首先校验用户名和密码是否满足格式要求
		String regex1 = "\\w{3,12}";
		String regex2 = "\\w{6,20}";
		boolean flag1 = username.matches(regex1);
		boolean flag2 = pwd.matches(regex2);
		if(flag1 && flag2){
			String miWenPwd = MD5.finalMD5(pwd);
			Long flag = loginMapper.login(username, miWenPwd);
			return flag;
		}
		return null;
	}
	@Override
	public List<OneMenu> selectMenusById(Long userId){
		return loginMapper.getMenusByUserId(userId);
	}
}
