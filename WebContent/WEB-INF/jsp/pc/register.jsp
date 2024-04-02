<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ck" uri="http://com.work/common"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>欢迎注册</title> 
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/register.css">
	<link rel="icon" type="image/x-icon" href="${ctx}/pc/images/titleLogo.png">
</head>
<body>
	<div class="top">
		<div class="div_logo">
    			<a href="${ctx}/pc/index/goIndex.action" title="返回首页"><img src="${systemUpset.companyLogo}"></a>
    		</div>
	</div>
	<div class="zhu">
		<div class="zhu_zhong">
			<div class="zhu_l"></div>
			<div class="zhu_z">
				<form class="form_zhu" action="#" method="post" name="用户注册">
                    <h2 align="center">兼职平台注册</h2><br>
                    <div><span align="right"> 姓名：</span><input name="real_name" type="text" class="in input_xing" maxlength="5" placeholder="请输入姓名"></div>
                    <div><span class="msg xing_msg"></span></div>
					<div><span align="right"> 昵称：</span><input name="nick_name" type="text" class="in input_ni" maxlength="10" placeholder="请输入昵称"></div> 
					<div><span class="msg ni_msg"></span></div>
					<div><span align="right"> 密码：</span><input name="password" type="password" class="in input_password" maxlength="20" minlength="6" placeholder="请输入密码"></div>
					<div><span class="msg password_msg"></span></div>
					<div><span align="right"> 性别：</span><input name="sex" type="radio" value="1" checked="checked">男
						<input name="sex" type="radio" value="0">女</div>
					<div><span class="msg bie_msg"></span></div>
					<div><span align="right"> 用户类型：</span><select name="category" class="in input_user">
					<option value="学生">学生
					<option value="老师">老师
					<option value="商家">商家
					</select></div>
					<div><span class="msg user_msg"></span></div>
					<div><span align="right"> E-mail：</span><input name="email" type="text" class="in input_e" maxlength="32" placeholder="请输入E-mail"></div>
					<div><span class="msg e_msg"></span></div>
					<div><span align="right"> 联系电话：</span><input name="telephone" type="text" class=" in input_lian" maxlength="11" placeholder="请输入联系电话"></div>
					<div><span class="msg lian_msg"></span></div>
			       	<span align="right"> 头像：</span><input name="image" type="file" class="input_tou"><br>
			       	<span class="msg tou_msg"></span><br>
			       	<ul></ul>
					<input type="button"  value="立即注册" class="input_zhuce">      
		      		</form>
			</div>
			<div class="zhu_r"></div>
		</div>
	</div>
	<div class="xia"></div>
	<script type="text/javascript" src="${ctx}/pc/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
		var headerImage = '';
		// 判断姓名 
		$(".input_xing").focusout(function(){
			if ($(".input_xing").val()=="") {
				$(".xing_msg").text("姓名不能为空！");
			}
			else if(!/^[\u4e00-\u9fa5]+$/.test($(".input_xing").val())){
				$(".xing_msg").text("姓名只能为中文！");
			}
			else{
				$(".xing_msg").text("");
			}
		})
		//判断昵称
		$(".input_ni").focusout(function(){
			if ($(".input_ni").val()=="") {
				$(".ni_msg").text("昵称不能为空！");
			}
			else if($(".input_ni").val().length < 4){
				console.log($(".input_ni").val().length);
				$(".ni_msg").text("昵称不能小于4位数！");
			}
			else if(!/^[\u4E00-\u9FA5\w\d]+$/.test($(".input_ni").val())){
				$(".ni_msg").text("昵称只能由中文、数字、字母或下划线组成！");
			}
			else{
				$.ajax({
				   url:"${ctx}/pc/login/findUserByNickName.action",
				   data:{"nickName":$(".input_ni").val()},
				   type:"POST",
				   success:function(res){
						if(res.code == 0){
							$(".ni_msg").text("该昵称已存在，请重新输入！");
							$(".input_ni").val("");
						}
						else{
							$(".ni_msg").text("");
						}
					},
				   datatype:"text"
			    });
				$(".ni_msg").text("");
			}
		})
		// 判断密码
		$(".input_password").focusout(function(){
			if ($(".input_password").val()=="") {
				$(".password_msg").text("密码不能为空！");
			}
			else if($(".input_password").val().length < 6){
				$(".password_msg").text("密码不能小于6位数！");
			}
			else if(!/^\w+$/.test($(".input_password").val())){
				$(".password_msg").text("密码只能由数字、字母或下划线组成！");
			}
			else{
				$(".password_msg").text("");
			}
		})
		// 判断邮箱
		$(".input_e").focusout(function(){
			if ($(".input_e").val()=="") {
				$(".e_msg").text("邮箱不能为空！");
			}
			else if(!/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/.test($(".input_e").val())){
				$(".e_msg").text("邮箱格式不正确！");
			}
			else{
				$(".e_msg").text("");
			}
		})
		// 判断联系方式
		$(".input_lian").focusout(function(){
			if ($(".input_lian").val()=="") {
				$(".lian_msg").text("联系方式不能为空！");
			}
			else if(!/^1[34578]\d{9}$/.test($(".input_lian").val())){
				$(".lian_msg").text("请输入合法的手机号码！");
			}
			else{
				$(".lian_msg").text("");
			}
		})

		//判断头像
		$(".input_tou").change(function(){
			//获取input file的files文件数组;
			var fe = $(".input_tou").get(0).files[0];
			//获取图片大小kb
			var tou_max=fe.size;
			//获取文件名的长度
			var tou_num=fe.name.lastIndexOf(".");
			//获取后缀名
			var tou_str=fe.name.substr(tou_num);
			//创建用来读取此文件的对象
			var reader = new FileReader();
			//使用该对象读取file文件
			reader.readAsDataURL(fe);
			//读取文件成功后执行的方法函数
			reader.onload=function(e){
				if(tou_str!=".jpg"&&tou_str!=".png" && tou_str != ".JPG" && tou_str != ".PNG"){
					$(".tou_msg").text("请上传jpg、png格式图片！");
					$(".input_tou").val("");
				}
				else{
					if(tou_max>2097152){
						$(".tou_msg").text("请上传小于2M的图片！");
						$(".input_tou").val("");
					}
					else{
						var file =new FormData();
						file.append('file', $(".input_tou").get(0).files[0]);
						$.ajax({
						      type: "post",
						      url: "${ctx}/imageUpload/headerImage.action",
						      data: file,
						      contentType: false, // 注意这里应设为false
						      processData: false,    //false
						      cache: false,    //缓存
						      success: function(res){
						    	  if(res.code == 0){
						    		  $(".form_zhu ul").html("<li><img src="+res.msg+"></li>");
						    		  $(".tou_msg").text("");
						    		  headerImage = res.msg;
						    	  }
						      }
						});
					}
				}
			}
		})
		//注册前，判断所有选项是否为空
		$(".input_zhuce").click(function(){
			if ($(".input_xing").val()=="") {
				$(".xing_msg").text("姓名不能为空！");
			}
			else if(!/^[\u4e00-\u9fa5]+$/.test($(".input_xing").val())){
				$(".xing_msg").text("姓名只能为中文！");
			}
			else if($(".input_ni").val()=="") {
				$(".ni_msg").text("昵称不能为空！");
			}
			else if($(".input_ni").val().length < 4){
				console.log($(".input_ni").val().length);
				$(".ni_msg").text("昵称不能小于4位数！");
			}
			else if(!/^[\u4E00-\u9FA5\w\d]+$/.test($(".input_ni").val())){
				$(".ni_msg").text("昵称只能由中文、数字、字母或下划线组成！");
			}
			else if($(".input_password").val()=="") {
				$(".password_msg").text("密码不能为空！");
			}
			else if($(".input_password").val().length < 6){
				$(".password_msg").text("密码不能小于6位数！");
			}
			else if(!/^\w+$/.test($(".input_password").val())){
				$(".password_msg").text("密码只能由数字、字母或下划线组成！");
			}
			else if($(".input_e").val()=="") {
				$(".e_msg").text("邮箱不能为空！");
			}
			else if(!/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/.test($(".input_e").val())){
				$(".e_msg").text("邮箱格式不正确！");
			}
			else if($(".input_lian").val()=="") {
				$(".lian_msg").text("联系方式不能为空！");
			}
			else if(!/^1[34578]\d{9}$/.test($(".input_lian").val())){
				$(".lian_msg").text("请输入合法的手机号码！");
			}
			else if($(".input_tou").val()=="") {
				$(".tou_msg").text("头像不能为空！");
			}
			else{
				$.ajax({
                      type: "POST",
                      url: "${ctx}/pc/login/doRegister.action",
                      data: {
                          realName: $(".input_xing").val(),
                          nickName: $(".input_ni").val(),
                          password: $(".input_password").val(),
                          email: $(".input_e").val(),
                          phone: $(".input_lian").val(),
                          userCategory: $(".input_user").val(),
                          sex: $('input[name="sex"]:checked').val(),
                          headerImage: headerImage
                      },
                      success: function(res) {
                          if (res.code == 0) {
                        	  alert("注册成功，您的账号为："+res.msg);
                        	  window.location.href = "${ctx}/pc/login/goLogin.action";
                          } else {
                        	  $(".xing_msg").text(res.msg);
                          }
                      },
                      error: function(res) {
                    	  $(".password_msg").text("网络错误");
                      }
                  });
			} 
		})
	</script>
</body>
</html>