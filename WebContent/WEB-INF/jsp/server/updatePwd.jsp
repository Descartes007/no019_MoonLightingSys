<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
	<meta charset="utf-8">
	<title>修改密码</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${ctx}/server/layui/css/layui.css" media="all" />
</head>
<body class="childrenBody">
	<div style="padding-left:50px;;padding-top:30px;">
	    <div class="layui-form">
		
		<div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label"><span style="color:red;font-size:16px !important;;margin-right:5px;">*</span>新密码</label>
				<div class="layui-input-inline">
					<input type="password" id="newpassword" class="layui-input newsAuthor" lay-verify="required" placeholder="请输入新密码">				  
					
				</div>
			</div>				
		</div>
      <div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label"><span style="color:red;font-size:16px !important;;margin-right:5px;">*</span>确认密码</label>
				<div class="layui-input-inline">
					<input type="password" id="repassword" class="layui-input newsAuthor" lay-verify="required" placeholder="请再一次输入密码">				  
				</div>
			</div>				
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" id="send" >提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
			</div>
	</div>	

<script type="text/javascript" src="${ctx}/server/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/server/layui/layui.all.js"></script>
<script type="text/javascript">
layui.use('layer',function(){
	layer = layui.layer;
})
    $("#send").on('click',function(){
      var password = $("#newpassword").val();
      var rePassword = $("#repassword").val();
      if(!password){
    	  layer.msg("新密码不能为空");
      }else if(password.length < 6){
    	  layer.msg("密码不能少于六位数");
      }else if(password != rePassword){
    	  layer.msg("两次输入密码不一致");
      }else{
    	  $.ajax({
     		 url:'${ctx}/manager/login/updatePassword.action',
     		 type:'post',
     		 dataType:'json',
     		 data:{'password':password,'rePassword':rePassword},
     		 success:function(data){
     			 if(data.code==0){
     				  layer.msg(data.msg);
     				  setTimeout(function(){
     					  layer.closeAll("iframe");
       				 	  parent.location.reload();
     				  },1000);
     			 }else{
     				 layer.msg(data.msg);
     			 }
     		 }
     	});
      }
    })
</script>
</body>
</html>