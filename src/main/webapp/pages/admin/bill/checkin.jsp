<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath() + "/";
%>
<!DOCTYPE html">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
	.errorMes{
		color:red;
		font-size:12px;
	}
</style>
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
			<li><a href="#">添加入住信息</a></li>
		</ul>
	</div>
	<div class="formbody">
		<div class="formtitle">
			<span>入住信息</span>
		</div>
		<div id="usual1" class="usual">
			<div id="tab1" class="tabson">
				<form action="<%=basePath %>/addInRoomInfo.do" method="POST">
					<ul class="forminfo">
						<li><label>房间号<b>*</b></label>
							<div class="vocation">
								<select class="select1" name="roomNum">
									<c:forEach items="${requestScope.roomList }" var="map">
										<option value="${map.room_num }">${map.room_num }</option>
									</c:forEach>
								</select>
							</div>
						</li>
						<br />
						<li style="margin-top: 20px;"><label for="name">客人姓名<b>*</b></label>
							<div class="vocation">
								<input required="required" name="customerName"
									pattern=".{2,20}" type="text" class="dfinput"
									placeholder="长度为2-20位字符" style="width: 344px;" value="${errorMap.customerName==null?inRoomInfo.customerName:'' }"/>
								<span class="errorMes">${errorMap.customerName==null?'':errorMap.customerName }</span>
							</div></li>
						<br />
						<li><label for="sex">性别<b>*</b></label> <input name="gender"
							type="radio" value="1" checked="checked" />
							男&nbsp;&nbsp;&nbsp;&nbsp; <input name="gender" type="radio"
							value="0" /> 女</li>
						<br />
						<li><cite> <label for="sex">会员<b>*</b></label> <input
								name="isVip" type="radio" value="1" checked="checked" />
								是&nbsp;&nbsp;&nbsp;&nbsp; <input name="isVip" type="radio"
								value="0" /> 否
						</cite></li>
						<br />
						<li><label for="name">身份证号码<b>*</b></label>
							<div class="vocation">
								<input name="idcard" required="required" pattern="\d{17}[0-9X]"
									type="text" class="dfinput" placeholder="请填写客户身份证号码"
									style="width: 344px;" value="${errorMap.idcard==null?inRoomInfo.idcard:'' }"/>
								<span class="errorMes">${errorMap.idcard==null?'':errorMap.idcard }</span>
							</div></li>
						<br />
						<li><label for="name">手机号码<b>*</b></label>
							<div class="vocation">
								<input name="phone" required="required" pattern="1[35789]\d{9}"
									type="text" class="dfinput" placeholder="请填写客户手机号码"
									style="width: 344px;" value="${errorMap.phone==null?inRoomInfo.phone:'' }"/>
								<span class="errorMes">${errorMap.phone==null?'':errorMap.phone }</span>
							</div></li>
						<br />
						<li><label for="name">押金<b>*</b></label>
							<div class="vocation">
								<input name="money" required="required" pattern="[1-9]\d*|0"
									type="text" class="dfinput" placeholder="请输入一个正数"
									style="width: 344px;" value="${errorMap.money==null?inRoomInfo.money:'' }"/>
								<span class="errorMes">${errorMap.money==null?'':errorMap.money }</span>
							</div></li>
						<br />
						<li><label for="date">入住时间<b>*</b></label>
							<div class="vocation">
								<input name="createDate" type="text"
									class="laydate-icon span1-1" id="Calendar"
									style="width: 324px; height: 30px; line-height: 28px; text-indent: 10px;" />
							</div></li>
						<br />
						<li><label>&nbsp;</label> <!-- <input name="" type="button" class="btn" value="入住"/> -->
							<input type="submit" class="btn" value="入住" /></li>
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
	</div>
</body>
</html>
