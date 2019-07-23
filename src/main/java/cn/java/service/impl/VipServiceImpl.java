package cn.java.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.integration.IntegrationAutoConfiguration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;

import cn.java.entity.Vip;
import cn.java.mapper.VipMapper;
import cn.java.service.VipService;

/**
@Transactional事务
readOnly=true开启只读事务。
readOnly=false默认，开启读写事务。写数据的时候，假如某一行代码报错了，
那么这个方法里所有的操作都会被回滚，当作没发生过一样
*/
@Service
@Transactional(readOnly = false)
public class VipServiceImpl implements VipService {
	
	@Autowired
	private VipMapper vipMapper;
	
	@Transactional(readOnly = true)
	@Override
	public List<Map<String, Object>> findAllVipInfo(Integer pageNum, Integer pageSize){
		//开始分页
		PageHelper.startPage(pageNum, pageSize);
		return vipMapper.getAllVipInfo();
	}
	@Override
	public boolean saveVipInfo(Vip vip, HttpServletRequest request) {
		//先判断会员是否存在
		int flag1 = vipMapper.isVipExist(vip.getIdcard());
		if(flag1 >= 1){
			Map<String, Object> errorMap = new HashMap<String, Object>();
			errorMap.put("idcard", "*身份证号已经存在");
			request.setAttribute("errorMap", errorMap);
			return false;
		}else{
			//获取系统时间
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String createDate = simpleDateFormat.format(new Date());
			vip.setCreateDate(createDate);
			//设置折扣
			//生成会员编号
			String vipNum = UUID.randomUUID().toString();
			vip.setVipNum(vipNum);
			
			int flag2 = vipMapper.addVipInfo(vip);
			return flag2>=1?true:false;
		}
	}
	@Override
	public Map<String, Object> findVipInfoById(Long id) {
		return vipMapper.getVipInfoById(id);
	}
	@Override
	public boolean updateVipInfo(Vip vip) {
		return vipMapper.updateVipInfo(vip)>=1?true:false;
	}
}









