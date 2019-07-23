package cn.java.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface HouseMapper {
	
	/**
	 * 查询所有客房信息
	 * @return
	 */
	@Select("select rm.room_num,rm.room_status,rt.room_type_name,rt.room_price from rooms rm inner join room_type rt on rm.room_type_id = rt.id")
	List<Map<String, Object>> getAllHouseInfo();
	
	/**
	 * 查询所有的房间类型信息
	 * @return
	 */
	@Select("select * from room_type")
	List<Map<String, Object>> getAllRoomType();
	
	/**
	 * 根据筛选条件查询数据
	 * @param type
	 * @param keyword
	 * @return
	 */
	List<Map<String, Object>> getHouseInfoByCondition(Map<String, Object> paramMap);
	/**
	 * 添加房间类型
	 * @param roomTypeName
	 * @param roomPrice
	 * @return
	 */
	//insert into room_type values(null,'四人间','300');
	@Insert("insert into room_type values(null,#{arg0},#{arg1})")
	int insertRoomType(String roomTypeName, Float roomPrice);
	/**
	 * 判断房间号是否存在
	 * @param roomNum
	 * @return
	 */
	//select count(*) from rooms where room_num = '8202';
	@Select("select count(*) from rooms where room_num=#{arg0}")
	int selectRoomNumExist(String roomNum);
	/**
	 * 添加房间信息
	 * @param roomNum
	 * @param roomId
	 * @param roomStatus
	 * @return
	 */
	//insert into rooms values(null,'8219','0','1');
	@Insert("insert into rooms values(null,#{arg0},#{arg2},#{arg1})")
	int insertRoomInfo(String roomNum, Long roomId, String roomStatus);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
