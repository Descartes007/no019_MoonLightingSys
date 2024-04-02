<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ck" uri="http://com.work/common"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html>
<head>
	<title>公共头部</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/header.css">
</head>
<body>
	<div class="top">
		<div class="top_zhong">
			<div class="top_zhong_le">
				<p>${systemUpset.welcomText}</p>
			</div>
			<div class="top_zhong_ri"> 
				<c:if test="${pcUser == null}">
					<ul class="top_zhong_ul01">
						<li><a href="${ctx}/pc/index/goMailbox.action" class="a_ping" target="_self"><span class="span_ping">平台信箱</span></a></li>
						<li><a href="${ctx}/pc/login/goLogin.action" class="a_deng"><span class="span_deng" align="right">登录</span></a></li>
						<li><span class="span_xian"></span><a href="${ctx}/pc/login/goRegister.action" class="a_zhu"><span class="span_zhu">注册</span></a></li>
					</ul>
				</c:if>
				<c:if test="${pcUser != null}">
					<ul class="top_zhong_ul02">
						<li><a href="${ctx}/pc/index/goMailbox.action" class="a_ping" target="_self"><span class="span_ping">平台信箱</span></a></li>
						<li>
							<a href="#" class="a_deng">
								<span class="span_deng" align="right">${pcUser.nickName}</span>
							</a>
							<ul class="top_zhong_ul03">
								<li><a href="${ctx}/pc/personal/goPersonal.action"><span class="span_ul031" align="center">个人中心</span></a></li>
								<li><a href="${ctx}/pc/index/goPublishWork.action" target="_self"><span class="span_ul032" align="center">发布兼职</span></a></li>
								<li><a href=""><span class="span_ul034" align="center">退出登录</span></a></li>
							</ul>
						</li>
						<li>
							<span class="span_xian"></span>
							<span class="span_tou">
								<img src="${pcUser.headerImage}" width="26" height="26">
							</span>
						</li>
					</ul>
				</c:if> 
			</div>
		</div>
	</div>
	<div class="daohang" id="daohang">
		<div class="daohang_zhong">
			<div class="daohang_logo">
				<div class="daohang_logo01">
					<a href="${ctx}/pc/index/goIndex.action" title="平台首页" target="_parent"><img src="${systemUpset.companyLogo}" width="200" height="60"></a>
				</div>
			</div>
			
			<div class="daohang_daohang">
				<ul>
					<li><a href="${ctx}/pc/index/goForum.action" class="a_lun" target="_parent"><span class="span_lun">论坛交流</span></a></li>
					<li><a href="${ctx}/pc/personal/goPersonal.action" class="a_ge" target="_parent"><span class="span_ge">个人中心</span></a></li>
					<li><a href="${ctx}/pc/index/goNotice.action" class="a_tai" target="_parent"><span class="span_tai">平台公告</span></a></li>
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/pc/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
	//导航置顶判断begin
	$(window).scroll(function(){
		if($(document).scrollTop()>=40){
			$("#daohang").addClass("daohang_1").removeClass("daohang");
			$(".div_forum").css("margin-top",100);
		}
		else{
			$("#daohang").addClass("daohang").removeClass("daohang_1");
			$(".div_forum").css("margin-top",0);
		}
	})
	
	//退出登录
	$(".span_ul034").click(function(){
		var tf=confirm("确定退出登录吗？");
		if(tf==true){
			$.ajax({
                type: "POST",
                url: "${ctx}/pc/login/outLogin.action",
                data: {},
                success: function(res) {
                    if (res.code == 0) {
                    	window.location.href="${ctx}/pc/index/goIndex.action";
                    } else {
                  	  alert(res.msg);
                    }
                },
                error: function(res) {
              	  alert("网络错误");
                }
            });
		}
	});
	</script>
</body>
</html>