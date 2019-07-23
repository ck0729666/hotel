package cn.java.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.java.entity.OneMenu;
import cn.java.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	/**
	 * 
	 * @param username从jsp页面接收
	 * @param pwd从jsp页面接收
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login.do")
	public String login(String username, String pwd, HttpSession session) throws Exception{
		//调用业务方法
		Long flag = loginService.isLoginSuccess(username, pwd);
		//根据业务方法返回的结果，决定跳转界面
		//视图解析器对转发有效，对重定向无效
		if(flag != null && flag != 0){
			session.setAttribute("username", username);
			//登录成功获取菜单
		    List<OneMenu> list = loginService.selectMenusById(flag);
			session.setAttribute("oneMenuList", list);
			//return "redirect:/pages/admin/index.jsp";
			return "admin/index.jsp";
		} else{
			//return "redirect:/pages/admin/login.jsp";
			return "admin/login.jsp";
		}
	}

	
	
	
	
}
