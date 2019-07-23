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
<title>系统菜单</title>
<link href="<%=basePath%>/static/css/style.css" rel="stylesheet"
	type="text/css" />
<script language="JavaScript"
	src="<%=basePath%>/static/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		//导航切换
		$(".menuson .header").click(
				function() {
					var $parent = $(this).parent();
					$(".menuson>li.active").not($parent).removeClass(
							"active open").find('.sub-menus').hide();

					$parent.addClass("active");
					if (!!$(this).next('.sub-menus').size()) {
						if ($parent.hasClass("open")) {
							$parent.removeClass("open").find('.sub-menus')
									.hide();
						} else {
							$parent.addClass("open").find('.sub-menus').show();
						}

					}
				});

		// 三级菜单点击
		$('.sub-menus li').click(function(e) {
			$(".sub-menus li.active").removeClass("active")
			$(this).addClass("active");
		});

		$('.title').click(function() {
			var $ul = $(this).next('ul');
			$('dd').find('.menuson').slideUp();
			if ($ul.is(':visible')) {
				$(this).next('.menuson').slideUp();
			} else {
				$(this).next('.menuson').slideDown();
			}
		});
	})
</script>
</head>

<body style="background: #fff3e1;">
	<div class="lefttop">
		<span></span>功能菜单
	</div>
	<dl class="leftmenu">
		<c:forEach items="${sessionScope.oneMenuList }" var="OneMenu">
			<dd>
				<!-- 一级菜单 -->
				<div class="title">
					<span><img src="<%=basePath%>/static/images/leftico03.png" /></span>${OneMenu.oneName }
				</div>
				<!-- 二级菜单 -->
				<ul class="menuson">
					<c:forEach items="${pageScope.OneMenu.twoMenuList }" var="twoMenu">
						<li>
							<div class="header">
								<cite></cite> <a href="${twoMenu.twoUrl }" target="rightFrame">${twoMenu.twoName}</a>
								<i></i>
							</div>
						</li>
					</c:forEach>
				</ul>
			</dd>
		</c:forEach>
	</dl>
</body>
</html>
