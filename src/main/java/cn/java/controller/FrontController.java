package cn.java.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.java.service.FrontService;

@Controller
public class FrontController {
	@Autowired
	private FrontService frontService;
	
	@RequestMapping("/test.do")
	public @ResponseBody String test(){
	
		return "hello java vip";
	}
	@RequestMapping("/getAll.do")
	public @ResponseBody List<Map<String, Object>> getAll(){
		return frontService.selectAll();
	}
}
