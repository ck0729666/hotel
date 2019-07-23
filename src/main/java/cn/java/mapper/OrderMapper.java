/**
 * Project Name:springboot_hotel
 * File Name:OrderMapper.java
 * Package Name:cn.java.mapper
 * Date:下午2:42:11
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
*/

package cn.java.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import cn.java.entity.Order;


public interface OrderMapper {
    
	/**
	 * 返回已被入住房间的房间号和id
	 * @return
	 */
    @Select("SELECT room_num,id FROM `rooms` WHERE room_status='1'")
    List<Map<String, Object>> getRoomsByStatus();
    /**
     * 添加订单
     * @param order
     * @return
     */
    //insert into orders values(null,'f936eb09-31b3-4d19-b7a6-9ed3be1e749a','400','0','4','2019-05-10 17:20:32');
    @Insert("INSERT INTO `orders`  VALUES(NULL,#{orderNum},#{money},#{orderStatus},#{roomId},#{createDate})")
    int addOrder(Order order);
    /**
     * 查询所有订单信息
     * @return
     */
    //select o.*, iri.customer_name, r.room_num from orders o inner join in_room_info iri on o.room_id=iri.room_id inner join rooms r on o.room_id = r.id;
    @Select(value="select o.*, iri.customer_name,rs.room_num from orders o"
    		+ " inner join in_room_info iri on iri.room_id=o.room_id inner join rooms rs on iri.room_id=rs.id")
    List<Map<String, Object>> getAllOrders();
    
    /**
     * 根据条件筛选出订单信息
     * @param type
     * @param keyWord
     * @return
     */
    //select o.*, iri.customer_name, r.room_num from orders o inner join in_room_info iri on o.room_id=iri.room_id
    //inner join rooms r on o.room_id = r.id where O.room_id = '3';
    List<Map<String, Object>> findOrderByCondition(String type, String keyWord);
    
    
    
    
    
}
