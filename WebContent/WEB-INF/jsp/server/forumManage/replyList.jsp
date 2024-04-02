<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>评论列表</title>
<link rel="stylesheet" href="${ctx}/server/layui/css/layui.css"
	media="all">
</head>
<body>
	<form class="layui-form layui-form-pane" action="">
		<blockquote class="layui-elem-quote news_search">
			<div class="layui-form-item">
				<div class="layui-inline pane-select">
					<label class="layui-form-label">评论编号</label>
					<div class="layui-input-block ">
						<input type="text" id="replyId" name="replyId"
							lay-verify="required|number" placeholder="请输入评论编号"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div style="float: right;">
					<a class="layui-btn search_btn" onclick="doSearch()"> <i
						class="layui-icon">&#xe615;</i>查询
					</a>
				</div>
			</div>
		</blockquote>
	</form>
	
	<table class="layui-table" id="forum" lay-filter="forum"
		lay-data="{id: 'forum'}"></table>
	<script type="text/html" id="toolBar">
		<a class="layui-btn layui-btn-mini" lay-event="updateReply" >编辑</a>
		<a class="layui-btn layui-btn-mini layui-btn-danger" lay-event="deleteReply" >删除</a>
	</script>
	
	<script type="text/javascript" src="${ctx}/server/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/server/layui/layui.all.js"></script>
	<script>
		layui.use([ 'layer', 'table', 'laydate' ], function() {
			table = layui.table;
			layer = layui.layer;
			var laydate = layui.laydate;
			//--------------方法渲染TABLE----------------
			//日期范围
			laydate.render({
				elem : '#startAndendTime',
				calendar : true,
				range : '~'
			});
			getlist(null);
		});
		function doSearch() {
			var replyId = $("#replyId").val();
			getlist(replyId);
		}

		function getlist(replyId) {
			tableIns = table.render({
				elem : '#forum',
				id : 'forum',
				method : 'post',
				where : {
					'replyId' : replyId,
					'forumId' : '${forumReply.forumId}'
				},
				url : '${ctx}/server/reply/getForumReplyList.action',
				cols : [ [ {
					field : 'replyId',
					title : '编号',
					width : 80,
					align : 'center',
					fixed : true,
					sort : true
				}, {
					field : 'userId',
					title : '所属用户',
					width : 140,
					align : 'center'
				}, {
					field : 'forumId',
					title : '帖子编号',
					width : 140,
					align : 'center'
				}, {
					field : 'replyTime',
					title : '发布时间',
					width : 180,
					align : 'center',
					sort : true,
				}, {
					title : '操作',
					width : 180,
					align : 'center',
					fixed : 'right',
					toolbar : '#toolBar'
				} ] ],
				page : true,
				limits : [ 10, 20, 30, 50, 100 ],
				limit : 10, //默认采用20
				width : '100%',
				height : 'auto',
				loading : true,
				even : true,
				response : {
					statusName : 'code' //数据状态的字段名称，默认：code
					,
					statusCode : 0 //成功的状态码，默认：0
					,
					countName : 'count' //数据总数的字段名称，默认：count
					,
					dataName : 'data' //数据列表的字段名称，默认：data
				},
				done : function(res, curr, count) {
				}
			});
		}
		table.on('tool(forum)', function(obj) {
			var data = obj.data;
			if (obj.event === 'updateReply') {
				var index = layui.layer.open({
					title : "编辑评论",
					type : 2,
					content : "${ctx}/server/reply/goUpdateForumReply.action?replyId="
							+ data.replyId,
					success : function(layero, index) {
						setTimeout(function() {
							layui.layer.tips('点击此处返回',
									'.layui-layer-setwin .layui-layer-close', {
										tips : 3
									});
						}, 500)
					}
				})
				layui.layer.full(index);
			}else if (obj.event === 'deleteReply') {
				layer.confirm('确定删除该条评论吗?', function(index){
			        //向服务端发送删除指令
			        $.ajax({
						type : "post",
						url : "${ctx}/server/reply/deleteForumReply.action",
						dataType : "json",
						data : {
							"replyId" : data.replyId,
						},
						success : function(data) {
							if(data.code==0){
								layer.msg("删除成功!");
								setTimeout(function () {
				      				 window.location.reload();
								 }, 1000);
							}else{
								layer.msg("删除失败!");
							}
						}
					});
			     });
			}
		});
		
	</script>
</body>
</html>