package com.work.controller.pc;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.work.common.utils.BaseUtil;
import com.work.common.utils.JsonUtil;
import com.work.common.utils.MD5Util;
import com.work.common.utils.Page;
import com.work.pojo.Chat;
import com.work.pojo.Collect;
import com.work.pojo.Forum;
import com.work.pojo.ForumReply;
import com.work.pojo.QueryVo;
import com.work.pojo.SystemUpset;
import com.work.pojo.User;
import com.work.pojo.Work;
import com.work.service.ChatService;
import com.work.service.CollectService;
import com.work.service.ForumReplyService;
import com.work.service.ForumService;
import com.work.service.SystemUpsetService;
import com.work.service.UserService;
import com.work.service.WorkService;

@Controller
@RequestMapping("/pc/personal")
public class PcPersonalController extends BaseUtil{

	@Autowired
	private UserService userService;
	@Autowired
	private WorkService workService;
	@Autowired
	private ForumService forumService;
	@Autowired
	private SystemUpsetService systemUpsetService;
	@Autowired
	private ForumReplyService forumReplyService;
	@Autowired
	private ChatService chatService;
	@Autowired
	private CollectService collectService;
	
	//个人中心公共部分
	@RequestMapping(value="/goPersonalCommon.action")
	public ModelAndView goPersonalCommon(HttpServletRequest request,ModelAndView mv,SystemUpset systemUpset){
		User user = (User) request.getSession().getAttribute("pcUser");
		mv.addObject("user", user);
		//消息通知(聊天)
		String isNotice = "f";
		Chat chat = new Chat();
		chat.setUserIdJie(user.getUserId());
		chat.setIsLook(0);
		List<Chat> chats = chatService.getChatList(chat, null, null);
		if(chats.size() > 0){
			isNotice = "t";
		}
		//消息通知(帖子)
		Forum forum = new Forum();
		forum.setUserId(user.getUserId());
		forum.setIsEffect(1);
		List<Forum> forums = forumService.getForumList(forum, null, null);
		if(forums.size() > 0){
			ForumReply forumReply = new ForumReply();
			forumReply.setStatus(0);
			for(int i=0; i<forums.size(); i++){
				forumReply.setForumId(forums.get(i).getForumId());
				List<ForumReply>  forumReplys = forumReplyService.getForumReplyList(forumReply, null, null);
				if(forumReplys.size() > 0){
					isNotice = "t";
				}
			}
		}
		mv.addObject("isNotice", isNotice);
		mv.setViewName("pc/personal_common");
		return mv;
	}
	
	//个人中心
	@RequestMapping(value="/goPersonal.action")
	public ModelAndView goPersonal(HttpServletRequest request,ModelAndView mv,SystemUpset systemUpset){
		List<SystemUpset> systemUpsets = systemUpsetService.getSystemUpsetList(systemUpset, null, null);
		if(systemUpsets.size() > 0){
			mv.addObject("systemUpset", systemUpsets.get(0));
		}
		User user = (User) request.getSession().getAttribute("pcUser");
		mv.addObject("user", user);
		if(user == null){
			mv.setViewName("pc/login");
		}else{
			mv.setViewName("pc/personal_centre");
		}
		return mv;
	}
	
	//编辑资料
	@RequestMapping("/updateUser") 
	public void updateUser(HttpServletRequest request,HttpServletResponse response,User user){
		userService.updateUser(user);
		User pcUser = userService.getUserById(user.getUserId());
		request.getSession().setAttribute("pcUser",pcUser);
		output(response,JsonUtil.buildFalseJson(0, "编辑成功"));
	}
	
	//修改密码
	@RequestMapping("/updatePassword") 
	public void updatePassword(HttpServletRequest request,HttpServletResponse response,String passwordYes, String password, Integer userId){
		User user = new User();
		if(passwordYes.equals(password)){
			user.setUserId(userId);
			user.setPassword(MD5Util.MD5Encode(password,"utf-8"));
			userService.updateUser(user);
			request.getSession().removeAttribute("pcUser");
			output(response,JsonUtil.buildFalseJson(0, "修改密码成功"));
		}else{
			output(response,JsonUtil.buildFalseJson(1, "前后密码不一致"));
		}
	}
	
	//我的通知
	@RequestMapping(value="/goMyNotice.action")
	public ModelAndView goMyNotice(HttpServletRequest request,ModelAndView mv,SystemUpset systemUpset){
		User user = (User) request.getSession().getAttribute("pcUser");
		//聊天消息
		Chat chat = new Chat();
		chat.setUserIdFa(user.getUserId());
		List<Chat> chats = chatService.myChatList(chat);
		//消息通知(聊天)
		String isChat = "f";
		chat.setUserIdJie(user.getUserId());
		chat.setUserIdFa(null);
		chat.setIsLook(0);
		List<Chat> isChats = chatService.getChatList(chat, null, null);
		if(isChats.size() > 0){
			isChat = "t";
		}
		mv.addObject("isChat", isChat);
		mv.addObject("chats", chats);
		//评论消息
		String isReply = "f";
		Forum forum = new Forum();
		forum.setIsEffect(1);
		forum.setUserId(user.getUserId());
		List<Forum> isForums = forumService.getForumList(forum, null, null);
		List<Forum> forums = new ArrayList<>();
		if(isForums.size() > 0){
			ForumReply forumReply = new ForumReply();
			forumReply.setStatus(0);
			for(int i=0; i<isForums.size(); i++){
				forumReply.setForumId(isForums.get(i).getForumId());
				List<ForumReply>  forumReplys = forumReplyService.getForumReplyList(forumReply, null, null);
				if(forumReplys.size() > 0){
					isReply = "t";
					forums.add(isForums.get(i));
				}
			}
		}
		mv.addObject("isReply", isReply);
		mv.addObject("forums", forums);
		mv.addObject("user", user);
		mv.setViewName("pc/my_notice");
		return mv;
	}
	
	//从聊天列表删除
	@RequestMapping("/deleteMyChatList") 
	public void updateMyChatList(HttpServletRequest request,HttpServletResponse response,User user){
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		Chat chat = new Chat();
		//删除接收方
		chat.setUserIdFa(pcUser.getUserId());
		chat.setUserIdJie(user.getUserId());
		chat.setIsRemoveFa(1);
		chatService.updateChat(chat);
		//删除发送方
		chat.setUserIdFa(user.getUserId());
		chat.setUserIdJie(pcUser.getUserId());
		chat.setIsRemoveJie(1);
		chat.setIsRemoveFa(null);
		chatService.updateChat(chat);
		
		output(response,JsonUtil.buildFalseJson(0, "删除成功！"));
	}
	
	//查看帖子
	@RequestMapping(value="/goFindForum.action")
	public ModelAndView goFindForum(HttpServletRequest request,ModelAndView mv,SystemUpset systemUpset,Forum forum){
		List<SystemUpset> systemUpsets = systemUpsetService.getSystemUpsetList(systemUpset, null, null);
		if(systemUpsets.size() > 0){
			mv.addObject("systemUpset", systemUpsets.get(0));
		}
		forum = forumService.getForumById(forum.getForumId());
		ForumReply forumReply = new ForumReply();
		forumReply.setForumId(forum.getForumId());
		forum.setForumReplys(forumReplyService.getForumReplyList(forumReply, null, null));
		mv.addObject("forum", forum);
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		mv.addObject("pcUser", pcUser);
		int userId = forum.getUserId();
		if(userId == pcUser.getUserId()){
			forumReply.setStatus(1);
			forumReplyService.updateForumReply(forumReply);
		}
		mv.setViewName("pc/find_forum");
		return mv;
	}
	
	//我的兼职
	@RequestMapping(value="/goMyWork.action")
	public ModelAndView goMyWork(HttpServletRequest request,ModelAndView mv,SystemUpset systemUpset, QueryVo vo){
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		mv.addObject("pcUser", pcUser);
		//获取兼职
		Work work = new Work();
		Page<Work> page=new Page<Work>();
		work.setIsEffect(1);
		work.setUserId(pcUser.getUserId());
		if(vo.getSize()!=7){ 
			vo.setSize(7);
		}
		if(vo.getPage()==null){
			vo.setPage(1);
		}
		//每页数
		page.setSize(vo.getSize());
		if (vo != null){
			//判断当前页
			if(vo.getPage() != null) {
				page.setPage(vo.getPage());
				vo.setStartRow((vo.getPage() -1)*vo.getSize());
			}
			page.setTotal(workService.getWorkListCount(work));
			page.setRows(workService.getWorkList(work, (vo.getPage()-1) * vo.getSize(), vo.getSize()));
		}
		mv.addObject("page", page);
		mv.setViewName("pc/my_work");
		return mv;
	}
	
	//删除兼职
	@RequestMapping("/deleteMyWork") 
	public void deleteMyWork(HttpServletRequest request,HttpServletResponse response,Work work){
		work.setIsEffect(0);
		workService.updateWork(work);
		output(response,JsonUtil.buildFalseJson(0, "删除成功！"));
	}
	
	//我的帖子
	@RequestMapping(value="/goMyForum.action")
	public ModelAndView goMyForum(HttpServletRequest request,ModelAndView mv, QueryVo vo){
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		mv.addObject("pcUser", pcUser);
		//获取帖子
		Forum forum = new Forum();
		Page<Forum> page=new Page<Forum>();
		forum.setIsEffect(1);
		forum.setUserId(pcUser.getUserId());
		if(vo.getSize()!=7){ 
			vo.setSize(7);
		}
		if(vo.getPage()==null){
			vo.setPage(1);
		}
		//每页数
		page.setSize(vo.getSize());
		if (vo != null){
			//判断当前页
			if(vo.getPage() != null) {
				page.setPage(vo.getPage());
				vo.setStartRow((vo.getPage() -1)*vo.getSize());
			}
			page.setTotal(forumService.getForumListCount(forum));
			page.setRows(forumService.getForumList(forum, (vo.getPage()-1) * vo.getSize(), vo.getSize()));
		}
		mv.addObject("page", page);
		mv.setViewName("pc/my_forum");
		return mv;
	}
	
	//删除帖子
	@RequestMapping("/deleteMyForum") 
	public void deleteMyForum(HttpServletRequest request,HttpServletResponse response,Forum forum){
		forum.setIsEffect(0);
		forumService.updateForum(forum);
		output(response,JsonUtil.buildFalseJson(0, "删除成功！"));
	}
	
	//我的收藏
	@RequestMapping(value="/goMyCollect.action")
	public ModelAndView goMyCollect(HttpServletRequest request,ModelAndView mv, QueryVo vo){
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		mv.addObject("pcUser", pcUser);
		//获取收藏
		Collect collect = new Collect();
		collect.setUserId(pcUser.getUserId());
		//保存帖子
		Page<Forum> page = new Page<Forum>();
		List<Forum> forums = new ArrayList(); 
		if(vo.getSize()!=7){ 
			vo.setSize(7);
		}
		if(vo.getPage()==null){
			vo.setPage(1);
		}
		//每页数
		page.setSize(vo.getSize());
		if (vo != null){
			//判断当前页
			if(vo.getPage() != null) {
				page.setPage(vo.getPage());
				vo.setStartRow((vo.getPage() -1)*vo.getSize());
			}
			page.setTotal(collectService.getCollectListCount(collect));
			List<Collect> collects = collectService.getCollectList(collect, (vo.getPage()-1) * vo.getSize(), vo.getSize());
			Forum forum = new Forum();
			forum.setIsEffect(1);
			for(int i = 0; i<collects.size(); i++){
				forum.setForumId(collects.get(i).getForumId());
				List<Forum> forumy = forumService.getForumList(forum, null, null);
				if(forumy.size() > 0){
					forums.add(forumy.get(0));
				}
			}
			page.setRows(forums);
		}
		mv.addObject("page", page);
		mv.setViewName("pc/my_collect");
		return mv;
	}
	
	//取消收藏
	@RequestMapping("/deleteMyCollect") 
	public void deleteMyCollect(HttpServletRequest request,HttpServletResponse response,Forum forum){
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		Collect collect = new Collect();
		collect.setUserId(pcUser.getUserId());
		collect.setForumId(forum.getForumId());
		collectService.deleteMyCollect(collect);
		output(response,JsonUtil.buildFalseJson(0, "删除成功！"));
	}
	
	//去设置密保
	@RequestMapping(value="/goPassword.action")
	public ModelAndView goPassword(HttpServletRequest request,ModelAndView mv){
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		mv.addObject("pcUser", pcUser);
		mv.setViewName("pc/get_password");
		return mv;
	}
	
	//设置密保
	@RequestMapping("/setQuestion") 
	public void setQuestion(HttpServletRequest request,HttpServletResponse response,User user){
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		user.setUserId(pcUser.getUserId());
		userService.updateUser(user);
		pcUser.setQuestion(user.getQuestion());
		pcUser.setAnswer(user.getAnswer());
		request.getSession().setAttribute("pcUser",pcUser);
		output(response,JsonUtil.buildFalseJson(0, "设置成功！"));
	}
	
}
