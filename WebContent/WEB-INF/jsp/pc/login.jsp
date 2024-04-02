<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="utf-8">
<title>欢迎登录</title>
<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
<link href="${ctx}/pc/css/login.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/x-icon" href="${ctx}/pc/images/titleLogo.png">
</head>

<body>
	<div class="div_deng">
    	<div class="div_top">
    		<div class="div_logo">
    			<a href="${ctx}/pc/index/goIndex.action" title="返回首页"><img src="${systemUpset.companyLogo}"></a>
    		</div>
    	</div>
    	<div class="div_zhong">
        	<div class="div_zhong_l"></div>
              <div class="div_zhong_r">
            	<form class="form_deng" action="#" method="post" name="用户登录">
                    <h2 align="center">兼职平台登录</h2><br>
                    <span class="span">账号：</span><input type="text" size="20" class="input_text" id="input_text" placeholder="请输入账号"/><br>
                    <span class="msg zhang_msg"></span><br>
                    <span class="span">密码：</span><input type="password" size="20" class="input_text" id="input_password" placeholder="请输入密码"/><br>
                    <span class="msg password_msg"></span><br>
                    <div class="remeber flex-box">
                        <input id="remebers" type="checkbox" name="" value="1" />
                        <span>记住密码</span>
                        <span class="forget-password">忘记密码？</span>
                    </div>
                    <input class="input_deng" type="button" value="登录"/>
                    <a href="${ctx}/pc/login/goRegister.action" title="用户注册">
                		<input class="input_zhu" type="button" value="注册"/>
                     </a>
                    <br>
                    <span class="msg deng_msg">${msg}</span>       
      		</form>    
            </div>
        </div>
        <div class="div_xia"></div>
    </div>
    <script type="text/javascript" src="${ctx}/pc/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
      //记住用户名密码
      function remember_name(){
         var isRem = $("#remebers").prop("checked");
         if (isRem) {
              localStorage.setItem('userId', $("#input_text").val());
              localStorage.setItem('password', $("#input_password").val());
         }else {
              localStorage.setItem('userId', "");
              localStorage.setItem('password', "");
         }
  	  }

	  //用户名密码value获取
	  $("#input_text").val(localStorage.getItem('userId'));
	  $("#input_password").val(localStorage.getItem('password'));
	  if(localStorage.getItem('userId')==""){
	        $("#remebers").attr("checked",false)
	  }else{
	        $("#remebers").attr("checked",true)
	  }
	  
	  //判断
     $("#input_text").focusout(function(){
         if ($("#input_text").val()=="") {
             $(".zhang_msg").text("账号不能为空！");
         }
         else{
             $(".zhang_msg").text("");
         }
     })
     $("#input_password").focusout(function(){
         if ($("#input_password").val()=="") {
             $(".password_msg").text("密码不能为空！");
         }
         else{
             $(".password_msg").text("");
         }
     })
     $(".input_deng").click(function(){
           if ($("#input_text").val()=="") {
               $(".zhang_msg").text("账号不能为空！");
           }
           else if($("#input_password").val()=="") {
               $(".password_msg").text("密码不能为空！");
           }
        else{
      	  $.ajax({
                type: "POST",
                url: "${ctx}/pc/login/doLogin.action",
                data: {
                    userId: $("#input_text").val(),
                    password: $("#input_password").val()
                },
                success: function(res) {
                    if (res.code == 0) {
                    	//记住用户名密码
                    	remember_name();
                  	    window.location.reload();
                    } else {
                  	  	$(".password_msg").text(res.msg);
                    }
                },
                error: function(res) {
              	  	$(".password_msg").text("网络错误");
                }
            });
        }
     });
     //忘记密码
     $(".forget-password").click(function(){
         if ($("#input_text").val()=="") {
             $(".zhang_msg").text("请输入账号！");
         }
         else{
        	 $.ajax({
                 type: "POST",
                 url: "${ctx}/pc/login/isQuestion.action",
                 data: {
                     userId: $("#input_text").val()
                 },
                 success: function(res) {
                     if (res.code == 0) {
                    	 url = "${ctx}/pc/login/goForgetPassword.action?userId="+$("#input_text").val();
                    	 window.location.href = url;
                     } else {
                   	  	 $(".zhang_msg").text(res.msg);
                     }
                 },
                 error: function(res) {
               	  	$(".password_msg").text("网络错误");
                 }
             });
         }
   });
     
    </script>
</body>
</html>