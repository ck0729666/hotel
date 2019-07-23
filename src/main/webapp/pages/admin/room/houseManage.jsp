<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=basePath%>/static/css/style.css" rel="stylesheet"
	type="text/css" />
<!-- 引入bootstrap分页 -->
<!-- 引入bootstrap分页 -->
<link rel="stylesheet"
	href="<%=basePath%>/static/js/bootstrap/bootstrap.css" />
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
			return '/getHouseManage.do?pageNum=' + page;
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
	  $.ajax({
		  	url:"<%=basePath %>/addRoomType.do",
			type:"POST",
			dataType:"json",
			data:{
				roomTypeName:$("input[name=roomTypeName]").val(),
				roomPrice:$("input[name=roomPrice]").val()
			},
			success:function(result){
				if(result){//添加成功
					  $(".tip").fadeOut(100);
					  window.location.reload();
				}else{//添加失败
					 alert("数据添加失败，请重新添加");
				}
			}
	  });
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
			<li><a href="#">客房管理</a></li>
			<li><a href="#">客房信息管理</a></li>
		</ul>
	</div>
	<div class="rightinfo">
		<div class="tools">
			<ul class="toolbar">
				<li class="click"><span><img
						src="<%=basePath%>/static/images/t01.png" /></span>添加</li>
				<li class="click"><span><img
						src="<%=basePath%>/static/images/t02.png" /></span>修改</li>
				<li id="batchDel"><span><img src="<%=basePath%>/static/images/t03.png" /></span>删除</li>
			</ul>

			
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input id="selectAll" name="" type="checkbox" value="" /></th>
					<th>编号</th>
					<th>房间类型</th>
					<th>房间单价</th>
	
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.pageInfo.list }" var="map"
					varStatus="num">
					<tr>
						<td><input name="ck" type="checkbox" value="" /></td>
						<td>${num.count }</td>
						<td>${map.room_type_name }</td>
						<td>${map.room_price }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- bootstrap的分页 -->
		<!-- 把分页搞出来 -->
		<ul id="pagination"></ul>


		<!-- 客房类型添加 -->
		<div class="tip">
			<div class="tiptop">
				<span>添加客房类型</span><a></a>
			</div>
			<form action="javascript:void(0)">
			<div class="tipinfo">
				
				<div class="tipright">

					<cite>
						<table width="360px" height="80px">
							<tr>
								<td>房间类型：</td>
								<td><input style="width:300px;height:35px; border:solid 1px #D7A372" type="text" name="roomTypeName" required="required" placeholder="请输入3-10位的中文"></input></td>
							</tr>
							<tr>
								<td>房间单价：</td>
								<td><input style="width:300px;height:35px; border:solid 1px #D7A372" type="text" name="roomPrice" required="required" placeholder="请输入一个整数"></input></td>
							</tr>
						</table>

					</cite>
				</div>
			</div>
			<div class="tipbtn">
				<input name="" type="submit" class="sure" value="确定" /> &nbsp; <input
					name="" type="button" class="cancel" value="取消" />
			</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	
	
	
	
</script>
</body>
</html>
