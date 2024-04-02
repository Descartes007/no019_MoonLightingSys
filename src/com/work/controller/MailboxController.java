package com.work.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.work.common.utils.BaseUtil;
import com.work.common.utils.JsonUtil;
import com.work.pojo.Mailbox;
import com.work.service.MailboxService;

@Controller
@RequestMapping("/server/mailbox")
public class MailboxController extends BaseUtil{

	@Autowired
	private MailboxService mailboxService;
	
	//去信箱列表
	@RequestMapping("/goMailboxList")
	public ModelAndView goMailboxList(ModelAndView mv){
		mv.setViewName("server/mailboxManage/mailboxList");
		return mv;
	}
	
	//获取信箱列表
	@RequestMapping("/getMailboxList")
	public void getMailboxList(HttpServletResponse response,Mailbox mailbox,Integer page,Integer limit){
		if(page == null){
			page = 1;
		}
		if(limit == null){
			limit = 10;
		}
		int totalCount = mailboxService.getMailboxListCount(mailbox);
		List<Mailbox> list = mailboxService.getMailboxList(mailbox,(page-1) * limit, limit);
		output(response,JsonUtil.buildJsonByTotalCount(list, totalCount));
	}
	
	//去查看信件
	@RequestMapping("/goUpdateMailbox")
	public ModelAndView goUpdateMailbox(ModelAndView mv,Integer id){
		Mailbox mailbox = mailboxService.getMailboxById(id);
		mv.addObject("mailbox", mailbox);
		mv.setViewName("server/mailboxManage/updateMailbox");
		return mv;
	}
	
	//编辑信件
	@RequestMapping("/updateMailbox")
	public void updateMailbox(HttpServletResponse response,Mailbox mailbox){
		mailboxService.updateMailbox(mailbox);
		output(response,JsonUtil.buildFalseJson(0, "编辑成功！"));
	}

	//删除信件
	@RequestMapping("/deleteMailbox")
	public void deleteMailbox(HttpServletResponse response,Integer id){
		mailboxService.deleteMailboxById(id);
		output(response,JsonUtil.buildFalseJson(0, "删除成功！"));
	}

	
}
