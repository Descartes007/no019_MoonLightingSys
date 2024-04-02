package com.work.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.work.common.utils.BaseUtil;
import com.work.common.utils.JsonUtil;
import com.work.pojo.Notice;
import com.work.pojo.User;
import com.work.service.NoticeService;

@Controller
@RequestMapping("/server/notice")
public class NoticeController extends BaseUtil{

	@Autowired
	private NoticeService noticeService;
	
	//去公告列表
	@RequestMapping("/goNoticeList")
	public ModelAndView goNoticeList(ModelAndView mv){
		mv.setViewName("server/noticeManage/noticeList");
		return mv;
	}
	
	//获取公告列表
	@RequestMapping("/getNoticeList")
	public void getNoticeList(HttpServletResponse response,Notice notice,Integer page,Integer limit){
		if(page == null){
			page = 1;
		}
		if(limit == null){
			limit = 10;
		}
		int totalCount = noticeService.getNoticeListCount(notice);
		List<Notice> list = noticeService.getNoticeList(notice,(page-1) * limit, limit);
		output(response,JsonUtil.buildJsonByTotalCount(list, totalCount));
	}
	
	//去添加公告
	@RequestMapping("/goAddNotice")
	public ModelAndView goAddNotice(ModelAndView mv){
		mv.setViewName("server/noticeManage/addNotice");
		return mv;
	}
	
	//添加公告
	@RequestMapping("/addNotice")
	public void addNotice(HttpServletRequest request,HttpServletResponse response,Notice notice){
		User serverUser = (User) request.getSession().getAttribute("serverUser");
		notice.setCreateTime(new Date());
		notice.setUserId(serverUser.getUserId());
		noticeService.addNotice(notice);
		output(response,JsonUtil.buildFalseJson(0, "添加成功！"));
	}
	
	//去编辑公告
	@RequestMapping("/goUpdateNotice")
	public ModelAndView goUpdateNotice(ModelAndView mv,Integer id){
		Notice notice = noticeService.getNoticeById(id);
		mv.addObject("notice", notice);
		mv.setViewName("server/noticeManage/updateNotice");
		return mv;
	}
	
	//编辑公告
	@RequestMapping("/updateNotice")
	public void updateNotice(HttpServletResponse response,Notice notice){
		noticeService.updateNotice(notice);
		output(response,JsonUtil.buildFalseJson(0, "编辑成功！"));
	}

	//删除公告
	@RequestMapping("/deleteNotice")
	public void deleteNotice(HttpServletResponse response,Integer id){
		noticeService.deleteNoticeById(id);
		output(response,JsonUtil.buildFalseJson(0, "删除成功！"));
	}
	
}
