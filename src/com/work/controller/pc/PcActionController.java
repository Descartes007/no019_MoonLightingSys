package com.work.controller.pc;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.work.common.utils.BaseUtil;
import com.work.common.utils.JsonUtil;
import com.work.pojo.Chat;
import com.work.pojo.Collect;
import com.work.pojo.Forum;
import com.work.pojo.ForumReply;
import com.work.pojo.Mailbox;
import com.work.pojo.User;
import com.work.pojo.Work;
import com.work.service.ChatService;
import com.work.service.CollectService;
import com.work.service.ForumReplyService;
import com.work.service.ForumService;
import com.work.service.MailboxService;
import com.work.service.WorkService;

@Controller
@RequestMapping("/pc/action")
public class PcActionController extends BaseUtil{

	@Autowired
	private WorkService workService;
	@Autowired
	private ForumService forumService;
	@Autowired
	private ForumReplyService forumReplyService;
	@Autowired
	private CollectService collectService;
	@Autowired
	private ChatService chatService;
	@Autowired
	private MailboxService mailboxService;
	
	
	//发布帖子
	@RequestMapping("/addForum") 
	public void addForum(HttpServletRequest request,HttpServletResponse response,Forum forum){
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		if(pcUser == null){
			output(response,JsonUtil.buildFalseJson(1, "您尚未登录，请先登录！"));
		}else{
			forum.setUserId(pcUser.getUserId());
			forum.setCreateTime(new Date());
			forumService.addForum(forum);
			output(response,JsonUtil.buildFalseJson(0, "发布成功"));
		}
	}
	
	//发布评论
	@RequestMapping("/addForumReply")
	public void addForumReply(HttpServletRequest request,HttpServletResponse response,ForumReply forumReply){
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		if(pcUser == null){
			output(response,JsonUtil.buildFalseJson(1, "您尚未登录，请先登录！"));
		}else{
			forumReply.setUserId(pcUser.getUserId());
			forumReply.setReplyTime(new Date());
			forumReplyService.addForumReply(forumReply);
			output(response,JsonUtil.buildFalseJson(0, "发布成功"));
		}
	}
	
	//收藏帖子
	@RequestMapping("/addCollect")
	public void addCollect(HttpServletRequest request,HttpServletResponse response,Collect collect){
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		List<Collect> collects = collectService.getCollectList(collect, null, null);
		collect.setUserId(pcUser.getUserId());
		if(collects.size() > 0){
			output(response,JsonUtil.buildFalseJson(0, "收藏成功"));
		}else{
			collect.setCreateTime(new Date());
			collectService.addCollect(collect);
			output(response,JsonUtil.buildFalseJson(0, "收藏成功"));
		}
	}
	
	//发布兼职
	@RequestMapping("/addWork")
	public void addWork(HttpServletRequest request,HttpServletResponse response,Work work){
		User pcUser = (User) request.getSession().getAttribute("pcUser");
        if(pcUser == null){
			output(response,JsonUtil.buildFalseJson(1, "您尚未登录，请先登录！"));
		}
		else{
			work.setUserId(pcUser.getUserId());
			work.setCreateTime(new Date());
			workService.addWork(work);
			output(response,JsonUtil.buildFalseJson(0, "发布成功"));
		}
	}
	
	//聊天消息查询  
	@RequestMapping(value="/findChatList.action")
	public void findChat(User user,HttpServletRequest request,HttpServletResponse response){
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		Chat chat=new Chat();
		//设置发送方id
		chat.setUserIdFa(pcUser.getUserId());
		//设置接收方id
		chat.setUserIdJie(user.getUserId()); 
		List<Chat> chats = chatService.findChatList(chat, null, 30);
		//更新isLook
		chat.setUserIdFa(user.getUserId());
		chat.setUserIdJie(pcUser.getUserId());
		chat.setIsLook(1);
		chatService.updateChat(chat);
		output(response,JsonUtil.buildJsonByTotalCount(chats, 0));
	}
	
	//聊天消息数目 
	@RequestMapping(value="/findChatListCount.action")
	public void findChatListCount(User user,HttpServletRequest request,HttpServletResponse response){
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		Chat chat=new Chat();
		//设置发送方id
		chat.setUserIdFa(pcUser.getUserId());
		//设置接收方id
		chat.setUserIdJie(user.getUserId()); 
		Integer count = chatService.findChatListCount(chat);
		output(response,JsonUtil.buildFalseJson(count, "查询成功"));
	}
	
	//发送添加消息 
	@RequestMapping(value="/addChat.action")
	public void addChat(User user,HttpServletRequest request,HttpServletResponse response,Chat chat){
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		//设置发送方id
		chat.setUserIdFa(pcUser.getUserId());
		chat.setCreateTime(new Date());
		//判断聊天信号
		List<Chat> chats = chatService.findChatList(chat, null, null);
		if(chats.size() > 0){
			chat.setChatSignal(chats.get(0).getChatSignal());
		}else{
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
			String random = UUID.randomUUID().toString().replace("-", "").substring(0, 5);
			String chatSignal = format.format(new Date()) + random;
			chat.setChatSignal(chatSignal);
		}
		chatService.addChat(chat);
		output(response,JsonUtil.buildFalseJson(0, "发送成功！"));
	}
	
	//发送信件 
	@RequestMapping(value="/addMailbox.action")
	public void addMailbox(Mailbox mailbox,HttpServletRequest request,HttpServletResponse response){
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		mailbox.setUserId(pcUser.getUserId());
		mailbox.setCreateTime(new Date()); 
		mailboxService.addMailbox(mailbox);
		output(response,JsonUtil.buildFalseJson(0, "发送成功"));
	}
	
//	//发布兼职
//	@RequestMapping(value="/addWork.action")
//	public void addWork(Work work,HttpServletRequest request,HttpServletResponse response){
//		User pcUser = (User) request.getSession().getAttribute("pcUser");
//		work.setUserId(pcUser.getUserId());
//		work.setCreateTime(new Date());
//		workService.addWork(work);
//		output(response,JsonUtil.buildFalseJson(0, "发布成功"));
//	}
}
