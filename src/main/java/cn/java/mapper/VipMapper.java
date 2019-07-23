package cn.java.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import cn.java.entity.Vip;

public interface VipMapper {
	
	/**
	 * 查询数据库vip表中的所有信息
	 * @return
	 */
	@Select("select * from vip")
	List<Map<String, Object>> getAllVipInfo();

	/**
	 * 判断某个会员是否存在
	 * @param idcard
	 * @return
	 */
	//select count(*) from vip where idcard = '123456789123456781';
	@Select("select count(*) from vip where idcard=#{arg0}")
	int isVipExist(String idcard);

	//insert into vip values(null,'1234567','0.8','120113199806875432','2018-10-25 10:25:37', '18687653333','楚瑜','0');
	@Insert("INSERT INTO vip VALUES(null,#{vipNum},#{vipRate},#{idcard},#{createDate},#{phone},#{customerName},#{gender})")
    int addVipInfo(Vip vip);

	/**
	 * 根据id获取会员的详细信息
	 * @param id
	 * @return
	 */
	//select customer_name,gender,vip_rate,idcard,phone from vip where id='1';
	@Select("select * from vip where id=#{arg0}")
	Map<String, Object> getVipInfoById(Long id);

	/**
	 * 修改会员信息
	 * @param vip
	 * @return
	 */
	@Insert("update vip set vip_rate=#{vipRate},idcard=#{idcard},phone=#{phone},customer_name=#{customerName},gender=#{gender} where id=#{id}")
	int updateVipInfo(Vip vip);


	
	
	
	
	


}
