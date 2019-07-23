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
			return '/getHouseInfo.do?pageNum=' + page;
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
			<li><a href="#">客房管理</a></li>
			<li><a href="#">客房信息查询</a></li>
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
						action="<%=basePath%>/getHouseInfoByCondition.do">
						<tr>
							<td class="zi"><span>选择分类：</span></td>
							<td><select id="condition" name="type">
									<option value="1">房间类型</option>
									<option value="2">房间状态</option>
							</select></td>
							<td class="zi"><span>关键字：</span></td>
							<td>
								<select id="kw" name="keyword" >
									<option value="0">请选择</option>
								</select>
							</td>
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
					<th>房间单价</th>
					<th>房间状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<!-- 
				
				   <c:forEach var="每个变量名字" items="要迭代的list" varStatus="每个对象的状态" begin="循环从哪儿开始" end="循环到哪儿结束" step="循环的步长">

        					循环要输出的东西

  				   </c:forEach>
				
				
				
				
				
				 -->
			
			
			
				<c:forEach items="${requestScope.pageInfo.list }" var="map"
					varStatus="num">
					<tr>
						<td><input name="ck" type="checkbox" value="" /></td>
						<td>${num.count }</td>
						<td>${map.room_num }</td>
						<td>${map.room_type_name }</td>
						<td>${map.room_price }</td>
						<td>
							<c:if test="${map.room_status=='0' }"><span style="color:blue">空闲</span></c:if>
							<c:if test="${map.room_status=='1' }"><span style="color:red">已入住</span></c:if>
							<c:if test="${map.room_status=='2' }"><span style="color:green">打扫</span></c:if>
						</td>
						<td>					
									<a href="">修改</a>
							<a iri="" id="delBtn" href="javasrcipt:viod(0)"
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
		/*给选择分类添加事件*/
		$("#condition").change(function(){
			var flag = $("#condition>option:selected").val();
		
			//alert(flag);
			if(flag==1){//房价类型
				$("#kw>option").remove();
				//$("#kw").append("<option value='0'>单人间</option><option value='1'>双人间</option><option value='2'>总统房</option>");
				//触发ajax事件，动态获取数据
				$.ajax({
					url:"<%=basePath %>/getRoomType.do",
					type:"POST",
					dataType:"json",
					success:function(result){
						var content="";
						for(var i in result){
							content+="<option value='"+ result[i].id +"'>"+result[i].room_type_name+"</option>";
							//alert(i+","+result[i].room_type_name);
						}	
						$("#kw").append(content);
					}
				});
			}else if(flag==2){//房间状态
				$("#kw>option").remove();
				$("#kw").append("<option value='0'>空闲</option><option value='1'>已入住</option><option value='2'>打扫</option>");
			}
		});
	});
	
	
</script>
</body>
</html>
