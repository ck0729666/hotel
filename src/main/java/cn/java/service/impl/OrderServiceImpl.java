package cn.java.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;

import cn.java.entity.Order;
import cn.java.mapper.OrderMapper;
import cn.java.service.OrderService;

@Service
@Transactional(readOnly=false)
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderMapper orderMapper;
	
	/**
	 * 获取数据库表中所有已经入住的房间号
	 * @return
	 */
	@Override
	public List<Map<String, Object>> getRoomsByStatus() {
		return orderMapper.getRoomsByStatus();
	}
	
	@Transactional(readOnly=false)
	@Override
	public boolean saveOrder(Order order) {
		// 生成订单编号
		String orderNum = UUID.randomUUID().toString(); 
		//生成订单时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createDate = sdf.format(new Date());
		order.setCreateDate(createDate);
		order.setOrderNum(orderNum);
		return orderMapper.addOrder(order)>=1?true:false;
	}

	@Override
	public List<Map<String, Object>> findAllOrders(Integer pageNum,Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		return orderMapper.getAllOrders();
	}

	@Override
	public List<Map<String, Object>> findOrderByCondition(String type, String keyWord) {
		return orderMapper.findOrderByCondition(type, keyWord);
	}

	
}


















