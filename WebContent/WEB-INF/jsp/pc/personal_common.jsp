<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ck" uri="http://com.work/common"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html>
<head>
	<title>个人中心公共部分</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/personal_common.css">
</head>
<body>
	<div class="div_zhong_l">
		<div class="div_l_t">
			<div class="div_t"><img src="${user.headerImage}" width="100" height="100"></div>
		</div>
		<ul class="ul_l_l">
			<li><span class="span_0 span_1">姓名：${user.realName}</span></li>
			<li><span class="span_0 span_1">电话：${user.phone}</span></li>
			<li>
				<span class="span_0 span_e">邮箱：</span>
				<span class="span_0 span_f">${user.email}</span>
			</li>
			<li><a href="${ctx}/pc/personal/goPersonal.action" title="个人资料" target="_parent"><span class="span_1 span_l" align="center">个人资料</span></a></li>
			<li><a href="${ctx}/pc/personal/goPassword.action" title="设置密保" target="_parent"><span class="span_1 span_l" align="center">设置密保</span></a></li>
			<li><a href="${ctx}/pc/personal/goMyNotice.action" title="我的通知" target="_parent"><span class="span_1 span_l" align="center">我的通知</span></a><c:if test="${isNotice == 't'}"><span class="span_l_l"></span></c:if></li>
			<li><a href="${ctx}/pc/personal/goMyWork.action" title="我的兼职" target="_parent"><span class="span_1 span_l" align="center">我的兼职</span></a></li>
			<li><a href="${ctx}/pc/personal/goMyForum.action" title="我的帖子" target="_parent"><span class="span_1 span_l" align="center">我的帖子</span></a></li>
			<li><a href="${ctx}/pc/personal/goMyCollect.action" title="我的收藏" target="_parent"><span class="span_1 span_l" align="center">我的收藏</span></a></li>
		</ul>
	</div>
</body>
</html>