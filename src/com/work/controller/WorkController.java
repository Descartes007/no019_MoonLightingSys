package com.work.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.work.common.utils.BaseUtil;
import com.work.common.utils.JsonUtil;
import com.work.pojo.Work;
import com.work.service.WorkService;

@Controller
@RequestMapping("/server/work")
public class WorkController extends BaseUtil{
	
	@Autowired
	private WorkService workService;
	
	//去兼职列表
	@RequestMapping("/goWorkList")
	public ModelAndView goWorkList(ModelAndView mv){
		mv.setViewName("server/workManage/workList");
		return mv;
	}
	
	//获取兼职列表
	@RequestMapping("/getWorkList")
	public void getWorkList(HttpServletResponse response,Work work,Integer page,Integer limit){
		if(page == null){
			page = 1;
		}
		if(limit == null){
			limit = 10;
		}
		int totalCount = workService.getWorkListCount(work);
		List<Work> list = workService.getWorkList(work,(page-1) * limit, limit);
		output(response,JsonUtil.buildJsonByTotalCount(list, totalCount));
	}
	
	//去编辑兼职
	@RequestMapping("/goUpdateWork")
	public ModelAndView goUpdateUser(ModelAndView mv,Integer id){
		Work work = workService.getWorkById(id);
		mv.addObject("work", work);
		mv.setViewName("server/workManage/updateWork");
		return mv;
	}
	
	//编辑兼职
	@RequestMapping("/updateWork")
	public void updateWork(HttpServletResponse response,Work work){
		workService.updateWork(work);
		output(response,JsonUtil.buildFalseJson(0, "编辑成功！"));
	}

	//禁用兼职
	@RequestMapping("/deleteWork")
	public void deleteUser(HttpServletResponse response,Work work){
		workService.updateWork(work);
		output(response,JsonUtil.buildFalseJson(0, "禁用成功！"));
	}

	
	

}
