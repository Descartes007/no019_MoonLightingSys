<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大学生校园兼职平台管理系统--登陆</title>
<link rel="stylesheet" href="${ctx}/server/layui/css/layui.css" />
<link rel="icon" type="image/x-icon" href="${ctx}/pc/images/titleLogo.png">
<script type="text/javascript" src="${ctx}/server/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/server/layui/layui.all.js"></script>
<style type="text/css">
        body{background-color:#f5f5f5;}
        .login-head{position:fixed;left:0;top:0;width:80%;height:60px;line-height:60px;background:#000;padding:0 10%;}
        .login-head h1{color:#fff;font-size:20px;font-weight:600}
        .login-box{margin:240px auto 0;width:400px;background-color:#fff;padding:15px 30px;border-radius:10px;box-shadow: 5px 5px 15px #999;}
        .login-box .layui-input{font-size:15px;font-weight:400}
        .login-box input[name="password"]{letter-spacing:5px;font-weight:800}
        .login-box .layui-btn{width:100%;}
        .login-box .copyright{text-align:center;height:50px;line-height:50px;font-size:12px;color:#ccc}
        .login-box .copyright a{color:#ccc;}
    </style>
</head>
<body>
<div class="login-head">
    <h1>大学生校园兼职平台管理系统</h1>
</div>
<div class="login-box">
    <div  class="layui-form layui-form-pane">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>管理后台登陆</legend>
        </fieldset>
        <div class="layui-form-item">
            <label class="layui-form-label">登陆账号</label>
            <div class="layui-input-block">
                <input type="text" name="account" id="account" class="layui-input" lay-verify="required" placeholder="请输入登陆账号" autofocus="autofocus" value="">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">登陆密码</label>
            <div class="layui-input-block">
                <input type="password" name="password"  id="password" class="layui-input" lay-verify="required" placeholder="******" value="">
            </div>
        </div>
        <input type="button" value="登陆"  onclick="gologin()"  class="layui-btn">
    </div>
    <div class="copyright">
        © 2020 <a href="http://www.baidu.com" target="_blank">百度</a> All Rights Reserved.
    </div>
</div>

<script type="text/javascript">
function gologin(){
	/* var index = layer.load(1); */
	var account = $("#account").val();
	var password = $("#password").val();
	if(account == ""){
		layer.msg("账号不能为空,请输入");
	}else if(password == ""){
		layer.msg("密码不能为空,请输入");
	}else{
		$.ajax({
			url:'${ctx}/manager/login/dologin.action',
			type:'post',
			dataType:'json',
			data:{'userId':account,'password':password},
			success:function(data){
				if(data.code == 0){ //登陆成功
					layer.msg(data.msg,{time:1000}); 
					setTimeout(function(){
						window.location.href = '${ctx}/manager/login/goIndex.action';
					},1000);
				}else if(data.code == 1){
					layer.msg(data.msg);	
				}else{
					layer.msg(data.msg);
				}
			},
			error:function(data){
				layer.msg("网络错误");
			}
		});
		
	}
}
</script>
</body>
</html>