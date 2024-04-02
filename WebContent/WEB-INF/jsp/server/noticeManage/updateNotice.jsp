<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="utf-8">
<title>编辑公告</title>
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
				<label class="layui-form-label">标题：</label>
				<div class="layui-input-block">
					<input type="text" name="title" value="${notice.title}" autocomplete="off" class="layui-input" lay-verify="title" placeholder="请输入标题" style="width:390px">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">内容：</label>
				<div class="layui-input-block">
					 <textarea placeholder="请输入内容" class="layui-textarea" name="content">${notice.content}</textarea>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">图片：</label>
				<div class="layui-input-block">
					<button type="button" class="layui-btn" id="uploadNewImg">图片上传</button> 
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"></label>
				<ul class="layer-photos-demo" id="Images" lay-verify="uploadNewImg"></ul>
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
var image = '${notice.image}';
if(image != ''){
	$('#Images').html('<li><img src="'+ image +'" class="layui-upload-img"><div class="operate"><i class="layui-icon img_del">&#xe640;</i></div></li>');
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
		url: '${ctx}/imageUpload/systemImage.action'
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
	    	image = res.msg;
	    	delImages();
	    }
	});
});



layui.use([ 'form', 'layer'],
		function() {
	 	form = layui.form, layer = layui.layer;
	 	//自定义验证规则
		form.verify({	
			title : function(value) {
				if (value.trim() == '') {
					return '标题不能为空';
				}
			}
		});
	 	
		//监听提交
		form.on('submit(demo1)', function(data) {
			$.ajax({
				type : "post",
				url : "${ctx}/server/notice/updateNotice.action",
				dataType:"json",
				data : {
					"id":'${notice.id}',
					"title":data.field.title,
					"content":data.field.content,
					"image":image
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