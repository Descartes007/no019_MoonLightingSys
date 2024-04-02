package com.work.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.work.common.utils.BaseUtil;
import com.work.common.utils.JsonUtil;
import com.work.pojo.Forum;
import com.work.service.ForumService;


@Controller
@RequestMapping("/server/forum")
public class ForumController extends BaseUtil{

	@Autowired
	private ForumService forumService;
	
	//去帖子列表
	@RequestMapping("/goForumList")
	public ModelAndView goForumList(ModelAndView mv){
		mv.setViewName("server/forumManage/forumList");
		return mv;
	}
	
	//获取帖子列表
	@RequestMapping("/getForumList")
	public void getForumList(HttpServletResponse response,Forum forum,Integer page,Integer limit){
		if(page == null){
			page = 1;
		}
		if(limit == null){
			limit = 10;
		}
		int totalCount = forumService.getForumListCount(forum);
		List<Forum> list = forumService.getForumList(forum,(page-1) * limit, limit);
		output(response,JsonUtil.buildJsonByTotalCount(list, totalCount));
	}
	
	//去编辑帖子
	@RequestMapping("/goUpdateForum")
	public ModelAndView goUpdateUser(ModelAndView mv,Integer forumId){
		Forum forum = forumService.getForumById(forumId);
		mv.addObject("forum", forum);
		mv.setViewName("server/forumManage/updateForum");
		return mv;
	}
	
	//编辑帖子
	@RequestMapping("/updateForum")
	public void updateForum(HttpServletResponse response,Forum forum){
		forumService.updateForum(forum);
		output(response,JsonUtil.buildFalseJson(0, "编辑成功！"));
	}

	//禁用兼职
	@RequestMapping("/deleteForum")
	public void deleteForum(HttpServletResponse response,Forum forum){
		forumService.updateForum(forum);
		output(response,JsonUtil.buildFalseJson(0, "禁用成功！"));
	}
	

}
