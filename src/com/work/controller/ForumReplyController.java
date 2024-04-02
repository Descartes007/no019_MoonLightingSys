package com.work.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.work.common.utils.BaseUtil;
import com.work.common.utils.JsonUtil;
import com.work.pojo.ForumReply;
import com.work.service.ForumReplyService;

@Controller
@RequestMapping("/server/reply")
public class ForumReplyController extends BaseUtil{
	
	@Autowired
	private ForumReplyService forumReplyService;
	
	//去帖子列表
	@RequestMapping("/goForumReplyList")
	public ModelAndView goForumReplyList(ModelAndView mv,ForumReply forumReply){
		mv.setViewName("server/forumManage/replyList");
		mv.addObject("forumReply", forumReply);
		return mv;
	}
	
	//获取帖子列表
	@RequestMapping("/getForumReplyList")
	public void getForumReplyList(HttpServletResponse response,ForumReply forumReply,Integer page,Integer limit){
		if(page == null){
			page = 1;
		}
		if(limit == null){
			limit = 10;
		}
		int totalCount = forumReplyService.getForumReplyListCount(forumReply);
		List<ForumReply> list = forumReplyService.getForumReplyList(forumReply,(page-1) * limit, limit);
		output(response,JsonUtil.buildJsonByTotalCount(list, totalCount));
	}
	
	//去编辑评论
	@RequestMapping("/goUpdateForumReply")
	public ModelAndView goUpdateForumReply(ModelAndView mv,Integer replyId){
		ForumReply forumReply = forumReplyService.getForumReplyById(replyId);
		mv.addObject("forumReply", forumReply);
		mv.setViewName("server/forumManage/updateReply");
		return mv;
	}
	
	//编辑评论
	@RequestMapping("/updateForumReply")
	public void updateForumReply(HttpServletResponse response,ForumReply forumReply){
		forumReplyService.updateForumReply(forumReply);
		output(response,JsonUtil.buildFalseJson(0, "编辑成功！"));
	}

	//删除评论
	@RequestMapping("/deleteForumReply")
	public void deleteForumReply(HttpServletResponse response,ForumReply forumReply){
		forumReplyService.deleteForumReply(forumReply.getReplyId()); 
		output(response,JsonUtil.buildFalseJson(0, "删除成功！"));
	}
	
	

}
