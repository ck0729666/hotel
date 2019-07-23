package cn.java.controller;

import java.nio.charset.MalformedInputException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.java.entity.OneMenu;
import cn.java.service.SystemUserService;

@Controller
public class SystemUserController {
	
	@Autowired
	private SystemUserService systemUserService;
	
	/**
	 * 用户信息查询
	 * @return
	 */
	@RequestMapping("/getUserInfo.do")
	public String getUserInfo(@RequestParam(name="pageNum",defaultValue="1")Integer 
			pageNum, @RequestParam(name="pageSize",defaultValue="10")Integer pageSize,String keyword,Model model){
		List<Map<String, Object>> userInfoList = systemUserService.getAllUserInfo(pageNum,pageSize, keyword);
		
		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String,Object>>(userInfoList);
		model.addAttribute("pageInfo", pageInfo);
		return "admin/user/userInfo.jsp";
	}
	
	/**
	 * 修改禁用、启用状态
	 * @param id
	 * @param useStatus
	 * @return
	 */
	@RequestMapping("/updateUseStatus.do")
	public @ResponseBody boolean updateUseStatus(Long id, String useStatus){
		return systemUserService.updateUseStatus(id, useStatus);
		
	}
	
	/**
	 * 重置密码
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/resetPwd.do")
	public @ResponseBody boolean resetPwd(Long id, String isAdmin, HttpSession session) throws Exception{
		boolean flag = systemUserService.updatePwd(id);
		if(flag){
			//session.invalidate()是将session设置为失效，一般在退出时使用
			session.invalidate();
		}
		return flag;
	}
	
	/**
	 * 跳转到添加用户页面
	 * @return
	 */
	@RequestMapping("/toAddUser.do")
	public String toAddUser(Model model){
		List<OneMenu> oneMenuList = systemUserService.findAllAuthority();
		model.addAttribute("oneMenuList", oneMenuList);
		return "admin/user/addUser.jsp";
	}
	
	@RequestMapping("/addUser.do")
	public @ResponseBody boolean addUser(String username, 
			String password, String oneIds, String twoIds) throws Exception{
		return systemUserService.saveUser(username, password, oneIds, twoIds);
	}
	
}















