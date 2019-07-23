package cn.java.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.java.mapper.FrontMapper;
import cn.java.service.FrontService;

@Service
public class FrontServiceImpl implements FrontService {
	@Autowired
	private FrontMapper frontMapper;
	
	/* (non-Javadoc)
	 * @see cn.java.service.impl.FrontService#selectAll()
	 */
	@Override
	public List<Map<String, Object>> selectAll(){
		return frontMapper.getAll();
	}
}
