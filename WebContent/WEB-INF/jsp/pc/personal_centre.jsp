<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ck" uri="http://com.work/common"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人资料</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/personal_centre.css">
	<link rel="icon" type="image/x-icon" href="${ctx}/pc/images/titleLogo.png">
	
</head>
<body>
	<div class="page">
		<jsp:include page="/pc/index/goHeader.action" />
		<div class="div_personal">
			<div class="div_zhong">
				<jsp:include page="/pc/personal/goPersonalCommon.action" />
				<div class="div_zhong_r">
					<ul class="ul_zhong_rz">
						<li><span>昵称：${user.nickName}</span><span>账号：${user.userId}</span></li>
						<li><span>姓名：${user.realName}</span><span>性别：<c:if test="${user.sex == 1}">男</c:if><c:if test="${user.sex == 0}">女</c:if></span></li>
						<li><span>类型：${user.userCategory}</span></li>
						<li><span>电话：${user.phone}</span></li>
						<li><span>邮箱：${user.email}</span></li>
						<li class="li_rz"><input type="button" value="编辑资料" class="input_zi"><input type="button" value="修改密码" class="input_mi"></li>
					</ul>
				</div>
			</div>
		</div>
		<jsp:include page="/pc/index/goFooter.action" />
	</div>
	<div class="div_wai_zi">
		<div class="div_wai_ziz">
			<div class="zhu_z">
				<form class="form_zhu flex-box" action="#" method="post" name="修改资料">
                    <h2 align="center">修改个人资料</h2><br>
                    <div><span align="right">姓名：</span><input name="real_name" type="text" class="in input_xing" maxlength="4" placeholder="请输入姓名" value="${user.realName}"></div>
                    <div><span class="msg xing_msg"></span></div>
					<div><span align="right">昵称：</span><input name="nick_name" type="text" class="in input_ni" maxlength="10" placeholder="请输入昵称" value="${user.nickName}"></div>
					<div><span class="msg ni_msg"></span></div>
					<div><span align="right"> 性别：</span><input name="sex" type="radio" value="1" <c:if test="${user.sex == 1}">checked="checked"</c:if>>男
					<input name="sex" type="radio" value="0" <c:if test="${user.sex == 0}">checked="checked"</c:if>>女</div>
					<div><span class="msg bie_msg"></span></div>
					<div><span align="right"> 用户类型：</span><select name="category" class="in input_user">
					<option value="学生" <c:if test="${user.userCategory == '学生'}">selected = "selected"</c:if>>学生
					<option value="老师" <c:if test="${user.userCategory == '老师'}">selected = "selected"</c:if>>老师
					<option value="商家" <c:if test="${user.userCategory == '商家'}">selected = "selected"</c:if>>商家
					</select></div>
					<div><span class="msg user_msg"></span></div>
					<div><span align="right"> E-mail：</span><input name="email" type="text" class="in input_e" maxlength="32" placeholder="请输入邮箱" value="${user.email}"></div>
					<div><span class="msg e_msg"></span></div>
					<div><span align="right"> 联系电话：</span><input name="telephone" type="text" class=" in input_lian" maxlength="11" placeholder="请输入联系电话" value="${user.phone}"></div>
					<div><span class="msg lian_msg"></span></div>
					<span align="right"> 头像：</span><input name="image" type="file" class="input_tou"><br>
			       	<span class="msg tou_msg"></span><br>
			       	<ul><li><img src="${user.headerImage}"></li></ul>

					<input type="button"  value="取消修改" class="input_quxiao">
					<input type="button"  value="保存修改" class="input_baocun">      
		      		</form>
			</div>
		</div>
	</div>
	<div class="div_wai_mi">
		<div class="div_wai_ziz">
			<div class="zhu_password_z">
				<form class="form_password" action="#" method="post" name="修改密码">
		                    <h2 align="center">修改个人密码</h2><br>
		                     
					<div><span align="right">新密码：</span><input name="password" type="password" class="in input_password" maxlength="20" minlength="6" placeholder="请输入新密码"></div>
					<div><span class="msg password_msg"></span></div>
					<div><span align="right">确认密码：</span><input name="password" type="password" class="in input_password_2" maxlength="20" minlength="6" placeholder="请确认新密码"></div>
					<span class="msg password_msg_2"></span><br> 
					
					
					<input type="button"  value="取消修改" class="input_pass_quxiao">
					<input type="button"  value="确认修改" class="input_pass_baocun">      
		      		</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/pc/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
	var headerImage = '${user.headerImage}';
	//弹出修改资料窗口
	$(".input_zi").click(function(){
		$(".div_wai_zi").css({"z-index":"10"});
	})
	//取消修改  关闭修改资料窗口
	$(".input_quxiao").click(function(){
		window.location.reload();
	})
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
		var file = $(".input_tou").get(0).files[0];
		//获取图片大小kb
		var tou_max=file.size;
		//获取文件名的长度
		var tou_num=file.name.lastIndexOf(".");
		//获取后缀名
		var tou_str=file.name.substr(tou_num);
		//创建用来读取此文件的对象
		var reader = new FileReader();
		//使用该对象读取file文件
		reader.readAsDataURL(file);
		//读取文件成功后执行的方法函数
		reader.onload=function(e){
			if(tou_str!=".jpg"&&tou_str!=".png" && tou_str != ".JPG" && tou_str != ".PNG"){
				$(".tou_msg").text("请上传jpg、png格式图片！");
				$(".input_tou").val("");
			}
			else{
				if(tou_max>4097152){
					$(".tou_msg").text("请上传小于4M的图片！");
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
	//保存前，判断所有选项是否为空
	$(".input_baocun").click(function(){
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
		else if(headerImage=="") {
			$(".tou_msg").text("头像不能为空！");
		}
		else{
			$.ajax({
                type: "POST",
                url: "${ctx}/pc/personal/updateUser.action",
                data: {
                	userId: '${user.userId}',
                    realName: $(".input_xing").val(),
                    nickName: $(".input_ni").val(),
                    email: $(".input_e").val(),
                    phone: $(".input_lian").val(),
                    userCategory: $(".input_user").val(),
                    sex: $('input[name="sex"]:checked').val(),
                    headerImage: headerImage
                },
                success: function(res) {
                    if (res.code == 0) {
                  	  window.location.reload();
                    } else {
                  	  $(".xing_msg").text(res.msg);
                    }
                },
                error: function(res) {
              	  $(".xing_msg").text("网络错误");
                }
            });
		} 
	})
	
	//弹出修改密码窗口 
	$(".input_mi").click(function(){
		$(".div_wai_mi").css({"z-index":"10"});
	})
	//取消修改  关闭修改密码窗口
	$(".input_pass_quxiao").click(function(){
		window.location.reload();
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
	// 判断确认密码
	$(".input_password_2").focusout(function(){
		if ($(".input_password_2").val()=="") {
			$(".password_msg_2").text("确认密码不能为空！");
		}
		else if($(".input_password_2").val().length < 6){
			$(".password_msg_2").text("确认密码不能小于6位数！");
		}
		else if(!/^\w+$/.test($(".input_password_2").val())){
			$(".password_msg_2").text("确认密码只能由数字、字母或下划线组成！");
		}
		else if($(".input_password_2").val() != $(".input_password").val()){
			$(".password_msg_2").text("前后密码不一致！");
			$(".input_password_2").val("");
		}
		else{
			$(".password_msg_2").text("");
		}
	})
	//确认修改密码前判断各项是否正常
	$(".input_pass_baocun").click(function(){
		if ($(".input_password").val()=="") {
			$(".password_msg").text("密码不能为空！");
		}
		else if($(".input_password").val().length < 6){
			$(".password_msg").text("密码不能小于6位数！");
		}
		else if(!/^\w+$/.test($(".input_password").val())){
			$(".password_msg").text("密码只能由数字、字母或下划线组成！");
		}
		else if($(".input_password_2").val() != $(".input_password").val()){
			$(".password_msg_2").text("前后密码不一致！");
			$(".input_password_2").val("");
		}
		else{
			$.ajax({
                type: "POST",
                url: "${ctx}/pc/personal/updatePassword.action",
                data: {
                	userId: '${user.userId}',
                    password: $(".input_password").val(),
                    passwordYes: $(".input_password_2").val(),
                },
                success: function(res) {
                    if (res.code == 0) {
                    	alert("修改密码成功");
                  	  	window.location.reload();
                    } else {
                  	  	$(".password_msg_2").text(res.msg);
                    }
                },
                error: function(res) {
              	  $(".password_msg_2").text("网络错误");
                }
            });
		}
	});
	</script>
</body>
</html>