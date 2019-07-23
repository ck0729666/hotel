package cn.java.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.java.entity.InRoomInfo;

public interface InRoomInfoMapper {

/**
 * 查询所有入住的信息
 * @return
 */
 List<Map<String, Object>> getAllInRoomInfos();
 /**
  * 入住信息查询中的条件查询
  * @param type
  * @param keyWord
  * @return
  */
 List<Map<String, Object>> getInRoomInfoByCondition(String type,String keyWord);
 /**
  * 删除入住信息
  * mybatis:#号取值，会把数据当字符串处理
  * @param id
  * @return
  */
 @Update("UPDATE in_room_info SET status='0' where id = #{arg0}")
 int delInfoById(Long id);
 /**
  * 批量删除
  * mybatis：$号取值，不会加'';若为#号，则为‘1，2，3’
  * @param paramMap
  * @return
  */
 @Update("UPDATE in_room_info SET status='0' where id in(${idAttr})")
 int batchDel(Map<String, Object> paramMap);
 /**
  * 获取所有空闲房间
  * @return
  */
 @Select("select * from rooms where room_status='0'")
 List<Map<String, Object>> getAllKXRoom();
 /**
  * 根据房间号获取房间id
  * @param roomNum
  * @return
  */
 @Select(value="select id from rooms where room_num = #{arg0}")
 Long getRoomIdByRoomNum(String roomNum);
 /**
  * 添加入住信息
  * @return
  */
  @Insert("INSERT INTO `in_room_info` VALUES(NULL,#{customerName},#{gender},#{isVip},#{idcard},#{phone},#{money},#{createDate},#{roomId},'1')")
 int addInRoomInfo(InRoomInfo inRoomInfo);
  /**
   * 修改房间状态
   * @param roomNum
   * @return
   */
 @Update("update rooms set room_status='1' where room_num=#{arg0}")
 int updateRoomStatus(String roomNum);
 /**
  * 获取数据库表中所有已经入住的房间号
  * @return
  */
 @Select("select room_num,id from rooms where room_status = '1'")
 List<Map<String, Object>> getRoomsByStatus();
    /**
     * 
     * Description: 根据房间主键来获取入住人的详细信息<br/>
     *
     * @author 丁鹏(大胆开车，幽默讲课)
     * @param roomId
     * @return
     */
    // @Select("SELECT * FROM `in_room_info` WHERE room_id=#{arg0} LIMIT 1")
    @Select("SELECT customer_name,gender,idcard,phone,money,DATE_FORMAT(create_date,'%Y-%m-%d') AS create_date FROM `in_room_info` WHERE room_id=#{arg0} LIMIT 1\r\n")
    Map<String, Object> getInRoomInfoByRoomId(Long roomId);

    /**
     * 
     * Description: 根据房间主键查询出房间对应的单价<br/>
     *
     * @author 丁鹏(大胆开车，幽默讲课)
     * @param id
     * @return
     */
    @Select("SELECT room_price FROM room_type WHERE id=(SELECT room_type_id FROM `rooms` WHERE id=#{arg0})")
    Float getRoomPriceByRoomId(Long id);

    /**
     * 根据房间的ID计算消费未结算的金额
     * @param id
     * @return
     */
    @Select("select sum(order_money) from orders where room_id = #{arg0} and order_status='0'")
    Float getOtherMoney(Long id);
    
    /**
     * 根据roomId查看客人是否是vip
     * @param idcard
     * @return
     */
    @Select("select vip_rate from vip where idcard=(select idcard from in_room_info where room_id=#{arg0})")
    Float getVipRateByIdCard(Long roomId);
    
    /**
     * 修改房间状态
     * @param roomId
     * @return
     */
    @Update("update rooms set room_status='2' where id=#{arg0} ")
    int updateRoomStatusByRoomId(Long roomId);
    
    /**
     * 修改退房状态
     * @param roomId
     * @return
     */
    @Update("update in_room_info set out_room_status='1' where room_id=#{arg0}")
    int updateOutRoomStatusByRoomId(Long roomId);
    
    
    
    
    
    
    
}







