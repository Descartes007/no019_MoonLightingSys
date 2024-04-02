package com.work.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.work.common.utils.BaseUtil;
import com.work.common.utils.JsonUtil;
import com.work.pojo.Collect;
import com.work.service.CollectService;

@Controller
@RequestMapping("/server/collect")
public class CollectController extends BaseUtil{

	@Autowired
	private CollectService collectService;
	
	//去收藏列表
	@RequestMapping("/goCollectList")
	public ModelAndView goCollectList(ModelAndView mv){
		mv.setViewName("server/collectManage/collectList");
		return mv;
	}
	
	//获取收藏列表
	@RequestMapping("/getCollectList")
	public void getCollectList(HttpServletResponse response,Collect collect,Integer page,Integer limit){
		if(page == null){
			page = 1;
		}
		if(limit == null){
			limit = 10;
		}
		int totalCount = collectService.getCollectListCount(collect);
		List<Collect> list = collectService.getCollectList(collect,(page-1) * limit, limit);
		output(response,JsonUtil.buildJsonByTotalCount(list, totalCount));
	}
	
	//删除收藏
	@RequestMapping("/deleteCollect")
	public void deleteCollect(HttpServletResponse response,Integer id){
		collectService.deleteCollectById(id);
		output(response,JsonUtil.buildFalseJson(0, "删除成功！"));
	}
	
}
