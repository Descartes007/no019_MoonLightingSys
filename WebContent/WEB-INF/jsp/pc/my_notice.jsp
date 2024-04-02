<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ck" uri="http://com.work/common"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>我的通知</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/my_notice.css">
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
						<ul class="ul_span_s">
							<li class="li_s_span"><span class="span">聊天消息</span><c:if test="${isChat == 't'}"><span class="notice-status"></span></c:if></li>
							<li><span class="span">评论消息</span><c:if test="${isReply == 't'}"><span class="notice-status"></span></c:if></li>
						</ul>
						<ul class="ul_span_z">
							<li class="li_no li_z_span">
								<ul class="ul_span_z_nei">
								<c:forEach items="${chats}" var="chat">
									<c:if test="${chat.userIdFa == user.userId}">
									<li>
										<div class="div_z_t">
											<a href="${ctx}/pc/index/goFindUser.action?userId=${chat.userIdJie}" title="查看用户资料" target="_blank">
												<span class="span_z_t">
													<img src="${chat.headerImageJie}" width="50" height="50">
												</span>
											</a>
										</div>
										<div class="div_z_n">
											<a href="${ctx}/pc/index/goChat.action?userId=${chat.userIdJie}" title="查看聊天信息" target="_blank">
												<span class="span_z_n">
													${chat.nickNameJie}
												</span>
											</a>
											<span class="span_z_m" value="${chat.userIdJie}">删除</span>
										</div>
									</li>
									</c:if>
									<c:if test="${chat.userIdJie == user.userId}">
									<li>
										<div class="div_z_t">
											<a href="${ctx}/pc/index/goFindUser.action?userId=${chat.userIdFa}" title="查看用户资料" target="_blank">
												<span class="span_z_t">
													<img src="${chat.headerImageFa}" width="50" height="50">
												</span>
											</a>
										</div>
										<div class="div_z_n">
											<a href="${ctx}/pc/index/goChat.action?userId=${chat.userIdFa}" title="查看聊天信息" target="_blank">
												<span class="span_z_n">
													${chat.nickNameFa}
												</span>
											</a>
											<span class="span_z_m" value="${chat.userIdFa}">删除</span>
											<c:if test="${chat.isLook == 0}"><span class="notice-status"></span></c:if>
											
										</div>
									</li>
									</c:if>
								</c:forEach>
								</ul>
							</li>
							<li class="li_no">
								<ul class="ul_span_z_nei">
								<c:forEach items="${forums}" var="forum">
									<li>
										<div class="div_z_t">
											<a href="${ctx}/pc/index/goFindUser.action?userId=${forum.userId}" title="查看用户资料" target="_blank">
												<span class="span_z_t">
													<img src="${forum.headerImage}" width="50" height="50">
												</span>
											</a>
										</div>
										<div class="div_z_n">
											<a href="${ctx}/pc/personal/goFindForum.action?forumId=${forum.forumId}" title="查看评论回复" target="_blank">
												<span class="span_z_n">
													${forum.title}
												</span>
											</a>
										</div>
									</li>
								</c:forEach>	
								</ul>
								<div class="ul_fenye">
									
								</div>
							</li>
						</ul>
						
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/pc/index/goFooter.action" />
	</div>
	<script type="text/javascript" src="${ctx}/pc/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/pc/js/my_notice.js"></script>
	<script type="text/javascript">
		
		//tab栏交互样式 begin
		var ul_span_lis=$(".ul_span_s li");
		for(var i=0;i<ul_span_lis.length;i++){
			$(".ul_span_s li").get(i).index=i;
			$(".ul_span_s li:eq("+i+")").mouseenter(function(){
				var i=this.index;
				$(".ul_span_s li").removeClass("li_s_span");
				$(".ul_span_z .li_no").removeClass("li_z_span");

				$(".ul_span_s li:eq("+i+")").addClass("li_s_span");
				$(".ul_span_z .li_no:eq("+i+")").addClass("li_z_span");
			})
		}
		
		//删除聊天关系
		var span_z_m_nums=$(".ul_span_z_nei li .span_z_m");
		for(var i=0;i<span_z_m_nums.length;i++){
			$(".ul_span_z_nei li .span_z_m:eq("+i+")").click(function(nums){
				return function(){
					$.ajax({
					   url:"${ctx}/pc/personal/deleteMyChatList.action",
					   data:{"userId":$(this).attr("value")},
					   type:"POST",
					   success:function(res){
							if(res.code == 0){
								window.location.reload();
							}
						},
						error:function(){
							alert("删除失败！");
						}					   
					});
				};
			}(i));
		}
		
		//刷新原页面
		$(".span_z_n").click(function(){
			setTimeout(function(){
				window.location.reload();
			},1500);
		})
		
	</script>
</body>
</html>