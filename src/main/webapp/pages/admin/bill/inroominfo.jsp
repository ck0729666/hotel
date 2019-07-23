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
			return '/getInRoomInfo.do?pageNum=' + page;
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
			<li><a href="#">入住管理</a></li>
			<li><a href="#">入住信息查询</a></li>
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

			<div class="toolbar1">
				<table>
					<form method="post" name="serch"
						action="<%=basePath%>/getInRoomInfoByCondition.do">
						<tr>
							<td class="zi"><span>选择分类：</span></td>
							<td><select name="type">
									<option value="1">房间号</option>
									<option value="2">客人姓名</option>
									<option value="3">手机号码</option>
									<option value="4">身份证号码</option>
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
					<th><input id="selectAll" name="" type="checkbox" value="" /></th>
					<th>编号</th>
					<th>房间号</th>
					<th>房间类型</th>
					<th>客人姓名</th>
					<th>性别</th>
					<th>身份证号码</th>
					<th>手机号码</th>
					<th>押金</th>
					<th>入住时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.pageInfo.list }" var="map"
					varStatus="num">
					<tr>
						<td><input name="ck" type="checkbox" value="${map.id}" /></td>
						<td>${num.count }</td>
						<td>${map.room_num }</td>
						<td>${map.room_type_name }</td>
						<td>${map.customer_name }</td>
						<td>${map.gender }</td>
						<td>${map.idcard }</td>
						<td>${map.phone }</td>
						<td>${map.money }</td>
						<td>${map.create_date }</td>
						<td>
							<c:choose>
								<c:when test="${map.out_room_status=='0' }">
									<a href="">退房</a>
								</c:when>
								<c:otherwise>
									<!-- 0为退房，1已退房 -->
									<a href="javascript:void(0)" class="tablelink">已退房</a>
								</c:otherwise>
							</c:choose>
						
						
							<a iri="${map.id }" id="delBtn" href="javasrcipt:viod(0)"
							class="tablelink"> 删除</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- bootstrap的分页 -->
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
	
	
	$(function(){
		/*删除操作*/
		$("#delBtn").click(function(){
			/*
			window.confirm()方法是有返回值的,返回值为true,false两种情况
           window.confirm()方法在页面上显示带确定"和"取消"按钮的提示信息,
           当点"确定"的时候,返回值为true;当点"取消"按钮的时候,返回值为false.
			*/
			var flag = window.confirm("您确认要删除本条记录吗？");
			if(flag){
				var iri = $(this).attr("iri");
				$.ajax({
					url:"<%=basePath%>/delInRoomInfo.do",
					type:"POST",
					data:{id:iri},
					dataType:"JSON",
					success:function(result){
						if(result){
							window.location.reload();
						}else{
							window.alert("删除失败，请重新操作！");
						}
					}
				});
			}
		});
		
	<%--	
		$("#delBtn").click(function(){
			var flag = window.confirm("are you sure?");
			if(flag){
				var iri = $(this).attr("iri");
				$.ajax({
					url:"<%=basePath%>/delInRoomInfo.do",
					type:"POST",
					data:{id:iri},
					dataTyep:"JSON",
					success:function(result){
						if(result){
							window.location.reload();
						}else{
							window.alert("fail!");
						}	
					}
				});
			}
		});
	--%>
		
		/*全选复选框按钮*/
		$("#selectAll").change(function(){
			//prop()方法设置或返回被选元素的属性和值
			var flag = $(this).prop("checked");
			if(flag){//全选
				$("input[name=ck]").prop("checked",true);
			}else{//全部取消
				$("input[name=ck]").prop("checked",false);
			}
		});
		
	<%--
		$("#selectAll").change(function(){
			//prop()方法设置或返回被选元素的属性和值
			var flag = $(this).prop("checked");
			if(flag){//全选
				$("input[name=ck]").prop("checked",true);
			}else{//取消
				$("input[name=ck]").prop("cjecked",false);
			}
		});
	--%>
	
	<%--
		$("batchDel").click(function(){
			var $ckChecked = $("input[name=ck]:checked");
			var len = $("input[name=ck]:checked").size();
			if(len>0){
				var ids = "";
				$ckChecked.each(function(index, dom){
					var id = $(dom).val();
					ids += id + ",";//1,2,3,
				});
				$.ajax({
					url:"<%=basePath%>/batchDel.do",
					type:"POST",
					dataType:"JSON",
					data:{idAttr:ids},
					success:function(result){
						if(result){
							window.location.reload();
						}else{
							alert("fail!");
						}
					}
				});
			}else{
				alert("请选择记录！");
			}
		});
	--%>
	
		/*批量删除*/
		$("#batchDel").click(function(){
			//先判断有没有被勾选
			var $ckChecked = $("input[name=ck]:checked");
			var len = $("input[name=ck]:checked").size();
			if(len>=1){
				var ids = "";
				$ckChecked.each(function(index,dom){
					var id = $(dom).val();
					ids += id+",";
				});
				//将多个id传递给后台的controller方法
				$.ajax({
					url:"<%=basePath%>/batchDel.do",
					type:"POST",
					dataType:"JSON",
					data:{idAttr:ids},
					success:function(result){
						if(result){
							window.location.reload();
						}else{
							alert("批量删除失败");
						}
					}
				});
			}else{
				alert("亲，请选择要删除的记录！");
			}
		});
	});
	
	
</script>
</body>
</html>
