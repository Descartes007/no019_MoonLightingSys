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
	<title>查看兼职</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/find_work.css">
	<link rel="icon" type="image/x-icon" href="${ctx}/pc/images/titleLogo.png">
</head>
<body>
	<div class="top">
		<div class="div_logo">
    			<a href="${ctx}/pc/index/goIndex.action" title="返回首页"><img src="${systemUpset.companyLogo}"></a>
    		</div>
	</div>
	<div class="find_w">
		<div class="find_w_zhong">
			<div class="find_w_z">
				<div class="div_find_w">
					<div class="div_find_1">
						<div class="find_1_l">
						<a href="${ctx}/pc/index/goFindUser.action?userId=${work.userId}" title="查看个人资料" target="_self">
							<div class="find_1_t"><img src="${work.headerImage}" width="60" height="60"></div>
						</a>
						</div>
						<div class="find_1_z">${work.realName}</div>
						<div class="find_1_r"><fmt:formatDate value="${work.createTime}" pattern="yyyy-MM-dd"/></div>
					</div>
					<div class="div_find_2">${work.title}</div>
					<c:if test="${not empty work.content}">
						<div class="div_find_3">${work.content}</div>
					</c:if>
					<c:if test="${not empty work.image}">
						<div class="div_find_4">
							<img src="${work.image}">
						</div>
					</c:if>
					<div class="div_find_5">
						<span class="find_5_l">${work.phone}</span>
						<span class="find_5_r">
							<c:if test="${work.isEffect==1}">正常</c:if> 
							<c:if test="${work.isEffect==0}">失效</c:if>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="bottom">
		
	</div>
	<script type="text/javascript" src="${ctx}/pc/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>