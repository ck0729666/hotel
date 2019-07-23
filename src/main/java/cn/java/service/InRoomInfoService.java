package cn.java.service;

import java.util.List;
import java.util.Map;
import cn.java.entity.jieMoney;

import cn.java.entity.InRoomInfo;

public interface InRoomInfoService {
	List<Map<String, Object>> selectAllInRoomInfos(Integer pageNum, Integer pageSize);

	List<Map<String, Object>> selectInRoomInfoByCondition(String type,String keyWord);
	
	boolean delById(Long id);
	
	boolean batchDel(String idAttr);
	
	List<Map<String, Object>> getAllKXRoom();
	
	boolean saveInRoomInfo(InRoomInfo info);
	
	List<Map<String, Object>> selectRoomsByStatus();
	
	Map<String, Object> findInRoomInfoByRoomId(Long roomId);
	
	Float jieMoney(jieMoney money) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	
}









