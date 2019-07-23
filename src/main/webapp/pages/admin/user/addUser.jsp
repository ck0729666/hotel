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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<base href="<%=basePath%>">
<link href="<%=basePath%>/static/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>/static/css/select.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="<%=basePath%>/static/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/static/js/jquery.idTabs.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/static/js/select-ui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/static/js/editor/kindeditor.js"></script>

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

		/* $("#name").focus(function() {
			$(this).css("background-color", "#0FF")
			var text = $(this).val();
			if (text == "请填写姓名") {
				$(this).val("");
			}
		}); */
	

	function checkidentity() {
		var id = $("#identity").val();
		var notice2 = $("#notice2");
		var regid = /^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
		if (regid.test(id) == false) {
			$(notice2).html("身份证输入不合法");
			return false;
		} else {
			$(notice2).html("");
			return true;
		}
	}

	function checkphone() {
		var id = $("#phone").val();
		var notice3 = $("#notice3");
		var regid = /^[1-9]{8,11}$/;
		if (regid.test(id) == false) {
			$(notice3).html("电话号码输入不合法");
			return false;
		} else {
			$(notice3).html("");
			return true;
		}
	}
});
</script>
</head>

<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">用户管理</a></li>
			<li><a href="#">添加用户</a></li>
		</ul>
	</div>

	<div class="formbody">


		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">添加用户</a></li>

				</ul>
			</div>

	
				

				<form id="fm1" action="javascript:void(0)" method="POST">
					<ul class="forminfo">
						<li>
							<label>用户号<b>*</b></label>
							<input required="required" placeholder="3-12位数字、字母或下划线组合" name="username" type="text" class="dfinput" id="name"/>
						</li>
						<li>
							<label>密码<b>*</b></label> 
			
								<input required="required" placeholder="6-20位数字、字母或下划线组合" name="pwd" type="text" class="dfinput" id="name"/>
						
							<div id="notice2"
								style="font-size: 14px; color: red; position: absolute; z-index: 1000; margin-top: -30px; margin-left: 450px">
							</div>
						</li>
						<li>
							<label>授权<b>*</b></label> 
							<table border="1px" with="600px" height="100px" cellspacing="0px">
								<c:forEach items="${oneMenuList }" var="oneMenu">
									<tr>
										<td width="80px">
											<input type="hidden" name="oneMenu" value="${oneMenu.id }"></input>
											${oneMenu.oneName }
										</td>
										<td>
											<c:forEach items="${oneMenu.twoMenuList }" var="twoMenu">
												<input oneId="${oneMenu.id }" type="checkbox" name="twoMenu" value="${twoMenu.twoId }"/>${twoMenu.twoName }&nbsp;&nbsp;&nbsp;
											</c:forEach>
										</td>
									</tr>
								</c:forEach>
							</table>
							<div id="notice3"
								style="font-size: 14px; color: red; position: absolute; z-index: 1000; margin-top: -30px; margin-left: 450px">
							</div>
						</li>
						<li><label>&nbsp;</label><input  type="submit"
							class="btn" value="确认"/></li>
					</ul>
				</form>

			</div>
<script type="text/javascript">
	$(function(){
		/* 防止表单重复提交 */
		$("#fm1").submit(function(){
			$("input[type=submit]").attr("disabled","disabled");
			$("input[type=submit]").css({
				background:'#ccc'
			});
	
		//传递数据
		var uName = $("input[name=username]").val();
		var pwd = $("input[name=pwd]").val();
		//获取被勾选的二级权限id
		var $tmChecked = $("input[name=twoMenu]:checked");
		var twoIdStr = "";
		//获取一级权限id
		var oneIdStr = "";
		$tmChecked.each(function(index,dom){
			twoIdStr += $(dom).val() + ",";
			oneIdStr += $(dom).attr("oneId")+",";
		});
		
		//执行ajax操作，将数据保存到数据库中
		$.ajax({
			url:"<%=basePath%>/addUser.do",
			type:"post",
			dataType:"json",
			data:{
				username:uName,
				password:pwd,
				oneIds:oneIdStr,
				twoIds:twoIdStr
			},
			success:function(result){
				if(result){//授权成功
					window.location.href="<%=basePath%>/getUserInfo.do";
				}else{//授权失败
					alert("添加用户失败");
				}
			}
		});
	});
});
</script>
</body>

</html>



















