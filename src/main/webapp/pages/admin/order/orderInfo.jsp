<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=basePath %>/static/css/style.css" rel="stylesheet" type="text/css" />
<!-- 引入bootstrap分页 -->
<link rel="stylesheet" href="<%=basePath%>/static/js/bootstrap/bootstrap.css" />
<script src="<%=basePath%>/static/js/bootstrap/jquery.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap/bootstrap.min.js"></script>
<script src="<%=basePath%>/static/js/bootstrap/bootstrap-paginator.js"></script>
<script>
$(function() {
	$('#pagination').bootstrapPaginator({
		bootstrapMajorVersion: 3,
		currentPage: ${requestScope.pageInfo.pageNum },
		totalPages: ${requestScope.pageInfo.pages },
		pageUrl: function(type, page, current) {
			return 'getAllOrders.do?pageNum=' + page;
		},
		itemTexts: function(type, page, current) {
			switch(type) {
				case "first":
					return "首页";
				case "prev":
					return "上一页";
				case "next":
					return "下一页";
				case "last":
					return "末页";
				case "page":
					return page;
			}
		}
	});
});
</script>
<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>
</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="main.html">首页</a></li>
			<li><a href="#">订单管理</a></li>
			<li><a href="#">订单信息查询</a></li>
		</ul>
	</div>
	<div class="rightinfo">
		<div class="tools">
			<ul class="toolbar">
				<li class="click"><span><img
						src="<%=basePath %>/static/images/t01.png" /></span>添加</li>
				<li class="click"><span><img
						src="<%=basePath %>/static/images/t02.png" /></span>修改</li>
				<li><span><img src="<%=basePath %>/static/images/t03.png" /></span>删除</li>
			</ul>

			<div class="toolbar1">
				<table>
					<form method="post" name="serch" 
					action="<%=basePath %>/getOrderByCondition.do">
						<tr>
							<td class="zi"><span>选择分类：</span></td>
							<td><select name="type">
									<option value="1">订单编号</option>
									<option value="2">订单金额</option>
									<option value="3">订单状态</option>
									<option value="4">房间号</option>
								</select>
							</td>
							<td class="zi"><span>关键字：</span></td>
							<td><input name="keyWord" type="text" placeholder="与分类关联" /></td>
							<td><input type="submit" value="查询" class="button" /></td>
						</tr>
					</form>
				</table>
			</div>

		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input name="" type="checkbox" value="" checked="checked" /></th>
					<th>序号</th>
					<th>订单编号</th>
					<th>房间号</th>
					<th>客人姓名</th>
					<th>订单金额</th>
					<th>结算状态</th>
					<th>订单时间</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageInfo.list }" var="map" varStatus="num">
					<tr>
						<td><input name="" type="checkbox" value="" /></td>
						<td>${num.count }</td>
						<td>${map.order_num }</td>
						<td>${map.room_num }</td>
						<td>${map.customer_name }</td>
						<td>${map.order_money }</td>
						<td>${map.order_status=='1'?'已结算':'未结算' }</td>
						<td>${map.create_date }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- 把分页搞出来 -->
		<ul id="pagination"></ul>

		<div class="tip">
			<div class="tiptop">
				<span>提示信息</span><a></a>
			</div>
			<div class="tipinfo">
				<span><img src="images/ticon.png" /></span>
				<div class="tipright">
					<p>是否确认对信息的修改 ？</p>
					<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
				</div>
			</div>
			<div class="tipbtn">
				<input name="" type="button" class="sure" value="确定" /> &nbsp; <input
					name="" type="button" class="cancel" value="取消" />
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
