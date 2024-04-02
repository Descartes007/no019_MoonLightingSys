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
	<title>兼职平台—首页</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/pc/css/index.css">
	<link rel="icon" type="image/x-icon" href="${ctx}/pc/images/titleLogo.png">
</head>
<body>
<div class="page">
	<div class="top">
		<div class="top_zhong">
			<div class="top_zhong_le">
				<p>${systemUpset.welcomText}</p>
			</div>
			<div class="top_zhong_ri">
				<c:if test="${pcUser == null}">
					<ul class="top_zhong_ul01">
						<li><a href="${ctx}/pc/index/goMailbox.action" class="a_ping" target="_self"><span class="span_ping">平台信箱</span></a></li>
						<li><a href="${ctx}/pc/login/goLogin.action" class="a_deng"><span class="span_deng" align="right">登录</span></a></li>
						<li><span class="span_xian"></span><a href="${ctx}/pc/login/goRegister.action" class="a_zhu"><span class="span_zhu">注册</span></a></li>
					</ul>
				</c:if>
				<c:if test="${pcUser != null}">
					<ul class="top_zhong_ul02">
						<li><a href="${ctx}/pc/index/goMailbox.action" class="a_ping" target="_self"><span class="span_ping">平台信箱</span></a></li>
						<li>
							<a href="#" class="a_deng">
								<span class="span_deng" align="right">${pcUser.nickName}</span>
							</a>
							<ul class="top_zhong_ul03">
								<li><a href="${ctx}/pc/personal/goPersonal.action"><span class="span_ul031" align="center">个人中心</span></a></li>
								<li><a href="${ctx}/pc/index/goPublishWork.action" target="_self"><span class="span_ul032" align="center">发布兼职</span></a></li>
								<li><a href=""><span class="span_ul034" align="center">退出登录</span></a></li>
							</ul>
						</li>
						<li>
							<span class="span_xian"></span>
							<span class="span_tou">
								<img src="${pcUser.headerImage}" width="26" height="26">
							</span>
						</li>
					</ul>
				</c:if>
			</div>
		</div>
	</div>
	<div class="daohang" id="daohang">
		<div class="daohang_zhong">
			<div class="daohang_logo">
				<div class="daohang_logo01">
					<a href="${ctx}/pc/index/goIndex.action" title="平台首页"><img src="${systemUpset.companyLogo}" width="200" height="60"></a>
				</div>
			</div>
			<div class="daohang_find">
				<div class="daohang_find01">
					<input type="text" name="" class="input_find" id="input_find" placeholder="关键字：家教、传单"><span class="span_find"><span>查找</span></span>
				</div>
			</div>
			<div class="daohang_daohang">
				<ul>
					<li><a href="${ctx}/pc/index/goForum.action" class="a_lun"><span class="span_lun">论坛交流</span></a></li>
					<li><a href="${ctx}/pc/personal/goPersonal.action" class="a_ge"><span class="span_ge">个人中心</span></a></li>
					<li><a href="${ctx}/pc/index/goNotice.action" class="a_tai"><span class="span_tai">平台公告</span></a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="banner" id="banner">
		<div class="banner-slider" id="banner-slider">
			<ul class="banner-ul" id="banner-ul">
				<c:forEach items="${banners}" var="banner">
					<li><img src="${banner.image}" alt=""/></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="q_work">
		<div class="q_work_zhong">
			<div class="q_work_zhong_s">
			</div>
			<ul class="q_work_zhong_z">
				<li class="q_li_work02"><span  align="center">全部兼职</span></li>
			</ul>
			<div class="q_work_zhong_x">
				<ul class="q_ul_work01">
					<c:forEach items="${page.rows}" var="work">
						<li class="q_li_ul_work01">
							<div class="q_div_work_t">
								<a href="${ctx}/pc/index/goFindUser.action?userId=${work.userId}" title="查看个人资料" target="_blank">
									<div class="q_div_work_to"><img src="${work.headerImage}" width="60px" height="60px"></div>
								</a>
							</div>
							<div class="q_div_work_b">
								<ul>
									<li class="q_li_work_b"><a href="${ctx}/pc/index/goFindWork.action?id=${work.id}" title="查看兼职详细信息" target="_blank"><span class="q_span_work_b">主题：${work.title}</span></a></li>
									<li><span class="q_span_work_c">电话：${work.phone}</span></li>
									<li>
									<span class="q_span_work_t"><fmt:formatDate value="${work.createTime}" pattern="yyyy-MM-dd"/></span>
									<span class="q_span_work_s"><c:if test="${work.isEffect == 1}">正常</c:if><c:if test="${work.isEffect == 0}">失效</c:if></span>
									</li>
								</ul>
							</div>
						</li>
					</c:forEach>
				</ul>
				<div class="ul_work02">
					<ck:page url="${ctx}/pc/index/goIndex.action"></ck:page>
				</div>
			</div>
		</div>
	</div>
	<div class="work">
		<div class="work_zhong">
			<div class="work_zhong_s">
				<span class="span_work01"></span>
				<span></span>
				<span></span>
				<span></span>
				<span></span>
				<span></span>
				<span></span>
				<span></span>
			</div>
			<ul class="work_zhong_z">
				<li class="li_work02"><span align="center">促销</span></li>
				<li><span  align="center">传单派发</span></li>
				<li><span  align="center">设计</span></li>
				<li><span  align="center">家教</span></li>
				<li><span  align="center">会计</span></li>
				<li><span  align="center">计算机</span></li>
				<li><span  align="center">服务员</span></li>
				<li><span  align="center">其他</span></li>
			</ul>
			<ul class="work_zhong_x">
				<li class="li_w li_work"><ul class="ul_work01"></ul></li>
				<li class="li_w"><ul class="ul_work01"></ul></li>
				<li class="li_w"><ul class="ul_work01"></ul></li>
				<li class="li_w"><ul class="ul_work01"></ul></li>
				<li class="li_w"><ul class="ul_work01"></ul></li>
				<li class="li_w"><ul class="ul_work01"></ul></li>
				<li class="li_w"><ul class="ul_work01"></ul></li>
				<li class="li_w"><ul class="ul_work01"></ul></li>
			</ul>
		</div>
	</div>
	<div class="guanggao">
		<div class="guanggao_zhong">
			<div class="guanggao_zhong_s">
				<span>平台合作伙伴</span>
			</div>
			<div class="guanggao_zhong_x">
				<ul>
					<li><a href="https://store.meizu.com/" title="魅族官网" target="_blank"><span><img src="${ctx}/pc/images/meizu.png" width="170" height="102"></span></a></li>
					<li><a href="https://www.taobao.com/" title="淘宝网" target="_blank"><span><img src="${ctx}/pc/images/taobao.png" width="170" height="102"></span></a></li>
					<li><a href="https://www.mi.com/" title="小米官网" target="_blank"><span><img src="${ctx}/pc/images/xiaomi.png" width="170" height="102"></span></a></li>
					<li><a href="https://www.jd.com/" title="京东官网" target="_blank"><span><img src="${ctx}/pc/images/jingdong.png" width="170" height="102"></span></a></li>
					<li><a href="https://www.huawei.com/cn/" title="华为官网" target="_blank"><span><img src="${ctx}/pc/images/huawei.png" width="170" height="102"></span></a></li>
					<li><a href="https://www.lenovo.com.cn/" title="联想官网" target="_blank"><span><img src="${ctx}/pc/images/lianxiang.png" width="170" height="102"></span></a></li>
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="/pc/index/goFooter.action" />
	
</div>
<script type="text/javascript" src="${ctx}/pc/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	//导航置顶判断begin
	$(window).scroll(function(){
		if($(document).scrollTop()>=40){
			$("#daohang").addClass("daohang_1").removeClass("daohang");
			$("#lunbo").css("margin-top",100);
		}
		else{
			$("#daohang").addClass("daohang").removeClass("daohang_1");
			$("#lunbo").css("margin-top",0);
		}
	})

	//轮播图交互样式 begin
	$("#banner").append("<div></div>");
	$("#banner div:last").addClass("circle");
	//存储标签   定时器   动画偏移量   动画方向  li标签宽   运动到第几个标签
	var lunbo_lis=null,lunbo_spans=null;
	var lunbo_timer=null;
	var lunbo_num=0;			  
	var lunbo_left=true;
	var li_width=$("#banner").width();
	var lunbo_f=1;   
	//浏览窗口宽度改变，重新设置li宽度，动画偏移量，动画方向
	$(window).resize(function(){
		clearInterval(lunbo_timer);
		 li_width=$("#banner").width();
		 $("#banner-ul li").width(li_width);
		 lunbo_num=(lunbo_f-1)*-li_width;
		 lunbo_fun();
		 lunbo_timer=setInterval(lunbo_fun,4000);
	});	
	//获取li设置li宽度		
	lunbo_lis=$("#banner-ul li");
	$("#banner-ul li").width(li_width);
	$("#banner-slider").width(li_width*lunbo_lis.length);
	$("#banner-ul").width(li_width*lunbo_lis.length);
	//设置span
	$(".circle").append("<p></p>");
	for(var i=0;i<lunbo_lis.length;i++){
		$(".circle p").append("<span></span>");
		$(".circle span").addClass("span_circle");
		if(i==0){
			$(".circle span").addClass("current");
		}
	}
	//获取span
	lunbo_spans=$(".circle span");
	//设置span样式
	var span_fun=function (j){
		for(var i=0;i<lunbo_spans.length;i++){
			if(i!=j){
				$(".circle span:eq("+i+")").removeClass("current");
			}
			else{
				$(".circle span:eq("+i+")").addClass("current");
			}
		}
	}
	var lunbo_fun=function(){
		if(lunbo_left){
			lunbo_num=lunbo_num-li_width;
		}
		else{
			lunbo_num=lunbo_num+li_width;
		}
		if(lunbo_num==0 || (lunbo_num<100 && lunbo_num>-100)){
			lunbo_left=true;
		}
		if(lunbo_num==-li_width*(lunbo_lis.length-1) || (lunbo_num<-li_width*(lunbo_lis.length-1)+100&&lunbo_num>-li_width*(lunbo_lis.length-1)-100)){
			lunbo_left=false;
		}
		$("#banner-slider").css({"left":lunbo_num+"px"});
		if(lunbo_num==0){
			lunbo_f=Math.round(lunbo_num/li_width)+1;
			span_fun(Math.round(lunbo_num/li_width));
		}
		else{
			lunbo_f=Math.round(lunbo_num/-li_width)+1;
			span_fun(Math.round(lunbo_num/-li_width));
		}
	}
	//定时器
	lunbo_timer=setInterval(lunbo_fun,4000);	
	//设置鼠标悬停和离开
	for(var i=0;i<lunbo_spans.length;i++){
		$(".circle span:eq("+i+")").get(0).index=i;
		$(".circle span:eq("+i+")").mouseenter(function(){
			clearInterval(lunbo_timer);
			lunbo_num=this.index*-li_width+li_width;
			lunbo_left=true;
			lunbo_fun();
		})
		$(".circle span:eq("+i+")").mouseleave(function(){
			lunbo_timer=setInterval(lunbo_fun,4000);
		})
	}
	//轮播图交互样式 end

	//tab栏交互样式 begin
	var work_lis=$(".work_zhong_z li");
	for(var i=0;i<work_lis.length;i++){
		$(".work_zhong_z li").get(i).index=i;
		$(".work_zhong_z li:eq("+i+")").mouseenter(function(){
			var _this = this;
			setTimeout(function(){
				var i=_this.index;
				$(".work_zhong_s span").removeClass("span_work01");
				$(".work_zhong_z li").removeClass("li_work02");
				$(".work_zhong_x .li_w").removeClass("li_work");

				$(".work_zhong_s span:eq("+i+")").addClass("span_work01");
				$(".work_zhong_z li:eq("+i+")").addClass("li_work02");
				$(".work_zhong_x .li_w:eq("+i+")").addClass("li_work");
				$(".work_zhong_x .li_work .ul_work01 li").remove();
				var workCate = $(".work_zhong_z .li_work02 span").text();
				$.ajax({
	                type: "POST",
	                url: "${ctx}/pc/index/getWorkByWorkCate.action",
	                data: {
	                	"workCategory":workCate,
	                	"isEffect":1
	                },
	                success: function(res) {
	                	if(res.count > 0){
	                		for(var i=0; i<res.count; i++){
		                		$(".work_zhong_x .li_work .ul_work01").append("<li class=\"li_ul_work01\"><div class=\"div_work_t\"><a href=\"${ctx}/pc/index/goFindUser.action?userId="+res.data[i].userId+"\" title=\"查看个人资料\" target=\"_blank\"><div class=\"div_work_to\"><img src="+res.data[i].headerImage+" width=\"60px\" height=\"60px\"></div></a></div><div class=\"div_work_b\"><ul><li class=\"li_work_b\"><a href=\"${ctx}/pc/index/goFindWork.action?id="+res.data[i].id+"\" title=\"查看兼职详细信息\" target=\"_blank\"><span class=\"span_work_b\">标题："+res.data[i].title+"</span></a></li><li><span class=\"span_work_c\">电话："+res.data[i].phone+"</span></li><li><span class=\"span_work_t\">"+res.data[i].createTimes+"</span><span class=\"span_work_s\">正常</span></li></ul></div></li>");
		                	}
	                	}else{
	                		$(".work_zhong_x .li_work .ul_work01").html("<p style=\"color:#999;padding:15px;\">该项暂无数据</p>");
	                	}
	                },
	                error: function(res){
	                	$(".work_zhong_x .li_work .ul_work01").html("<p style=\"color:red;padding:15px;\">网络错误</p>");
	                }
	            }); 
			},100);
		})
	}
	$(".work_zhong_x .li_work .ul_work01 li").remove();
	$.ajax({
        type: "POST",
        url: "${ctx}/pc/index/getWorkByWorkCate.action",
        data: {
        	"workCategory":'促销',
        	"isEffect":1
        },
        success: function(res) {
        	if(res.count > 0){
        		for(var i=0; i<res.count; i++){
            		$(".work_zhong_x .li_work .ul_work01").append("<li class=\"li_ul_work01\"><div class=\"div_work_t\"><a href=\"${ctx}/pc/index/goFindUser.action?userId="+res.data[i].userId+"\" title=\"查看个人资料\" target=\"_blank\"><div class=\"div_work_to\"><img src="+res.data[i].headerImage+" width=\"60px\" height=\"60px\"></div></a></div><div class=\"div_work_b\"><ul><li class=\"li_work_b\"><a href=\"${ctx}/pc/index/goFindWork.action?id="+res.data[i].id+"\" title=\"查看兼职详细信息\" target=\"_blank\"><span class=\"span_work_b\">标题："+res.data[i].title+"</span></a></li><li><span class=\"span_work_c\">电话："+res.data[i].phone+"</span></li><li><span class=\"span_work_t\">"+res.data[i].createTimes+"</span><span class=\"span_work_s\">正常</span></li></ul></div></li>");
            	}
        	}else{
        		$(".work_zhong_x .li_work .ul_work01").html("<p style=\"color:#999;padding:15px;\">该项暂无数据</p>");
        	}
        },
        error: function(res){
        	$(".work_zhong_x .li_work .ul_work01").html("<p style=\"color:red;padding:15px;\">网络错误</p>");
        }
    });
	
	//退出登录
	$(".span_ul034").click(function(){
		var tf=confirm("确定退出登录吗？");
		if(tf==true){
			$.ajax({
                type: "POST",
                url: "${ctx}/pc/login/outLogin.action",
                data: {},
                success: function(res) {
                    if (res.code == 0) {
                    	window.location.href="${ctx}/pc/index/goIndex.action";
                    } else {
                  	  alert(res.msg);
                    }
                },
                error: function(res) {
              	  alert("网络错误");
                }
            });
		}
	});
	
	//用户查找兼职
	$(".span_find span").click(function(){
		if($(".input_find").val()==""){
			alert("请输入搜索关键词！");
		}
		else{
			var work_str=$(".input_find").val();
			var url="${ctx}/pc/index/goIndex.action?workCategory=".concat(work_str);
			window.location.href=url;
		}
	});
	
	//刷新
	if("${updatePage}" == "y"){
		window.location.href="${ctx}/pc/index/goIndex.action";
	}
	
	//滚动条偏移
	if("${isScroll}" == 't'){
		$(document).scrollTop(440);
	}
	
	
</script>
</body>
</html>