<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="utf-8">
<title>添加用户</title>
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
					<input type="text" name="realName"  autocomplete="off" class="layui-input" lay-verify="realName" placeholder="请输入姓名" style="width:390px">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">昵称：</label>
				<div class="layui-input-block">
					<input type="text" name="nickName"  autocomplete="off" class="layui-input" lay-verify="nickName" placeholder="请输入昵称" style="width:390px">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">性别：</label>
				<div class="layui-input-inline" style="width:390px">
					<select name="sex" lay-verify="sex">
						<option value="1" >男</option>
						<option value="0">女</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">手机号：</label>
				<div class="layui-input-block">
					<input type="text" name="phone"  autocomplete="off" class="layui-input" lay-verify="phone" placeholder="请输入手机号" style="width:390px">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">邮箱：</label>
				<div class="layui-input-block">
					<input type="text" name="email"  autocomplete="off" class="layui-input" lay-verify="email" placeholder="请输入邮箱" style="width:390px">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码：</label>
				<div class="layui-input-block">
					<input type="password" name="password" autocomplete="off" class="layui-input" lay-verify="password" placeholder="请输入密码" style="width:390px">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">是否有效：</label>
				<div class="layui-input-inline" style="width:390px">
					<select name="isEffect" lay-verify="collType">
						<option value="1" selected="selected">是</option>
						<option value="0">否</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">是否兼职：</label>
				<div class="layui-input-inline" style="width:390px">
					<select name="isWork">
						<option value="0" selected="selected">否</option>
						<option value="1">是</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">用户等级：</label>
				<div class="layui-input-inline" style="width:390px">
					<select name="userLeven" lay-verify="userLeven">
						<option value="0" selected="selected">普通用户</option>
						<option value="1">管理员</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">用户类别：</label>
				<div class="layui-input-inline" style="width:390px">
					<select name="userCategory" lay-verify="userCategory">
						<option value="学生" selected="selected">学生</option>
						<option value="老师">老师</option>
						<option value="商人">商人</option>
						<option value="管理员">管理员</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">备注：</label>
				<div class="layui-input-block">
					 <textarea placeholder="请输入备注" class="layui-textarea" name="remark"></textarea>
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
				<ul class="layer-photos-demo" id="Images" lay-verify="headerImage"></ul>
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
var headerImage = '';
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
			password : function(value) {
				if (value.trim() == '') {
					return '密码不能为空';
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
				url : "${ctx}/server/user/addUser.action",
				dataType:"json",
				data : {
					"realName":data.field.realName,
					"nickName":data.field.nickName,
					"sex":data.field.sex,
					"phone":data.field.phone,
					"email":data.field.email,
					"password":data.field.password,
					"userLeven":data.field.userLeven,
					"userCategory":data.field.userCategory,
					"isEffect":data.field.isEffect,
					"isWork":data.field.isWork,
					"remark":data.field.remark,
					"headerImage":headerImage
				},
				success : function(result) {
					if(result.code==0){
						layer.msg("添加成功");
						setTimeout(function () {
							 layer.closeAll("iframe");
		      				//刷新父页面
		      				 parent.location.reload();
						  }, 1000);
					} else{
						layer.msg(result.msg,{time:2000});
					}
				},error:function(){
					layer.msg("添加失败");
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