<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>轮播列表</title>
<link rel="stylesheet" href="${ctx}/server/layui/css/layui.css"
	media="all">
</head>
<body>
	<form class="layui-form layui-form-pane" action="">
		<blockquote class="layui-elem-quote news_search">
			<div class="layui-form-item">
				<div class="layui-inline pane-select">
					<label class="layui-form-label">轮播编号</label>
					<div class="layui-input-block ">
						<input type="text" id="bannerId" name="bannerId"
							lay-verify="required|number" placeholder="请输入轮播编号"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline pane-select">
					<label class="layui-form-label">标题</label>
					<div class="layui-input-block ">
						<input type="text" id="title" name="title"
							lay-verify="required|number" placeholder="请输入标题"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline pane-input">
					<label class="layui-form-label">是否有效</label>
					<div class="layui-input-block">
						<select id="isEffect" name="isEffect" lay-search="">
							<option value="">全部</option>
							<option value="1">有效</option>
							<option value="0">无效</option>
						</select>
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
	<fieldset class="layui-elem-field site-demo-button">
		<div>
			<button id="addBanner" style="margin-left: 10px;"
				class="layui-btn layui-btn-primary">添加轮播</button>
		</div>
	</fieldset>
	<table class="layui-table" id="forum" lay-filter="forum"
		lay-data="{id: 'forum'}"></table>
	<script type="text/html" id="toolBar">
		<a class="layui-btn layui-btn-mini" lay-event="updateBanner" >编辑</a>
		<a class="layui-btn layui-btn-mini layui-btn-danger" lay-event="deleteBanner" >禁用</a>
	</script>
	<script type="text/html" id="isEffectTpl">
       {{# var isEffect=d.isEffect}}
   	   {{# if (isEffect==1){}}
    		<span style="color:green">是</span>
       {{# } else if(isEffect==0){ }}
   			<span style="color:red">否</span>
 	   {{# }  }}
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
			getlist(null, null, null);
		});
		function doSearch() {
			var bannerId = $("#bannerId").val();
			var title = $("#title").val();
			var isEffect = $("#isEffect").val();
			getlist(bannerId, title, isEffect);
		}

		function getlist(bannerId, title, isEffect) {
			tableIns = table.render({
				elem : '#forum',
				id : 'forum',
				method : 'post',
				where : {
					'id' : bannerId,
					'title' : title,
					'isEffect' : isEffect
				},
				url : '${ctx}/server/banner/getBannerList.action',
				cols : [ [ {
					field : 'id',
					title : '编号',
					width : 80,
					align : 'center',
					fixed : true,
					sort : true
				}, {
					field : 'userId',
					title : '管理员编号',
					width : 140,
					align : 'center'
				}, {
					field : 'title',
					title : '标题',
					width : 140,
					align : 'center'
				}, {
					field : 'orderStatus',
					title : '排序',
					width : 140,
					align : 'center'
				}, {
					field : 'isEffect',
					title : '是否有效',
					width : 140,
					align : 'center',
					templet : "#isEffectTpl"
				}, {
					field : 'createTime',
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
			if (obj.event === 'updateBanner') {
				var index = layui.layer.open({
					title : "编辑轮播",
					type : 2,
					content : "${ctx}/server/banner/goUpdateBanner.action?id="
							+ data.id,
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
			}else if (obj.event === 'deleteBanner') {
				layer.confirm('确定禁用该条轮播吗?', function(index){
			        //向服务端发送删除指令
			        $.ajax({
						type : "post",
						url : "${ctx}/server/banner/deleteBanner.action",
						dataType : "json",
						data : {
							"id" : data.id,
							"isEffect" : '0'
						},
						success : function(data) {
							if(data.code==0){
								layer.msg("禁用成功!");
								setTimeout(function () {
				      				 window.location.reload();
								 }, 1000);
							}else{
								layer.msg("禁用失败!");
							}
						}
					});
			     });
			}
		});
		$(window).one("resize",function() {
			$("#addBanner").click(function() {
				var index = layui.layer.open({
					title : "添加轮播",
					type : 2,
					content : "${ctx}/server/banner/goAddBanner.action",
					success : function(layero,index) {
						setTimeout(function() {
							layui.layer.tips('点击此处返回','.layui-layer-setwin .layui-layer-close',{
								tips : 3
							});
						}, 500)
					}
				})
				layui.layer.full(index);
			})
		}).resize();
	</script>
</body>
</html>