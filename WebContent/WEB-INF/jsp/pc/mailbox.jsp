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
	<title>平台信箱</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/mailbox.css">
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
					<h2 align="center">兼职平台信箱</h2><br>
					<span align="right">主题：</span><input type="text" name="title" class="in input_biao" maxlength="15" placeholder="请输入主题"><br>
					<span class="msg biao_msg"></span><br>
					<span align="right">内容：</span><textarea name="work" class="input_work" maxlength="500" placeholder="请输入内容"></textarea><br>
					<span class="msg work_msg"></span><br>
					<span align="right">图片：</span><input type="file" name="image" class="input_image"><span class="input_ima">自由选填</span><br>
					<span class="msg image_msg"></span><br>
					<ul></ul>
					<input type="button" value="立即发送" class="input_fabu">
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/pc/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
	var headerImage = '';
	// 判断标题是否为空
	$(".input_biao").focusout(function(){
		if ($(".input_biao").val()=="") {
			$(".biao_msg").text("主题不能为空！");
		}
		else{
			$(".biao_msg").text("");
		}
	})
	// 判断内容
	$(".input_work").focusout(function(){
		if ($(".input_work").val()!="") {
			$(".work_msg").text("");
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
			var tou_num=$(".input_image").val().lastIndexOf(".");
			var tou_str=$(".input_image").val().substr(tou_num);
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
					      url: "${ctx}/imageUpload/mailboxImage.action",
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
	//发送前，判断所有选项是否为空
	$(".input_fabu").click(function(){
		if ($(".input_biao").val()=="") {
			$(".biao_msg").text("主题不能为空！");
		}
		else if($(".input_work").val()==""&&$(".input_image").val()=="") {
			$(".work_msg").text("内容和图片不能同时为空！");
		}
		else if('${pcUser}' == ''){
			alert("您尚未登录，请先登录！");
		}
		else{
			$.ajax({
                type: "POST",
                url: "${ctx}/pc/action/addMailbox.action",
                data: {
                    title: $(".input_biao").val(),
                    content: $(".input_work").val(),
                    image: headerImage
                },
                success: function(res) {
                    if (res.code == 0) {
                    	alert("发送成功！");
                    	window.location.href = "${ctx}/pc/index/goIndex.action";
                    } else {
                  	  $(".biao_msg").text(res.msg);
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