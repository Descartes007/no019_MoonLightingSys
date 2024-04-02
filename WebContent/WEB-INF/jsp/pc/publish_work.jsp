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
	<title>发布兼职</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/publish_work.css">
	<link rel="icon" type="image/x-icon" href="${ctx}/pc/images/titleLogo.png">
	
</head>
<body>
	<div class="top">
		<div class="div_logo">
  			<a href="${ctx}/pc/index/goIndex.action" title="返回首页"><img src="${systemUpset.companyLogo}"></a>
  		</div>
	</div>
	<div class="publish">
		<div class="publish_zhong">
			<div class="publish_z">
				<form class="form_work">
					<h2 align="center">发布招聘兼职</h2><br>
					<span align="right">兼职标题：</span><input type="text" name="title" class="in input_biao" maxlength="15" placeholder="请输入兼职标题"><br>
					<span class="msg biao_msg"></span><br>
					<span align="right">联系方式：</span><input type="text" name="call" class="in input_call" maxlength="11" placeholder="请输入联系方式"><br>
					<span class="msg call_msg"></span><br>
					<span align="right">兼职内容：</span><textarea name="work" class="input_work" maxlength="500" placeholder="请输入兼职内容"></textarea><br>
					<span class="msg work_msg"></span><br>
					<span align="right"> 兼职类别：</span><select name="category" class="in input_user">
					<option value="传单派发">传单派发
					<option value="设计">设计
					<option value="家教">家教
					<option value="会计">会计
					<option value="计算机">计算机
					<option value="服务员">服务员
					<option value="促销">促销
					<option value="其他">其他
					</select><br><br>
					<span align="right">兼职图片：</span><input type="file" name="image" class="input_image"><span class="input_ima">自由选填</span><br>
					<span class="msg image_msg"></span><br>
					<ul></ul>
					<input type="button" value="立即发布" class="input_fabu">
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/pc/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
		var headerImage = '';
		// 判断标题
		$(".input_biao").focusout(function(){
			if ($(".input_biao").val()=="") {
				$(".biao_msg").text("标题不能为空！");
			}
			else{
				$(".biao_msg").text("");
			}
		})
		// 判断联系方式
		$(".input_call").focusout(function(){
			if ($(".input_call").val()=="") {
				$(".call_msg").text("联系方式不能为空！");
			}
			else if(!/^1[34578]\d{9}$/.test($(".input_call").val())){
				$(".call_msg").text("请输入合法的手机号码！");
			}
			else{
				$(".call_msg").text("");
			}
		})
		// 判断内容
		$(".input_work").focusout(function(){
			if ($(".input_work").val()!="") {
				$(".work_msg").text("");
			}else{
				$(".work_msg").text("内容不能为空！");
			}
		})
		//判断图片
		$(".input_image").change(function(){
			//获取input file的files文件数组;
			var file = $(".input_image").get(0).files[0];
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
				if(tou_str != ".jpg" && tou_str != ".png" && tou_str != ".JPG" && tou_str != ".PNG"){
					$(".image_msg").text("请上传jpg、png格式图片！");
					$(".input_image").val("");
				}
				else{
					if(tou_max>5194304){
						$(".image_msg").text("请上传小于5M的图片！");
						$(".input_image").val("");
					}
					else if('${pcUser}' == ''){
						$(".input_image").val("");
						alert("您尚未登录，请先登录！");
					}
					else{
						var file =new FormData();
						file.append('file', $(".input_image").get(0).files[0]);
						$.ajax({
						      type: "post",
						      url: "${ctx}/imageUpload/workImage.action",
						      data: file,
						      contentType: false, // 注意这里应设为false
						      processData: false,    //false
						      cache: false,    //缓存
						      success: function(res){
						    	  if(res.code == 0){
						    		  $(".form_work ul").html("<li><img src="+res.msg+"></li>");
						    		  $(".image_msg").text("");
						    		  headerImage = res.msg;
						    	  }
						      }
						});
					}
				}
			}
		})
		//发布前，判断所有选项是否为空
		$(".input_fabu").click(function(){
			if ($(".input_biao").val()=="") {
				$(".biao_msg").text("标题不能为空！");
			}
			else if($(".input_call").val()=="") {
				$(".call_msg").text("联系方式不能为空！");
			}
			else if(!/^1[34578]\d{9}$/.test($(".input_call").val())){
				$(".call_msg").text("请输入合法的手机号码！");
			}
			else if($(".input_work").val()=="") {
				$(".work_msg").text("内容不能为空！");
			}
			else if('${pcUser}' == ''){
				alert("您尚未登录，请先登录！");
			}
			else{
				$.ajax({
	                type: "POST",
	                url: "${ctx}/pc/action/addWork.action",
	                data: {
	                    title: $(".input_biao").val(),
	                    phone: $(".input_call").val(),
	                    content: $(".input_work").val(),
	                    workCategory: $(".input_user").val(),
	                    image: headerImage
	                },
	                success: function(res) {
	                    if (res.code == 0) {
	                    	alert("发布成功，等待管理员审核！");
	                    	window.location.href = "${ctx}/pc/index/goIndex.action";
	                    } else {
	                  	  alert(res.msg);
	                    }
	                },
	                error: function(res) {
	              	  $(".biao_msg").text("网络错误");
	                }
	            });
			} 
		})
	
	</script>
</body>
</html>