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
	<title>平台公告</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/notice.css">
	<link rel="icon" type="image/x-icon" href="${ctx}/pc/images/titleLogo.png">
	
</head>
<body>
	<div class="page">
		<jsp:include page="/pc/index/goHeader.action" />
		<div class="div_personal"> 
			<div class="div_zhong">
				<div class="div_zhong_l">
					<ul class="ul_zhong_l">
					<c:forEach items="${page.rows}" var="notice">
						<li>
							<span class="span_z_1">></span>
							<span class="span_z_2" title="${notice.title}" value="${notice.id}">${notice.title}</span>
							<span class="span_z_3"><fmt:formatDate value="${notice.createTime}" pattern="yyyy-MM-dd"/></span>
						</li>
					</c:forEach>
					</ul>
					<c:if test="${not empty page.rows}">
						<div class="ul_fenye">
							<ck:page url="${ctx}/pc/index/goNotice.action"></ck:page>
						</div>
					</c:if>
				</div>
				<div class="div_zhong_r">
					<div class="div_zhong_r_r">
						<h3 align="center"></h2>
						<p></p>
						<span></span>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/pc/index/goFooter.action" />
	</div>
	<script type="text/javascript" src="${ctx}/pc/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
	
	//获取公告
	function firstNotice(noticeId){
		$.ajax({
			url:"${ctx}/pc/index/getNotice.action",
		    data:{"id":noticeId},
			type:"POST",
		   	success:function(res){
				$(".div_zhong_r_r h3").text(res.objects.title);
				$(".div_zhong_r_r p").text(res.objects.content);
				$(".div_zhong_r_r span").text("公告时间："+res.objects.createTimes);
		   },
		   error: function(res) {
           	  alert("网络错误");
           }
		});
	}
	//页面加载显示第一条公告
	var noticeId = $(".ul_zhong_l li .span_z_2:eq(0)").attr("value");
	
	if(noticeId != '' && noticeId != null){
		firstNotice(noticeId);
	}
	//点击查看公告
	var span_z_2_nums=$(".ul_zhong_l li .span_z_2");
	for(var i=0;i<span_z_2_nums.length;i++){
		$(".ul_zhong_l li .span_z_2:eq("+i+")").click(function(nums){
			return function(){
				//调用获取公告函数
				firstNotice($(this).attr("value"));
			};
		}(i));
	}
	</script>
</body>
</html>