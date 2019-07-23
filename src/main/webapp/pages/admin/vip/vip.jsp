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
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%= basePath%>/static/css/style.css" rel="stylesheet" type="text/css" />

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
				return 'getAllVip.do?pageNum=' + page;
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
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <li><a href="main.html">首页</a></li>
    <li><a href="#">会员管理</a></li>
    <li><a href="#">会员信息查询</a></li>
  </ul>
</div>
<div class="rightinfo">
  <div class="tools">
    <ul class="toolbar">
      <li class="click"><span><img src="<%= basePath%>/static/images/t01.png" /></span>添加</li>
      <li id="update" class="click"><span><img src="<%= basePath%>/static/images/t02.png" /></span>修改</li>
      <li><span><img src="<%= basePath%>/static/images/t03.png" /></span>删除</li>
    </ul>
    <div class="toolbar1">
      <table>
        <form method="get" name="serch">
          <tr>
            <td class="zi"><span>选择分类：</span></td>
            <td><select>
                <option>会员卡号</option>
                <option>会员姓名</option>
                <option>手机号码</option>
                <option>身份证号码</option>
              </select></td>
            <td class="zi"><span>关键字：</span></td>
            <td><input type="text" placeholder="与分类关联"/></td>
            <td><input type="submit" value="查询" class="button"/></td>
          </tr>
        </form>
      </table>
    </div>
  </div>
  <table class="tablelist">
    <thead>
      <tr>
        <th><input name="" type="checkbox" value=""/></th>
        <th>编号</th>
        <th>会员卡号</th>
        <th>会员姓名</th>
        <th>性别</th>
        <th>身份证号码</th>
        <th>手机号码</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
	    <c:forEach items="${pageInfo.list }" var="map" varStatus="num">
		    <tr>
		        <td><input name="flag" type="checkbox" value="${map.id}" /></td>
		        <td>${num.count }</td>
		        <td>${map.vip_num }</td>
		        <td>${map.customer_name }</td>
		        <td>${map.gender=='1'?'男':'女' }</td>
		        <td>${map.idcard }</td>
		        <td>${map.phone }</td>
		       
		        <td> <a href="#" class="tablelink"> 删除</a></td>
		     </tr>
	    </c:forEach>
    </tbody>
  </table>
  
  <!-- 分页 -->
  <ul id="pagination"></ul>
  
  <div class="pagin">
    <div class="message">共<i class="blue">1234</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
    <ul class="paginList">
      <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
      <li class="paginItem current"><a href="javascript:;">1</a></li>
      <li class="paginItem"><a href="javascript:;">2</a></li>
      <li class="paginItem"><a href="javascript:;">3</a></li>
      <li class="paginItem"><a href="javascript:;">4</a></li>
      <li class="paginItem"><a href="javascript:;">5</a></li>
      <li class="paginItem more"><a href="javascript:;">...</a></li>
      <li class="paginItem"><a href="javascript:;">10</a></li>
      <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
    </ul>
  </div>
  
  
  </div>
</div>
	<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
	<%--
	<script type="text/javascript">
	$(function(){
		$("#update").click(function(){
			var $cks = $("input[name=flag]:checked");
			if($cks.size()==0){
				alert("faile");
			}else if($cks.size()>1){
				alert("faile");
			}else{//选中一条
				var id = $("input[name=type]:checked").val();
				//当前页面打开url页面
				window.location.href="<%=basePath%>/getVipInfoById.do?id=" + id;
			}
		});
	});
	</script>
	--%>
	<script type="text/javascript">
		$(function(){
			$("#update").click(function(){
				var $cks = $("input[name=flag]:checked");
				if($cks.size()==0){
					alert("亲，请选择要修改的数据");
				} else if($cks.size()>1){
					alert("亲，只能一条一条的修改呢");
				} else{//选中了一条
					var id = $("input[name=flag]:checked").val();
					//alert(id);
					//当前页面打开URL页面
					window.location.href="<%=basePath%>/getVipInfoById.do?id="+id;
				}
			});
		});
	</script>

</body>
</html>
