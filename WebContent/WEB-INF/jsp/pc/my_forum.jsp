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
	<title>我的帖子</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/my_forum.css">
	<link rel="icon" type="image/x-icon" href="${ctx}/pc/images/titleLogo.png">
	
</head>
<body>
	<div class="page">
		<jsp:include page="/pc/index/goHeader.action" />
		<div class="div_personal">
			<div class="div_zhong">
				<jsp:include page="/pc/personal/goPersonalCommon.action" />
				<div class="div_zhong_r">
					<div class="div_zhong_rz">
						<ul class="ul_span_z_nei">
						<c:forEach items="${page.rows}" var="forum">
							<li>
								<div class="div_z_t">
									<span class="span_z_t">
										<img src="${forum.headerImage}" width="50" height="50">
									</span>
								</div>
								<div class="div_z_n">
									<a href="${ctx}/pc/personal/goFindForum.action?forumId=${forum.forumId}" title="查看我的帖子" target="_blank">
										<span class="span_z_n">
											${forum.title}
										</span>
									</a>
									<span class="span_delete" value="${forum.forumId}">
										点击删除
									</span>
								</div>
							</li>
						</c:forEach>
						</ul>
						<c:if test="${not empty page.rows}">
							<div class="ul_fenye">
								<ck:page url="${ctx}/pc/personal/goMyForum.action"></ck:page>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/pc/index/goFooter.action" />
	</div>
	<script type="text/javascript" src="${ctx}/pc/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
	//删除我的帖子
	var span_delete_nums=$(".ul_span_z_nei li .span_delete");
	for(var i=0;i<span_delete_nums.length;i++){
		$(".ul_span_z_nei li .span_delete:eq("+i+")").click(function(nums){
			return function(){
				var tf=confirm("确定删除该帖子吗？");
				if(tf){
					$.ajax({
					   url:"${ctx}/pc/personal/deleteMyForum.action",
					   data:{"forumId":$(this).attr("value")},
					   type:"POST",
					   success:function(res){
						   if(res.code == 0){
							    alert("删除成功！");
								window.location.reload();
						   }
						},
						error:function(){
							alert("网络错误！");
						}					   
					});
				};
			}
		}(i));
	}
	</script>
</body>
</html>