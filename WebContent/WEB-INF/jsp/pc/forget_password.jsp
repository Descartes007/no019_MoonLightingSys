<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>找回密码</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/forget_password.css">
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
					<h2 align="center">找回密码</h2><br>
					<div>
						<span align="right">问题：</span><p class="in">${user.question}</p>
					</div>
					<div>
						<span class="msg biao_msg"></span>
					</div>
					<div>
						<span align="right">答案：</span><textarea name="work" class="input_work" maxlength="50" placeholder="请输入找回密码答案"></textarea>
					</div>
					<div class="flex-box">
						<span class="msg work_msg"></span>
					</div>
					
					<input type="button" value="找回密码" class="input_fabu">
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/pc/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
		//找回密码前，选项是否为空
		$(".input_fabu").click(function(){
			if($(".input_work").val()=="") {
				$(".work_msg").text("答案不能为空！");
			}
			else{
				$.ajax({
	                 type: "POST",
	                 url: "${ctx}/pc/login/isAnswer.action",
	                 data: {
	                     userId: "${user.userId}",
	                     answer: $(".input_work").val()
	                 },
	                 success: function(res) {
	                     if (res.code == 0) {
	                    	 window.location.href="${ctx}/pc/login/goSetPassword.action";
	                     } else {
	                    	 $(".work_msg").text(res.msg);
	                     }
	                 },
	                 error: function(res) {
	                	 $(".work_msg").text("网络错误");
	                 }
	             });
			} 
		});
	</script>
</body>
</html>