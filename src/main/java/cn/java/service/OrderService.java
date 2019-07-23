package cn.java.service;

import java.util.List;
import java.util.Map;

import cn.java.entity.Order;

public interface OrderService {

	List<Map<String, Object>> getRoomsByStatus();
	
	boolean saveOrder(Order order);
	
	List<Map<String, Object>> findAllOrders(Integer pageNum,Integer pageSize);
	
	List<Map<String, Object>> findOrderByCondition(String type, String keyWord);
}
