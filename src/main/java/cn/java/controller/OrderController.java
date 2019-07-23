package cn.java.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.el.MethodExpressionImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.mongodb.WriteConcern.Majority;

import cn.java.entity.Order;
import cn.java.service.OrderService;

/**
 * 订单管理模块
 * 
 * @author chenke
 *
 */
@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;

	/**
	 * 当点击菜单栏的添加订单时，帮助跳转到添加页面
	 * 
	 * @return
	 */
	@RequestMapping("/toAddOrder.do")
	public String toAddOrder(Model model) {

		List<Map<String, Object>> roomList = orderService.getRoomsByStatus();
		model.addAttribute("roomList", roomList);
		return "admin/order/addOrder.jsp";
	}

	/**
	 * 添加订单，将数据保存到数据库中
	 * 
	 * @return
	 */
	@RequestMapping("/addOrder.do")
	public String addOrder(@Valid Order order, BindingResult br, HttpSession session) {
		System.out.println(order);
		boolean flag = br.hasErrors();
		if (flag) {
			Map<String, Object> errorMap = new HashMap<String, Object>();
			List<FieldError> fieldErrors = br.getFieldErrors();
			for (FieldError fieldError : fieldErrors) {
				String fieldName = fieldError.getField();
				String errorMessage = fieldError.getDefaultMessage();
				errorMap.put(fieldName, errorMessage);
			}
			session.setAttribute("errorMap", errorMap);
			session.setAttribute("order", order);
			return "redirect:/toAddOrder.do";
		} else {
			boolean result = orderService.saveOrder(order);
			if (result) {
				return "redirect:/getAllOrders.do";
			}
			return "redirect:/toAddOrder.do";
		}
	}
	/**
	 * 跳转到orderInfo.jsp页面，并且带数据过去
	 * @return
	 */
	@RequestMapping("/getAllOrders.do")
	public String getAllOrders(@RequestParam(name="pageNum",defaultValue="2")Integer pageNum, @RequestParam(name="pageSize",defaultValue="5")Integer pageSize, Model model){
		//调用业务层获取所有的订单信息
		List<Map<String, Object>> orderList = orderService.findAllOrders(pageNum, pageSize);
		//将查询的结果传递给PageHelper后台分页插件的PageInfo工具类中
		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String,Object>>(orderList);
		//model.addAttribute("orderList", orderList);
		model.addAttribute("pageInfo", pageInfo);
		return "admin/order/orderInfo.jsp";
	}
	/**
	 * 根据条件查询订单信息
	 * @param type
	 * @param keyWord
	 * @param model
	 * @return
	 */
	@RequestMapping("/getOrderByCondition.do")
	public String getOrderByCondition(String type, String keyWord, Model model){
		List<Map<String, Object>> orderList = orderService.findOrderByCondition(type, keyWord);
		model.addAttribute("orderList", orderList);
		return "admin/order/orderInfo_condition.jsp";
	}
	
	
	
	
	
	
}