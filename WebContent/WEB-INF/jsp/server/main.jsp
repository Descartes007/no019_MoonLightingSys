<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet" href="${ctx}/server/layui/css/layui.css" media="all" />

<style>
.info-box {
	height: 85px;
	background-color: white;
	background-color: #ecf0f5;
}

.info-box .info-box-icon {
	border-top-left-radius: 2px;
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 2px;
	display: block;
	float: left;
	height: 85px;
	width: 85px;
	text-align: center;
	font-size: 45px;
	line-height: 85px;
	background: rgba(0, 0, 0, 0.2);
}

.info-box .info-box-content {
	padding: 5px 10px;
	margin-left: 85px;
}

.info-box .info-box-content .info-box-text {
	display: block;
	font-size: 16px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	text-transform: uppercase;
}

.info-box .info-box-content .info-box-number {
	display: block;
	font-weight: bold;
	font-size: 25px;
}

.major {
	font-weight: 10px;
	color: #01AAED;
}

.main {
	margin-top: 10px;
}

.main .layui-row {
	margin: 10px 0;
}

.info-box i {
	font-size: 1em;
	color: #fff;
}

.tmiddle {
	text-align: center;
	padding-top: 15px !important;
	cursor: pointer
}
</style>
</head>
<body>
	<div class="layui-fluid main">
		<div class="layui-row layui-col-space15">
			<!-- <div class="layui-col-md4">
				<div class="info-box">
					<span class="info-box-icon"
						style="background-color: #FF5722 !important; color: white;">
						<i class="layui-icon">&#xe612;</i>
					</span>
					<div class="info-box-content tmiddle">
						<span class="info-box-number">1</span> <span
							class="info-box-text">机器人总数</span>
					</div>
				</div>
			</div>
			<div class="layui-col-md4">
				<div class="info-box">
					<span class="info-box-icon"
						style="background-color: #FF5722 !important; color: white;">
						<i class="layui-icon">&#xe612;</i>
					</span>
					<div class="info-box-content tmiddle">
						<span class="info-box-number">1</span> <span
							class="info-box-text">空闲机器人总数</span>
					</div>
				</div>
			</div>
			<div class="layui-col-md4">
				<div class="info-box">
					<span class="info-box-icon"
						style="background-color: #009688 !important; color: white;">
						<i class="layui-icon">&#xe613;</i>
					</span>
					<div class="info-box-content tmiddle">
						<span class="info-box-number">1</span> <span
							class="info-box-text">非空闲机器人总数</span>
					</div>
				</div>
			</div> -->
		</div>
	</div>
	<div class="layui-fluid main">
	    <h3 style="font-style:italic;">欢迎进入大学生校园兼职平台管理系统</h3>
		<!-- <div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="sysNotice col">
					<blockquote class="layui-elem-quote title">基础统计</blockquote>
					<div class="layui-elem-quote layui-quote-nm"
						style="text-align: center">图形统计区域</div>
				</div>
			</div>
		</div> -->
	</div>
<script type="text/javascript" src="${ctx}/server/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/server/layui/layui.js"></script>
</body>
</html>