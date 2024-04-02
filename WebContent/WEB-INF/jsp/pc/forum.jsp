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
	<title>兼职平台—论坛</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/forum.css">
	<link rel="icon" type="image/x-icon" href="${ctx}/pc/images/titleLogo.png">
</head>
<body>
<div class="page">
	<jsp:include page="/pc/index/goHeader.action" />
	<div class="div_forum">
		<div class="div_zhong flex-box">
			<div class="div_l">
				<div class="div_l_s">
					<ul>
						<li><span class="span_luntan">论坛类别&nbsp;>></span></li>
						<li><a href="#"><span>体育</span></a><a href="#"><span>电竞社区</span></a></li>
						<li><a href="#"><span>军事</span></a><a href="#"><span>汽车部落</span></a></li>
						<li><a href="#"><span>时尚综艺</span></a><a href="#"><span>数码专区</span></a></li>
						<li><a href="#"><span>互联网</span></a><a href="#"><span>金融行业</span></a></li>
						<li><a href="#"><span>影视</span></a><a href="#"><span>科技</span></a></li>
					</ul>
				</div>
				<c:forEach items="${advers}" var="adver">
				<c:if test="${adver.position == 1}">
					<div class="div_l_x">
						<div class="div_l_x_n"><img src="${adver.image}" width="230" height="300"></div>
						<div class="div_l_x_w">
							<span class="div_l_x_w_span_1">广告①</span>
							<span class="div_l_x_w_span_2">230×300</span>
						</div>
					</div>
				</c:if>
				</c:forEach>
			</div>
			<div class="div_z">
				<div class="div_z_s">
					<div class="div_zi"><span class="span_zi">发布帖子</span><input type="button" class="input_guan" value="关闭"></div>
					<form class="form_z">
						<span align="right">标题：</span><input type="text" name="" class="input_biao" maxlength="15" placeholder="请输入标题"><br>
						<span class="msg biao_msg"></span><br>
						<span align="right">内容：</span><textarea name="" class="text_nei" maxlength="500" placeholder="请输入内容"></textarea><br>
						<span class="msg nei_msg"></span>
						<div class="div_tou">
							<span align="right">图片：</span><input type="file" name="image" class="input_image">
							<span class="input_ima">自由选填</span><br>
							<span class="msg image_msg"></span><br>
							<ul></ul>
							<input type="button" value="立即发布" class="input_fabu">
						</div>
					</form>
				</div>
				<div class="div_z_x" id="div_z_x">
					<div class="div_tai" id="div_tai">
						<c:forEach items="${page.rows}" var="forum">
							<div class="div_find_1">
								<div class="find_1_l">
									<a href="${ctx}/pc/index/goFindUser.action?userId=${forum.userId}" title="查看个人资料" target="_blank">
										<div class="find_1_t"><img src="${forum.headerImage}" width="60" height="60"></div>
									</a>
								</div>
								<div class="find_1_z">${forum.nickName}</div>
								<div class="find_1_r"><fmt:formatDate value="${forum.createTime}" pattern="yyyy-MM-dd"/></div>
							</div>
							<div class="div_find_2">${forum.title}</div>
							<c:if test="${not empty forum.content}">
							<div class="div_find_3">${forum.content}</div>
							</c:if>
							<c:if test="${not empty forum.image}">
							<div class="div_find_4">
								<img src="${forum.image}">
							</div>
							</c:if>
							<div class="div_find_5" id="div_find_5">
								<span class="find_5_l" value="${forum.forumId}">收藏</span>
								<span class="find_5_r"  id="find_5_r" value="${forum.forumId}">评论</span>
							</div>
							<div  class="div_find_6" id="div_find_6">
								<textarea class="text_ping_nei" maxlength="45"></textarea><input type="button" class="input_ping" value="发表">
							</div>
							<ul class="ul_find_7" <c:if test="${not empty forum.forumReplys}">style="display: block;"</c:if>>
								<c:if test="${not empty forum.forumReplys}">
									<c:forEach items="${forum.forumReplys}" var="forumReply">
										<li>
											<span class="span_ni">${forumReply.nickName}：</span><span class="span_nei">${forumReply.replyContent}</span>
										</li>
									</c:forEach>
								</c:if>
							</ul>
						</c:forEach>
						<div class="ul_fenye">
							<ck:page url="${ctx}/pc/index/goForum.action"></ck:page>
						</div>
					</div>

				</div>
			</div>
			<div class="div_r">
			<c:forEach items="${advers}" var="adver">
			<c:if test="${adver.position == 2}">
				<div class="div_r_s">
					<div class="div_r_s_n"><img src="${adver.image}" width="230" height="300"></div>
					<div class="div_r_s_w">
						<span class="div_r_s_w_span_1">广告②</span>
						<span class="div_r_s_w_span_2">230×300</span>
					</div>
				</div>
			</c:if>
			</c:forEach>
			<c:forEach items="${advers}" var="adver">
			<c:if test="${adver.position == 3}">
				<div class="div_r_x">
					<div class="div_r_x_n"><img src="${adver.image}" width="230" height="300"></div>
					<div class="div_r_x_w">
						<span class="div_r_x_w_span_1">广告③</span>
						<span class="div_r_x_w_span_2">230×300</span>
					</div>
				</div>
			</c:if>
			</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="/pc/index/goFooter.action" />
</div>
<script type="text/javascript" src="${ctx}/pc/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	var headerImage = '';
	// 判断打开发布帖子面板
		$(".input_biao").focus(function(){
		$(".div_tou").css({"display":"block"});
		$(".input_guan").get(0).disabled=false;
	})

	//关闭发布帖子面板下半部分
	$(".input_guan").click(function(){
		$(".div_tou").css({"display":"none"});
		$(".input_guan").get(0).disabled=true;
	})

	// 判断标题是否为空
	$(".input_biao").focusout(function(){
		if ($(".input_biao").val()=="") {
			$(".biao_msg").text("标题不能为空！");
		}
		else{
			$(".biao_msg").text("");
		}
	})
	// 判断内容
	$(".text_nei").focusout(function(){
		if ($(".text_nei").val()!="") {
			$(".nei_msg").text("");
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
					      url: "${ctx}/imageUpload/forumImage.action",
					      data: file,
					      contentType: false, // 注意这里应设为false
					      processData: false,    //false
					      cache: false,    //缓存
					      success: function(res){
					    	  if(res.code == 0){
					    		  $(".div_tou ul").html("<li><img src="+res.msg+"></li>");
					    		  $(".image_msg").text("");
					    		  headerImage = res.msg;
					    	  }
					      }
					});
				}
			}
		}
	})
	
	// 发布帖子前判断内容是否为空
	$(".input_fabu").click(function(){
		if ($(".input_biao").val()=="") {
			$(".biao_msg").text("标题不能为空！");
		}
		else if($(".text_nei").val()==''&& headerImage==''){
			$(".nei_msg").text("内容和图片不能同时为空！");
		}
		else if('${pcUser}' == ''){
			alert("您尚未登录，请先登录！");
		}
		else{
			$.ajax({
                type: "POST",
                url: "${ctx}/pc/action/addForum.action",
                data: {
                    title: $(".input_biao").val(),
                    content: $(".text_nei").val(),
                    image: headerImage
                },
                success: function(res) {
                    if (res.code == 0) {
                    	$(".input_biao").val("");
                    	$(".text_nei").val("");
                    	$(".input_image").val("");
                    	window.location.reload();
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

	// 点击评论打开输入面板
	var forumId='';
	var find_5_r_nums=$("#div_tai #div_find_5 #find_5_r");
	// console.log($("#div_z_x").height());
	for(var i=0;i<find_5_r_nums.length;i++){
		$("#div_tai #div_find_5 #find_5_r:eq("+i+")").click(function(tai_num){
			return function(){
				forumId=$(this).attr("value");
				$(this).parent().next().css({"display":"block"});
			}
		}(i));
	}
	
	//添加评论内容
	function add_pingnei(add_ping,add_nei ){
		var ul_find_7=$(add_ping).parent().next();
		ul_find_7.css({"display":"block"});
		ul_find_7.append("<li><span class=\"span_ni\">${pcUser.nickName}：</span><span class=\"span_nei\">"+add_nei+"</span></li>");
	}
	
	//判断输入框是否有内容，并且评论后清空内容
	$(".input_ping").click(function(){
		var text_ping_neis=$(this).parent().children(".text_ping_nei");
		if('${pcUser}' == ''){
			alert("您尚未登录，请先登录！");
		}
		else if(text_ping_neis.val()!="") {
			var isLogin = true;
			$.ajax({
                type: "POST",
                url: "${ctx}/pc/action/addForumReply.action",
                data: {
                	"replyContent":text_ping_neis.val(),
 				    "forumId":forumId
                },
                success: function(res) {
                	if(res.code == 1){
 					   isLogin = false;
 					   alert("您尚未登录，请先登录！");
 				   }
                },
                error: function(res) {
              	  alert("网络错误");
                }
            });
			if(isLogin){
				// 添加评论内容
				add_pingnei(this,text_ping_neis.val());
				//清空内容关闭评论输入面板
				text_ping_neis.val("");
				$(this).parent().css({"display":"none"});
			}
			
		}
		else{
			alert("请输入评论内容！");
		}
	})
	
	//收藏帖子
	var find_5_l_nums=$("#div_tai #div_find_5 .find_5_l");
	for(var i=0;i<find_5_l_nums.length;i++){
		$("#div_tai #div_find_5 .find_5_l:eq("+i+")").click(function(nums){
			return function(){
				if("${pcUser}"==""){
					alert("您尚未登录，请先登录！");
				}
				else{
					$.ajax({
		                type: "POST",
		                url: "${ctx}/pc/action/addCollect.action",
		                data: {
		                	"forumId":$(this).attr("value"),
		                },
		                success: function(res) {
		                	if(res.code == 0){
		                		alert("收藏成功！");
		                	}
		                	if(res.code == 1){
		 					   alert("您尚未登录，请先登录！");
		 				   }
		                },
		                error: function(res) {
		              	  alert("网络错误");
		                }
		            });
				}
			};
		}(i));
	}
</script>
</body>
</html>