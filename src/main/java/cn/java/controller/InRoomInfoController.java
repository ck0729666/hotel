package cn.java.controller;

import java.nio.charset.MalformedInputException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.sql.ast.SQLStructDataType.Field;
import com.github.pagehelper.PageInfo;

import cn.java.entity.InRoomInfo;
import cn.java.entity.jieMoney;
import cn.java.service.InRoomInfoService;

@Controller
public class InRoomInfoController {
	
 @Autowired
 private InRoomInfoService inRoomInfoService;
 
 /**
  * 入住信息查询
  * @param pageNum
  * @param pageSize
  * @param model
  * @return
  */
 @RequestMapping("/getInRoomInfo.do")
 public String getInRoomInfo(@RequestParam(name="pageNum",defaultValue="1") Integer pageNum, 
   @RequestParam(name="pageSize",defaultValue="2") Integer pageSize, Model model){
  //分页以后返回的数据
  List<Map<String, Object>> infoList = inRoomInfoService.selectAllInRoomInfos(pageNum, pageSize);
  //将infoList封装到PageInfo工具类中
  PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String,Object>>(infoList);
  //model默认存到request域中
  model.addAttribute("pageInfo", pageInfo);
  return "admin/bill/inroominfo.jsp";
 }
 /**
  * Description:入住信息查询-按照条件具体查询
  * @param type
  * @param keyWord
  * @return
  */
 @RequestMapping("/getInRoomInfoByCondition.do")
 public String getInRoomInfoByCondition(String type,String keyWord,Model model){
  List<Map<String, Object>> infoList = inRoomInfoService.selectInRoomInfoByCondition(type, keyWord);
  model.addAttribute("infoList",infoList);
  return "admin/bill/inroominfo_condition.jsp";
 }
 /**
  * 根据id删除，将status从1设为0，假删除
  * @param id
  * @return
  */
 @RequestMapping("/delInRoomInfo.do")
 public @ResponseBody boolean delInRoomInfo(Long id){
  boolean flag = inRoomInfoService.delById(id);
  return flag;
 }
 /**
  * 批量删除
  * @param idAttr
  * @return
  */
 @RequestMapping("/batchDel.do")
 @ResponseBody
 public boolean batchDel(String idAttr){
  System.out.println("idAttr="+idAttr);
  return inRoomInfoService.batchDel(idAttr);
 }
 /**
  *跳转到入住信息添加 
  * @return
  */
 @RequestMapping("/checkIn.do")
 public String chechIn(Model model){
  List<Map<String, Object>> roomList = inRoomInfoService.getAllKXRoom();
  model.addAttribute("roomList", roomList);
  return "admin/bill/checkin.jsp";
 }
 /**
  * 入住信息添加
  * @param inRoomInfo
  * @param br
  * @param session
  * @return
  */
 @RequestMapping("/addInRoomInfo.do")
 public String addInRoomInfo(@Valid InRoomInfo inRoomInfo,BindingResult br,HttpSession session){
  boolean flag = br.hasErrors();
  if(flag){//数据格式错误
   //将错误信息封装
   Map<String, Object> errorMap = new HashMap<String, Object>();
   List<FieldError> fieldErrorList = br.getFieldErrors();
   for(FieldError fieldError: fieldErrorList){
    String field = fieldError.getField();
    String errorMessage = fieldError.getDefaultMessage();
    errorMap.put(field, errorMessage);
   }
   session.setAttribute("errorMap", errorMap);
   session.setAttribute("inRoomInfo",inRoomInfo);
   return "redirect:/checkIn.do";
  }else{//所有数据格式完全正确
   //调用业务层代码，将数据保存到数据库中
   boolean result = inRoomInfoService.saveInRoomInfo(inRoomInfo);
   if(result){//入住信息添加成功
    return "redirect:/getInRoomInfo.do";
   }else{//入住信息添加失败,重新调回添加页面
    return "redirect:/checkIn.do";
   }
  }
 }
 @RequestMapping("/jieZhang.do")
 public String jieZhang(Model model){
  //调用业务层获取所有已经入住的房间号
  List<Map<String, Object>> rmList = inRoomInfoService.selectRoomsByStatus();
  model.addAttribute("rmList", rmList);
  return "admin/bill/out.jsp";
 }
 /**
  * 根据roomId(房间主键)查询出入住人的详细信息
  * @return
  */
 @RequestMapping("/getInRoomInfoByRoomId.do")
 public @ResponseBody Map<String, Object> getInRoomInfoByRoomId(Long roomId){
  return inRoomInfoService.findInRoomInfoByRoomId(roomId);
 }
 
 /**
  * 结账退房
  * @param money
  * @return
 * @throws Exception 
  */
 @RequestMapping("/jieMoney.do")
 public @ResponseBody Float jieMoney(jieMoney money) throws Exception{
	 System.out.println(money);
	 System.out.println("1");
	 Float jieMoney = inRoomInfoService.jieMoney(money);
	 return jieMoney;
 }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
}