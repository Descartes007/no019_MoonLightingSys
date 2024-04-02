<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="top">
	<div class="top_zhong">
		<div class="top_zhong_le">
			<p>大学生校园兼职平台—论坛！</p>
		</div>
		<div class="top_zhong_ri">
			<c:if test="${empty sessionScope.u_id}">
				<ul class="top_zhong_ul01">
					<li><a href="${pageContext.request.contextPath}/mailbox.action" class="a_ping" target="_self"><span class="span_ping">平台信箱</span></a></li>
					<li><a href="${pageContext.request.contextPath}/login.action" class="a_deng"><span class="span_deng" align="right">登录</span></a></li>
					<li><span class="span_xian"></span><a href="${pageContext.request.contextPath}/register.action" class="a_zhu"><span class="span_zhu">注册</span></a></li>
				</ul>
			</c:if>
			<c:if test="${not empty sessionScope.u_id}">
				<ul class="top_zhong_ul02">
					<li><a href="${pageContext.request.contextPath}/mailbox.action" class="a_ping" target="_self"><span class="span_ping">平台信箱</span></a></li>
					<li>
						<a href="#" class="a_deng">
							<span class="span_deng" align="right">${sessionScope.real_name}</span>
						</a>
						<ul class="top_zhong_ul03">
							<li><a href="${pageContext.request.contextPath}/personalCentre.action"><span class="span_ul031" align="center">个人中心</span></a></li>
							<li><a href="${pageContext.request.contextPath}/publishWork.action" target="_self"><span class="span_ul032" align="center">发布兼职</span></a></li>
							<li><span class="span_ul033" align="center">注销账号</span></li>
							<li><span class="span_ul034" align="center">退出登录</span></li>
						</ul>
					</li>
					<li>
						<span class="span_xian"></span>
						<span class="span_tou">
							<img src="/moonlighting/findUserImage.action?fileName=${sessionScope.headportrait}" width="26" height="26">
						</span>
						<span class="span_fu">
							<img src="${pageContext.request.contextPath}/images/fugai.png" width="26" height="26">
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
				<a href="${pageContext.request.contextPath}/index.action" title="平台首页"><img src="${pageContext.request.contextPath}/images/logo.png" width="200" height="60"></a>
			</div>
		</div>
		
		<div class="daohang_daohang">
			<ul>
				<li><a href="${pageContext.request.contextPath}/forum.action" class="a_lun"><span class="span_lun">论坛交流</span></a></li>
				<li><a href="${pageContext.request.contextPath}/personalCentre.action" class="a_ge"><span class="span_ge">个人中心</span></a></li>
				<li><a href="${pageContext.request.contextPath}/notice.action" class="a_tai"><span class="span_tai">平台公告</span></a></li>
			</ul>
		</div>
	</div>
</div>
