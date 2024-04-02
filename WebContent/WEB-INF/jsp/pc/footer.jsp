<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ck" uri="http://com.work/common"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html>
<head>
	<title>公共尾部</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/footer.css">
</head>
<body>
	<div class="banquan">
		<div class="banquan_zhong">
			<ul class="ul_banquan_1">
				<li class="li_banquan">友情链接</li>
				<li><a href="https://www.baidu.com/" title="百度一下" target="_blank"><span>百度一下</span></a></li>
				<li><a href="http://www.qq.com/" title="腾讯官网" target="_blank"><span>腾讯</span></a></li>
				<li><a href="https://store.meizu.com/" title="魅族官网" target="_blank"><span>魅族</span></a></li>
				<li><a href="https://www.jd.com/" title="京东官网" target="_blank"><span>京东</span></a></li>
				<li><a href="https://www.huawei.com/cn/" title="华为官网" target="_blank"><span>华为</span></a></li>
			</ul>
			<ul class="ul_banquan_2">
				<li class="li_banquan">使用帮助</li>
				<li><a href="#" title="用户隐私协议"><span>用户隐私协议</span></a></li>
				<li><a href="#" title="防骗指南"><span>防骗指南</span></a></li>
				<li><a href="#" title="使用指导"><span>使用指导</span></a></li>
			</ul>
			<ul class="ul_banquan_3">
				<li class="li_banquan">联系我们</li>
				<li class="li_banquan01">地址：${systemUpset.companyAddres}</li>
				<li class="li_banquan02">客服电话：${systemUpset.phone}</li>
				<li class="li_banquan02">客服QQ：${systemUpset.qq}</li>
			</ul><ul class="ul_banquan_4">
				<li class="li_banquan" >&copy;2020&nbsp;<a href="${ctx}/manager/login/goServerLogin.action" style="color: #bb0000">${systemUpset.company}&nbsp;&nbsp;后台地址</a></li>
			</ul>
		</div>
	</div>
</body>
</html>