<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="utf-8">
<title>编辑用户</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">

<link rel="stylesheet" href="${ctx}/server/layui/css/layui.css"
	media="all" />
<link rel="stylesheet" href="${ctx}/server/font-awesome/css/font-awesome.min.css">
<style type="text/css">
#Images li{
	float:left;
	margin-left:10px;
	height:300px;
	margin-bottom:20px;
}
#Images img{
	height:300px;
}
.img_del{
    cursor: pointer;
}
</style>
</head>
<body>
	<div style="margin: 15px;">
		<div class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">姓名：</label>
				<div class="layui-input-block">
					<input type="text" name="realName" value="${user.realName}"  autocomplete="off" class="layui-input" lay-verify="realName" placeholder="请输入姓名" style="width:390px">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">昵称：</label>
				<div class="layui-input-block">
					<input type="text" name="nickName" value="${user.nickName}"  autocomplete="off" class="layui-input" lay-verify="nickName" placeholder="请输入昵称" style="width:390px">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">性别：</label>
				<div class="layui-input-inline" style="width:390px">
					<select name="sex" lay-verify="sex">
						<option value="1" <c:if test="${user.sex == 1}">selected="selected"</c:if>>男</option>
						<option value="0" <c:if test="${user.sex == 0}">selected="selected"</c:if>>女</option>
						
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">手机号：</label>
				<div class="layui-input-block">
					<input type="text" name="phone" value="${user.phone}" autocomplete="off" class="layui-input" lay-verify="phone" placeholder="请输入手机号" style="width:390px">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">邮箱：</label>
				<div class="layui-input-block">
					<input type="text" name="email" value="${user.email}" autocomplete="off" class="layui-input" lay-verify="email" placeholder="请输入邮箱" style="width:390px">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">是否有效：</label>
				<div class="layui-input-inline" style="width:390px">
					<select name="isEffect" lay-verify="collType">
						<option value="1" <c:if test="${user.isEffect == 1}">selected="selected"</c:if>>是</option>
						<option value="0" <c:if test="${user.isEffect == 0}">selected="selected"</c:if>>否</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">是否兼职：</label>
				<div class="layui-input-inline" style="width:390px">
					<select name="isWork">
						<option value="0" <c:if test="${user.isWork == 0}">selected="selected"</c:if>>否</option>
						<option value="1" <c:if test="${user.isWork == 1}">selected="selected"</c:if>>是</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">用户等级：</label>
				<div class="layui-input-inline" style="width:390px">
					<select name="userLeven" lay-verify="userLeven">
						<option value="0" <c:if test="${user.userLeven == 0}">selected="selected"</c:if>>普通用户</option>
						<option value="1" <c:if test="${user.userLeven == 1}">selected="selected"</c:if>>管理员</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">用户类别：</label>
				<div class="layui-input-inline" style="width:390px">
					<select name="userCategory" lay-verify="userCategory">
						<option value="学生" <c:if test="${user.userCategory == '学生'}">selected="selected"</c:if>>学生</option>
						<option value="老师" <c:if test="${user.userCategory == '老师'}">selected="selected"</c:if>>老师</option>
						<option value="商人" <c:if test="${user.userCategory == '商人'}">selected="selected"</c:if>>商人</option>
						<option value="管理员" <c:if test="${user.userCategory == '管理员'}">selected="selected"</c:if>>管理员</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密保问题：</label>
				<div class="layui-input-block">
					 <textarea placeholder="请输入问题" class="layui-textarea" name="question">${user.question}</textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密保答案：</label>
				<div class="layui-input-block">
					 <textarea placeholder="请输入答案" class="layui-textarea" name="answer">${user.answer}</textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">备注：</label>
				<div class="layui-input-block">
					 <textarea placeholder="请输入备注" class="layui-textarea" name="remark">${user.remark}</textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">头像：</label>
				<div class="layui-input-block">
					<button type="button" class="layui-btn" id="uploadNewImg">图片上传</button> 
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"></label>
				<ul class="layer-photos-demo" id="Images" lay-verify="lay-verify="headerImage"></ul>
			</div>			
			<div class="layui-form-item">
				<label class="layui-form-label"></label>
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit="" lay-filter="demo1">确认</button>
					<button onclick="goBack();" class="layui-btn layui-btn-primary">返回</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctx}/server/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/server/layui/layui.js"></script>

<script type="text/javascript">
var headerImage = '${user.headerImage}';
if(headerImage != ''){
	$('#Images').html('<li><img src="'+ headerImage +'" class="layui-upload-img"><div class="operate"><i class="layui-icon img_del">&#xe640;</i></div></li>');
}

//图片集合删除
function delImages(){
	var i_s=$("#Images .img_del");
	for(var i=0;i<i_s.length;i++){
		$("#Images .img_del").get(i).index=i;
		$("#Images .img_del:eq("+i+")").click(function(){
			var i=this.index;
			$("#Images li:eq("+i+")").remove();
		})
	}
}
delImages();
layui.use('upload', function() {
	var $ = layui.jquery, upload = layui.upload;
	upload.render({
		url: '${ctx}/imageUpload/headerImage.action'
	    ,elem: '#uploadNewImg' //指定原始元素，默认直接查找class="layui-upload-file"
	    ,method: 'post', //上传接口的http类型
	    dataType:"json"
	    ,multiple: true
	    ,before: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	      });
	    }
	    ,done: function(res){
	    	//$('#Images').append('<li><img layer-src="'+ res.msg +'" src="'+ res.msg +'" alt="'+ res.msg +'" class="layui-upload-img"><div class="operate"><i class="layui-icon img_del">&#xe640;</i></div></li>');
	    	$('#Images').html('<li><img src="'+ res.msg +'" class="layui-upload-img"><div class="operate"><i class="layui-icon img_del">&#xe640;</i></div></li>');
	    	headerImage = res.msg;
	    	delImages();
	    }
	});
});



layui.use([ 'form', 'layer'],
		function() {
	 	form = layui.form, layer = layui.layer;
	 	//自定义验证规则
		form.verify({	
			realName : function(value) {
				if (value.trim() == '') {
					return '姓名不能为空';
				}
			},
			nickName : function(value) {
				if (value.trim() == '') {
					return '昵称不能为空';
				}
			},
			phone : function(value) {
				if (value.trim() == '') {
					return '联系方式不能为空';
				}
			},
			email : function(value) {
				if (value.trim() == '') {
					return '邮箱不能为空';
				}
			},
			headerImage : function(value) {
				if ($('#Images li').length < 1) {
					return '请上传头像';
				}
			}
		});
	 	
		//监听提交
		form.on('submit(demo1)', function(data) {
			$.ajax({
				type : "post",
				url : "${ctx}/server/user/updateUser.action",
				dataType:"json",
				data : {
					"userId" : '${user.userId}',
					"realName":data.field.realName,
					"nickName":data.field.nickName,
					"sex":data.field.sex,
					"phone":data.field.phone,
					"email":data.field.email,
					"userLeven":data.field.userLeven,
					"userCategory":data.field.userCategory,
					"isEffect":data.field.isEffect,
					"isWork":data.field.isWork,
					"question":data.field.question,
					"answer":data.field.answer,
					"remark":data.field.remark,
					"headerImage":headerImage
				},
				success : function(result) {
					if(result.code==0){
						layer.msg("编辑成功");
						setTimeout(function () {
							 layer.closeAll("iframe");
		      				//刷新父页面
		      				 parent.location.reload();
						  }, 1000);
					} else{
						layer.msg(result.msg,{time:2000});
					}
				},error:function(){
					layer.msg("编辑失败");
				}
			});
			return false;
		});
	});

function goBack(){
	window.history.go(-1);
}
</script>
</html>