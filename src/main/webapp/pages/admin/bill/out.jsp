<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
     + request.getContextPath() + "/";
%>
<!DOCTYPE html >
<html >
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>结账退房</title>
<link href="<%=basePath %>/static/css/style.css" rel="stylesheet"
 type="text/css" />
<link href="<%=basePath %>/static/css/select.css" rel="stylesheet"
 type="text/css" />
<script type="text/javascript" src="<%=basePath %>/static/js/jquery.js"></script>
<script type="text/javascript"
 src="<%=basePath %>/static/js/jquery.idTabs.min.js"></script>
<script type="text/javascript"
 src="<%=basePath %>/static/js/select-ui.min.js"></script>
<script type="text/javascript"
 src="<%=basePath %>/static/js/editor/kindeditor.js"></script>
<script type="text/javascript"
 src="<%=basePath %>/static/js/laydate/laydate.js"></script>
 <script type="text/javascript"
 src="<%=basePath %>/static/js/JsonHandler.js"></script>
 
<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
<script type="text/javascript">



$(document).ready(function(e) {
    $(".select1").uedSelect({
  width : 345     
 });
 $(".select2").uedSelect({
  width : 167  
 });
 $(".select3").uedSelect({
  width : 100
 });
 
 
 
});


</script>
</head>

<body>
 <div class="place">
  <span>位置：</span>
  <ul class="placeul">
   <li><a href="#">首页</a></li>
   <li><a href="#">入住信息管理</a></li>
   <li><a href="#">结账退房</a></li>
  </ul>
 </div>
 <div class="formbody">
  <div class="formtitle">
   <span>消费信息</span>
  </div>
  <div id="usual1" class="usual">
   <div id="tab1" class="tabson">
   <form id="form1" action="javascript:void(0)">
    <ul class="forminfo">
     <li><label>房间号<b>*</b></label>
      <div class="vocation">
       <select class="select1" name="roomId">
        <c:forEach items="${rmList }" var="map">
         <option value="${map.id }">${map.room_num }</option>
        </c:forEach>
       </select>
      </div></li>
     <li style="margin-top: 20px;"><label for="name">客人姓名<b>*</b></label>
      <div class="vocation">
       <input name="customerName" type="text" class="dfinput" value="客户姓名"
        style="width: 344px;" />
      </div></li>
     <br />
     <br />
     <li><label for="price" style="cursor: pointer">单价<b>*</b></label>
      <div class="vocation">
       <input name="price" id="price" class="dfinput" value=""
        style="width: 344px;" />
      </div></li>
     <br />
     <li><label for="yajin" style="cursor: pointer">押金<b>*</b></label>
      <div class="vocation">
       <input name="yajin" id="yajin" type="text" class="dfinput"
        value="押金" style="width: 344px;" />
      </div></li>
     <br />
     <li><label for="qita" style="cursor: pointer">其他消费<b>*</b></label>
      <div class="vocation">
       <input name="qita" id="qita" type="text" class="dfinput" value="其他"
        style="width: 344px;" />
      </div></li>
     <br />
     <li><label for="date1" style="cursor: pointer">入住时间<b>*</b></label>
      <div class="vocation">
       <input name="date1" id="date1" class="dfinput" value="2016-06-01"
        style="width: 344px;"/>
      </div></li>
     <br />
     <li><label for="Calendar" style="cursor: pointer">退房时间<b>*</b></label>
      <div class="vocation">
       <input name="date2" type="text" class="laydate-icon span1-1" id="Calendar"
        style="width: 324px; height: 30px; line-height: 28px; text-indent: 10px;" />
      </div> <br /></li>
     <li><label>&nbsp;</label> <input name="" type="submit"
      class="btn" value="提交" /></li>
    </ul>
    </form>
   </div>
  </div>
  <script type="text/javascript"> 
  
      $("#usual1 ul").idTabs(); 
    </script>
  <script type="text/javascript">
 $('.tablelist tbody tr:odd').addClass('odd');
 
 !function(){
laydate.skin('qianhuang');
laydate({elem: '#Calendar'});
laydate.skin('qianhuang');
laydate({elem: '#Calendar2'});
}();
$(function dd(){
  var d=new Date(),str="";
  str+=(d.getFullYear()+"-");
  str+="0";
  str+=(d.getMonth()+1+"-");
  str+=d.getDate();
  $("#Calendar").attr("value",str);
  $("#Calendar2").attr("value",str);
 });

 </script>

<script type="text/javascript">
 $(function(){
	 /* 结账退房*/
	 $("input[type=submit]").click(function(){
		 //json对象
		 //将form表单序列化成对象的格式
		 var jsonData = $("#form1").serializeObject();
		 //JSON.stringify() 方法是将一个JavaScript值(对象或者数组)转换为一个JSON字符串
		 //alert(JSON.stringify(jsonData));
		 $.ajax({
			 url:"<%=basePath%>/jieMoney.do",
			 type:"POST",
			 dataType:"JSON",
			 data:jsonData,
			 success:function(result){
				 if(result>=0){//客户价钱给酒店
					 alert("客户还需加钱："+result+"元");
				 }else{//酒店找钱给客户
					 alert("找钱："+result+"元");
				 }
				 window.location.href="<%=basePath%>/getInRoomInfo.do";
			 }
		 }); 
	 });
	 
  //根据房间号事件来获取当前已经入住人的详细信息
  $("select[name=roomId]").change(function(){
   var v = $("select[name=roomId]>option:selected").val();
   $.ajax({
    url:"<%=basePath %>/getInRoomInfoByRoomId.do",
    type:"POST",
    dataType:"JSON",
    data:{roomId:v},
    success:function(result){
    //在接收服务器数据时一般是字符串。
	//我们可以使用 JSON.parse() 方法将数据转换为JavaScript对象
     var rs = JSON.parse(result);
     //回显给文本输入框设置值
     $("input[name=customerName]").val(rs.customer_name);
     //将状态设置为不可修改状态
     $("input[name=customerName]").attr("readonly","readonly");
     //单价
     $("input[name=price]").val(rs.price);
     //将状态设置为不可修改状态
     $("input[name=price]").attr("readonly","readonly");
     
     //押金
     $("input[name=yajin]").val(rs.money);
     $("input[name=yajin]").attr("readonly","readonly");
     
     //入住时间
     $("input[name=date1]").val(rs.create_date);
     $("input[name=date1]").attr("readonly","readonly");
     
   	 //其他消费
   	 var otherMoney = rs.otherMoney;
   	 if(otherMoney==null){
   		 otherMoney=0;
   	 }
   	 
     $("input[name=qita]").val(rs.otherMoney);
     $("input[name=qita]").attr("readonly","readonly");
    }
   });
  });
 });
</script>
 </div>
</body>
</html>








