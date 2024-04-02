<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>设置密码</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/set_password.css">
	<link rel="icon" type="image/x-icon" href="${ctx}/pc/images/titleLogo.png">
	
</head>
<body>
	<div class="top">
		<div class="div_logo">
   			<a href="${ctx}/pc/index/goIndex.action" title="返回首页"><img src="${systemUpset.companyLogo}"></a>
   		</div>
	</div>
	<div class="publish">
		<div class="publish_zhong">
			<div class="publish_z">
				<form class="form_work">
					<h2 align="center">设置密码</h2><br>
					<span align="right">新的密码：</span><input type="password" name="password" class="in input_password" maxlength="20" placeholder="请输入密码"><br>
					<span class="msg password_msg"></span><br>
					<span align="right">确认密码：</span><input type="password" name="password" class="in input_password_2" maxlength="20" placeholder="请确认密码"><br>
					<span class="msg password_msg_2"></span><br>
					
					<input type="button" value="立即设置" class="input_fabu">
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/pc/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
		
	// 判断密码
	$(".input_password").focusout(function(){
		if ($(".input_password").val()=="") {
			$(".password_msg").text("密码不能为空！");
		}
		else if($(".input_password").val().length < 6){
			$(".password_msg").text("密码不能小于6位数！");
		}
		else if(!/^\w+$/.test($(".input_password").val())){
			$(".password_msg").text("密码只能由数字、字母或下划线组成！");
		}
		else{
			$(".password_msg").text("");
		}
	})
	// 判断确认密码
	$(".input_password_2").focusout(function(){
		if ($(".input_password_2").val()=="") {
			$(".password_msg_2").text("确认密码不能为空！");
		}
		else if($(".input_password_2").val().length < 6){
			$(".password_msg_2").text("确认密码不能小于6位数！");
		}
		else if(!/^\w+$/.test($(".input_password_2").val())){
			$(".password_msg_2").text("确认密码只能由数字、字母或下划线组成！");
		}
		else if($(".input_password_2").val() != $(".input_password").val()){
			$(".password_msg_2").text("前后密码不一致！");
			$(".input_password_2").val("");
		}
		else{
			$(".password_msg_2").text("");
		}
	})
	//确认修改密码前判断各项是否正常
	$(".input_fabu").click(function(){
		if ($(".input_password").val()=="") {
			$(".password_msg").text("密码不能为空！");
		}
		else if($(".input_password").val().length < 6){
			$(".password_msg").text("密码不能小于6位数！");
		}
		else if(!/^\w+$/.test($(".input_password").val())){
			$(".password_msg").text("密码只能由数字、字母或下划线组成！");
		}
		else if($(".input_password_2").val() != $(".input_password").val()){
			$(".password_msg_2").text("前后密码不一致！");
			$(".input_password_2").val("");
		}
		else{
			$.ajax({
                type: "POST",
                url: "${ctx}/pc/login/updatePassword.action",
                data: {
                    password: $(".input_password").val(),
                    passwordYes: $(".input_password_2").val(),
                },
                success: function(res) {
                    if (res.code == 0) {
                    	alert("设置密码成功");
                    	window.location.href="${ctx}/pc/login/goLogin.action";
                    } else {
                  	  	$(".password_msg_2").text(res.msg);
                    }
                },
                error: function(res) {
              	  $(".password_msg_2").text("网络错误");
                }
            });
		}
		
	})
	</script>
</body>
</html>