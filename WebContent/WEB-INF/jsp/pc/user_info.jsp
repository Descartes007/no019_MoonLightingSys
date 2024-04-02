<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ck" uri="http://com.work/common"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>查看用户资料</title> 
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/user_data.css">
	<link rel="icon" type="image/x-icon" href="${ctx}/pc/images/titleLogo.png">
	
</head>
<body>
	<div class="top">
		<div class="div_logo">
   			<a href="${ctx}/pc/index/goIndex.action" title="返回首页"><img src="${systemUpset.companyLogo}"></a>
   		</div>
	</div>
	<div class="data">
		<div class="data_zhong">
			<div class="data_z">
				<div class="div_data">
					<div class="div_tou">
						<div class="div_t"><img src="${user.headerImage}" width="120" height="120"></div>
					</div>
					<div class="div_z div_zhang"><span>账号：${user.userId}</span><span>昵称：${user.nickName}</span></div>
					<div class="div_z div_xing"><span>姓名：${user.realName}</span><span>性别：<c:if test="${user.sex == 1}">男</c:if><c:if test="${user.sex == 0}">女</c:if></span></div>
					<div class="div_z div_user"><span>类型：${user.userCategory}</span><span>电话：${user.phone}</span></div>
					<div class="div_z div_e"><span>邮箱：${user.email}</span></div>
					<div class="div_z div_char"><input type="button" class="input_chat" value="与ta聊天"></div>
					
				</div>
			</div>
		</div>
	</div>
	<div class="bottom">
		
	</div>
	<script type="text/javascript" src="${ctx}/pc/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
	$(".input_chat").click(function(){
		if("${user.userId}"=="${pcUser.userId}"){
			alert("不能和自己聊天，请返回！");
		}else{
			window.location.href="${ctx}/pc/index/goChat.action?userId=${user.userId}";
		}
	});
	</script>
</body>
</html>