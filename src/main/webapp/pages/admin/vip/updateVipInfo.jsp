<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<base href="<%=basePath%>">
<link href="<%=basePath%>/static/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>/static//css/select.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="<%=basePath%>/static/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/static/js/jquery.idTabs.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/static/js/select-ui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/static/editor/kindeditor.js"></script>

<script type="text/javascript">
	KE.show({
		id : 'content7',
		cssPath : './index.css'
	});
</script>

</head>

<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">会员管理</a></li>
			<li><a href="#">修改会员</a></li>
		</ul>
	</div>

	<div class="formbody">


		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">修改会员</a></li>

				</ul>
			</div>

			<div id="tab1" class="tabson">

				<div class="formtext" >
					Hi，<b>admin</b>，请填写要修改的会员信息
				</div>
				<form id="fm1" action="<%=basePath %>/updateVipInfo.do" method="POST">
					<input name="id" type="hidden" value="${vipInfoMap.id }"></input>
					<ul class="forminfo">
						<li><label>会员姓名<b>*</b></label><input required="required" pattern=",{2, 20}" placeholder="长度为2-20位的字符" name="customerName" type="text"
							class="dfinput" id="name" value="${vipInfoMap.customer_name }" /></li>
							
						<li><label>性别<b>*</b></label>


							<div style="padding-top: 7px">
							<c:choose>
								<c:when test="${vipInfoMap.gender=='1' }">
									<input type="radio" name="gender" checked="checked" value="1"/>男 
									<input type="radio" name="gender" value="0"/>女
								</c:when>
								<c:otherwise>
									<input type="radio" name="gender" value="1"/>男 
									<input type="radio" name="gender" checked="checked" value="0"/>女
								</c:otherwise>
							</c:choose>
							<%-- 
							<c:choose>
								<c:when when test="${vipInfoMap.gender=='1' }">
									<input type="radio" name="gender" checked="checked" value="1"/>男
									<input type="radio" name="gender value="0"/>
								</c:when>
								<c:otherwise>
									<input type="radio" name="gender" value="1"/>男
									<input type="radio" name="gender" checked="checked" value="0"/>女
								</c:otherwise>
							</c:choose>
							--%>
							
							</div></li>
							
						<li>
							<label>折扣率<b>*</b></label>
							<div class="vocation">
								<select class="select1" name="vipRate">
									<option value="0.95">9.5折</option>
									<option value="0.9">9折</option>
									<option value="0.85">8.5折</option>
									<option value="0.8">8折</option>
								</select>
							</div>
						</li>	
						
						<li>
							<div style="position: relative">
								<label>身份证号码<b>*</b></label> <input required="required" pattern="\d{17}[0-9X]" placeholder="请输入正确的身份证号" name="idcard" type="text"
									class="dfinput" onblur="checkidentity()" id="identity" value="${vipInfoMap.idcard }" />
									
							</div>
							<div id="notice2"
								style="font-size: 14px; color: red; position: absolute; z-index: 1000; margin-top: -30px; margin-left: 450px">
							</div>
						</li>


						<li>
							<div>
								<label>手机号码<b>*</b></label> <input required="required" placeholder="请输入正确的手机号码" name="phone" type="text"
									class="dfinput" id="phone" onblur="checkphone()" value="${vipInfoMap.phone }" />
									
							</div>
							<div id="notice3"
								style="font-size: 14px; color: red; position: absolute; z-index: 1000; margin-top: -30px; margin-left: 450px">
							</div>

						</li>


						<!--<li><label>备注消息</label> <textarea id="content7"
								name="content"
								style="width: 700px; height: 250px; visibility: hidden;"></textarea>

						</li>-->
						<li><label>&nbsp;</label><input type="submit"
							class="btn" value="确认" /></li>
					</ul>
				</form>
			</div>
	<script type="text/javascript">
		$(function(){
			$("input[type=text]").focus(function(){
				$(".errorMsg").html("");
			});
			$("#fm1").submit(function(){
				$("input[type=submit]").attr("disabled","disabled");
			});
		});
	</script>

			
</body>

</html>




