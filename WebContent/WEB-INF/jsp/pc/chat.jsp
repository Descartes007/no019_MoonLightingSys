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
	<title>用户聊天</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/chat.css">
	<link rel="icon" type="image/x-icon" href="${ctx}/pc/images/titleLogo.png">
</head>
<body>
	<div class="top">
		<div class="div_logo">
   			<a href="${ctx}/pc/index/goIndex.action" title="返回首页"><img src="${systemUpset.companyLogo}"></a>
   		</div>
	</div>
	<div class="chat">
		<div class="chat_zhong">
			<div class="chat_z">
				<div class="div_chat">
					<div class="div_s">
						<!-- <div class="div_l">
							<div class="div_l_l">
								<div class="div_l_t"><img src="../images/touxiang02.jpg" width="60" height="60"></div>
							</div>
							<div class="div_l_r">
								<span>聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容</span>
							</div>
						</div>
						<div class="div_r">
							<div class="div_r_r">
								<div class="div_r_t"><img src="../images/touxiang01.jpg" width="60" height="60"></div>
							</div>
							<div class="div_r_l">
								<span>聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容聊天内容</span>
							</div>
						</div> -->
						
						
					</div>
					<div class="div_x">
						<textarea name="chat" class="input_chat" maxlength="70"></textarea>
						<input type="button" value="发送" class="input_fa">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="bottom">
		
	</div>
	<script type="text/javascript" src="${ctx}/pc/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
		function setScroll(){
			var all_height=$(".div_s").get(0).scrollHeight;
			$(".div_s").scrollTop(all_height);
		}  
		setScroll();
		
		//获取聊天内容
		function userChat(){
			//清除所有聊天内容
			$(".div_s").empty();
			//重新添加聊天内容
			$.ajax({
				url:"${ctx}/pc/action/findChatList.action",
				data:{userId:"${user.userId}"},
				type:"POST",
				success:function(res){
					for(var i=0;i<res.data.length;i++){
						if(res.data[i].userIdFa=="${user.userId}"){
							$(".div_s").append("<div class=\"div_l\"><div class=\"div_l_l\"><div class=\"div_l_t\"><img src=\""+res.data[i].headerImageFa+"\" width=\"60\" height=\"60\"></div></div><div class=\"div_l_r\"><span>"+res.data[i].content+"</span></div></div>");
						}else{
							$(".div_s").append("<div class=\"div_r\"><div class=\"div_r_r\"><div class=\"div_r_t\"><img src=\""+res.data[i].headerImageFa+"\" width=\"60\" height=\"60\"></div></div><div class=\"div_r_l\"><span>"+res.data[i].content+"</span></div></div>");
						}
						//调用滚动条设置
						setScroll();
					}
				},
			   error: function(res){
					alert("网络错误！");
			   }
			});
		}
		//加载页面立即获取聊天内容
		userChat();
		
		//判断有没有新消息
		var ChatCount=0;
		function xinNotice(){
			$.ajax({
				url:"${ctx}/pc/action/findChatListCount.action",
			    data:{userId:"${user.userId}"},
				type:"POST",
			    success:function(res){
			    	console.log(res.code);
					if(res.code > ChatCount){
						userChat();
						ChatCount = res.code;
					}
			   },
				error: function(res){
					alert("网络错误！");
			   }
			});
		}
		//设置定时器判断有没有新消息
		var timer=setInterval(xinNotice,3000);
		
		//发送消息开始
		$(".input_fa").click(function(){
			//插入数据库
			$.ajax({
				url:"${ctx}/pc/action/addChat.action",
			    data:{"userIdJie":"${user.userId}","content":$(".input_chat").val()},
				type:"POST",
				success:function(res){
					if(res.code == 0){
						
					}else{
						alert("网络错误！");
					}
			   },
				error: function(res){
					alert("网络错误！");
			   }
			});
			//直接添加聊天内容
			$(".div_s").append("<div class=\"div_r\"><div class=\"div_r_r\"><div class=\"div_r_t\"><img src=\"${pcUser.headerImage}\" width=\"60\" height=\"60\"></div></div><div class=\"div_r_l\"><span>"+$(".input_chat").val()+"</span></div></div>");
			//清空输入框
			$(".input_chat").val("");
			//调用滚动条设置
			setScroll();
		});
	</script>
</body>
</html>