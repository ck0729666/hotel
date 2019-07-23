<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>酒店客房管理系统头部</title>
<link href="<%=basePath %>/static/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=basePath %>/static/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})

//获取系统时间
function current(){ 
    var d=new Date(),str=''; 
    str +=d.getFullYear()+'年'; //获取当前年份 
    str +=d.getMonth()+1+'月'; //获取当前月份（0——11） 
    str +=d.getDate()+'日'; 
    str +=d.getHours()+'时'; 
    str +=d.getMinutes()+'分'; 
    //str +=d.getSeconds()+'秒'; 
    return str;
} 
setInterval(function(){
    $("#systime").html(current)
},100);	
</script>
</head>

<body style="background:url(<%=basePath %>/static/images/topbg.gif) repeat-x;">
<div class="topleft"> <a href="#"><img src="<%=basePath %>/static/images/logo1.png" title="系统首页" /></a> </div>
<ul class="nav">
  <li><a href="bill/checkin.html"target="rightFrame"><img src="<%=basePath %>/static/images/icon09.png" title="客人入住" />
    <h2>客人入住</h2>
    </a></li>
    <li><a href="order/addorder.html"  target="rightFrame"><img src="<%=basePath %>/static/images/icon02.png" title="添加订单" />
    <h2>添加订单</h2>
    </a></li>
    <li><a href="vip/vipinfo.html"  target="rightFrame"><img src="<%=basePath %>/static/images/icon13.png" title="会员信息" style="width:45px; height:45px;"/>
    <h2>会员信息</h2>
    </a></li>
    <li><a href="room/roominfo.html"  target="rightFrame"><img src="<%=basePath %>/static/images/ICO-066.png" title="客房信息"/>
    <h2>客房信息</h2>
    </a></li>
    <li><a href="user/usermanage.html"  target="rightFrame"><img src="<%=basePath %>/static/images/icon06.png" title="用户管理" />
    <h2>用户管理</h2>
    </a></li>
</ul>
<div class="systime">
  <span id="systime"></span>
</div>
<div class="topright">
  <ul>
    <li><a href="#">注销</a></li>
    <li><a href="login.html" target="_parent">退出</a></li>
  </ul>
  <div class="user"> <span>当前用户 ${sessionScope.username }</span> </div>
</div>
</body>
</html>
