package cn.java.service;

import java.util.List;
import java.util.Map;

import ch.qos.logback.core.rolling.helper.IntegerTokenConverter;

public interface HouseService {

	public List<Map<String, Object>> findAllHouseInfo(Integer pageNum, Integer pageSize);

	public List<Map<String, Object>> findAllRoomType();
	
	public List<Map<String, Object>> findHouseInfoByCondition(Integer pageNum, Integer pageSize, String type, String keyword);

	/**
	 * 查询所有的房间类型信息
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public List<Map<String, Object>> findAllRoomTypeByCondition(Integer pageNum, Integer pageSize);

	public boolean saveRoomType(String roomTypeName, Float roomPrice);

	public boolean findRoomNumExist(String roomNum);

	boolean saveRoomInfo(String roomNum, Long roomId, String roomStatus);







}
