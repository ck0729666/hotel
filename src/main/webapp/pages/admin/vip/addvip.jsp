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

		$("#name").blur(function() {
			$(this).css("background-color", "#FFF")
			var text = $(this).val();
			if (text == "") {
				$(this).val("请填写姓名");
			}
		});

	});

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
</script>
</head>

<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">会员管理</a></li>
			<li><a href="#">添加会员</a></li>
		</ul>
	</div>

	<div class="formbody">


		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">添加会员</a></li>

				</ul>
			</div>

			<div id="tab1" class="tabson">

				<div class="formtext">
					Hi，<b>admin</b>，请填写要添加的会员信息
				</div>
				<form id="fm1" action="<%=basePath%>/addVipInfo.do" method="POST">
					<ul class="forminfo">
						<li>
							<label>会员姓名<b>*</b></label>
							<input required="required" pattern=".{2,20}" placeholder="长度为2-20位的字符" name="customerName" type="text"
								class="dfinput" id="name" value="${errorMap.customerName==null?vip.customerName:'' }"/>
							<span class="errorMsg" style="color:red;font-size:12px">${errorMap.customerName==null?'':errorMap.customerName }</span>
						</li>
						
						<li><label>性别<b>*</b></label>


							<div style="padding-top: 7px">
								<input type="radio" name="gender" checked="checked" value="1"/>男 <input
									type="radio" name="gender" value="0"/>女
							</div></li>

						<li>
							<div style="position: relative">
								<label>身份证号码<b>*</b></label> <input required="required" pattern="\d{17}[0-9X]" placeholder="请输入正确的身份证号" name="idcard" type="text"
									class="dfinput" onblur="checkidentity()" id="identity" value="${errorMap.idcard==null?vip.idcard:'' }"/>
									<span class="errorMsg" style="color:red;font-size:12px">${errorMap.idcard==null?'':errorMap.idcard }</span>
							</div>
							<div id="notice2"
								style="font-size: 14px; color: red; position: absolute; z-index: 1000; margin-top: -30px; margin-left: 450px">
							</div>
						</li>


						<li>
							<div>
								<label>手机号码<b>*</b></label> <input required="required" pattern="1[35789]\d{9}" placeholder="请输入正确的手机格式" name="phone" type="text"
									class="dfinput" id="phone" onblur="checkphone()" value="${errorMap.phone==null?vip.phone:'' }"/>
								<span class="errorMsg" style="color:red;font-size:12px">${errorMap.phone==null?'':errorMap.phone }</span>
							</div>
							<div id="notice3"
								style="font-size: 14px; color: red; position: absolute; z-index: 1000; margin-top: -30px; margin-left: 450px">
							</div>

						</li>


						<!-- <li><label>备注消息</label> 
						<textarea id="content7" name="content" style="width: 700px; height: 250px; visibility: hidden;"></textarea>
						</li> -->
						<li><label>&nbsp;</label><input  type="submit"
							class="btn" value="确认"/></li>
					</ul>
				</form>

			</div>
<script type="text/javascript">
	$(function(){
		$("input[type=text]").focus(function(){
			$(".errorMsg").html("");
		});
		
		/* 防止表单重复提交 */
		$("#fm1").submit(function(){
			$("input[type=submit]").attr("disabled", "disabled");
			$("input[type=submit]").css({
				background:'#ccc'
			});
		});
		
		
		
		
		
		
		
		
		
		
		
		
	});
</script>
</body>

</html>
