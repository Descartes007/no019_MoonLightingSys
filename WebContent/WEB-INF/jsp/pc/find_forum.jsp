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
	<title>查看帖子</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/find_forum.css">
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
							<a href="${ctx}/pc/index/goFindUser.action?userId=${forum.userId}" title="查看个人资料" target="_self">
								<div class="find_1_t"><img src="${forum.headerImage}" width="60" height="60"></div>
							</a>
						</div>
						<div class="find_1_z">${forum.nickName}</div>
						<div class="find_1_r"><fmt:formatDate value="${forum.createTime}" pattern="yyyy-MM-dd"/></div>
					</div>
					<div class="div_find_2">${forum.title}</div>
					<c:if test="${not empty forum.content}">
					<div class="div_find_3">${forum.content}</div>
					</c:if>
					<c:if test="${not empty forum.image}">
					<div class="div_find_4">
						<img src="${forum.image}">
					</div>
					</c:if>
					<div class="div_find_5" id="div_find_5">
						<span class="find_5_l" value="${forum.forumId}">收藏</span>
						<span class="find_5_r"  id="find_5_r" value="${forum.forumId}">评论</span>
					</div>
					<div  class="div_find_6" id="div_find_6">
						<textarea class="text_ping_nei" maxlength="45"></textarea><input type="button" class="input_ping" value="发表">
					</div>
					<ul class="ul_find_7" <c:if test="${not empty forum.forumReplys}">style="display: block;"</c:if>>
						<c:if test="${not empty forum.forumReplys}">
							<c:forEach items="${forum.forumReplys}" var="forumReply">
								<li>
									<span class="span_ni">${forumReply.nickName}：</span><span class="span_nei">${forumReply.replyContent}</span>
								</li>
							</c:forEach>
						</c:if>
					</ul>
					<ul class="ul_find_8"></ul>
				</div>
			</div>
		</div>
	</div>
	<div class="bottom">
		
	</div>
	<script type="text/javascript" src="${ctx}/pc/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">

		// /点击评论打开输入面板
		var forumId='';
		var find_5_r_nums=$("#div_find_5 #find_5_r");
		for(var i=0;i<find_5_r_nums.length;i++){
			$("#div_find_5 #find_5_r:eq("+i+")").click(function(tai_num){
				return function(){
					forumId=$(this).attr("value");
					$(this).parent().next().css({"display":"block"});
				}
			}(i));
		}
		
		//添加评论内容
		function add_pingnei(add_ping,add_nei ){
			var ul_find_7=$(add_ping).parent().next();
			ul_find_7.css({"display":"block"});
			ul_find_7.append("<li><span class=\"span_ni\">${pcUser.nickName}：</span><span class=\"span_nei\">"+add_nei+"</span></li>");
		}

		//判断输入框是否有内容，并且评论后清空内容
		$(".input_ping").click(function(){
			var text_ping_neis=$(this).parent().children(".text_ping_nei");
			if('${pcUser}' == ''){
				alert("您尚未登录，请先登录！");
			}
			else if(text_ping_neis.val()!="") {
				var isLogin = true;
				$.ajax({
	                type: "POST",
	                url: "${ctx}/pc/action/addForumReply.action",
	                data: {
	                	"replyContent":text_ping_neis.val(),
	 				    "forumId":forumId
	                },
	                success: function(res) {
	                	if(res.code == 1){
	 					   isLogin = false;
	 					   alert("您尚未登录，请先登录！");
	 				   }
	                },
	                error: function(res) {
	              	  alert("网络错误");
	                }
	            });
				if(isLogin){
					// 添加评论内容
					add_pingnei(this,text_ping_neis.val());
					//清空内容关闭评论输入面板
					text_ping_neis.val("");
					$(this).parent().css({"display":"none"});
				}
			}
			else{
				alert("请输入评论内容！");
			}
		})
		
		//收藏帖子
		var find_5_l_nums=$("#div_find_5 .find_5_l");
		for(var i=0;i<find_5_l_nums.length;i++){
			$("#div_find_5 .find_5_l:eq("+i+")").click(function(nums){
				return function(){
					if("${pcUser}"==""){
						alert("您尚未登录，请先登录！");
					}
					else{
						$.ajax({
			                type: "POST",
			                url: "${ctx}/pc/action/addCollect.action",
			                data: {
			                	"forumId":$(this).attr("value"),
			                },
			                success: function(res) {
			                	if(res.code == 0){
			                		alert("收藏成功！");
			                	}
			                	if(res.code == 1){
			 					   alert("您尚未登录，请先登录！");
			 				   }
			                },
			                error: function(res) {
			              	  alert("网络错误");
			                }
			            });
					}
				};
			}(i));
		}
	</script>
</body>
</html>