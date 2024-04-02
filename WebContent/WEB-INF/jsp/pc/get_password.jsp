<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>安全设置</title>  
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/get_password.css">
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
						<h2>设置密保</h2>
						<div class="flex-box">
							<span class="msg work_msg"><c:if test="${empty pcUser.question}">安全提示：您尚未设置密码保护！</c:if></span>
						</div>
						<div>
							<span>找回问题：</span><textarea name="work" class="input_work question" maxlength="30" placeholder="请输入找回密码问题">${pcUser.question}</textarea>
						</div>
						<div class="flex-box">
							<span class="msg work_msg_1"></span>
						</div>
						<div>
							<span>找回答案：</span><textarea name="work" class="input_work answer" maxlength="30" placeholder="************"></textarea>
						</div>
						<div class="flex-box">
							<span class="msg work_msg_2"></span>
						</div>
						<input type="button" value="立即设置" class="input_set">
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/pc/index/goFooter.action" />
	</div>
	<script type="text/javascript" src="${ctx}/pc/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
	$(".input_set").click(function(){
		if($(".question").val() == ''){
			$(".work_msg_1").text("问题不能为空！");
		}
		else if($(".question").val().length < 4){
			$(".work_msg_1").text("问题不能少于4个字节！");
		}
		else if($(".answer").val() == ''){
			$(".work_msg_2").text("答案不能为空！");
		}
		else if($(".answer").val().length < 2){
			$(".work_msg_2").text("答案不能少于2个字节！");
		}
		else{
			$.ajax({
                type: "POST",
                url: "${ctx}/pc/personal/setQuestion.action",
                data: {
                    question: $(".question").val(),
                    answer: $(".answer").val()
                },
                success: function(res) {
                    if (res.code == 0) {
                    	alert("设置成功！");
                  	  	window.location.reload();
                    } else {
                  	  $(".work_msg_2").text(res.msg);
                    }
                },
                error: function(res) {
              	  $(".work_msg_2").text("网络错误");
                }
            });
		}
	})

	
	</script>
</body>
</html>