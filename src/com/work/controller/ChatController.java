package com.work.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.work.common.utils.BaseUtil;
import com.work.common.utils.JsonUtil;
import com.work.pojo.Chat;
import com.work.service.ChatService;

@Controller
@RequestMapping(value="/server/chat")
public class ChatController extends BaseUtil{

	@Autowired
	private ChatService chatService;
	
	//去聊天列表
	@RequestMapping("/goChatList")
	public ModelAndView goChatList(ModelAndView mv){
		mv.setViewName("server/chatManage/chatList");
		return mv;
	}
	
	//获取聊天列表
	@RequestMapping("/getChatList")
	public void getChatList(HttpServletResponse response,Chat chat,Integer page,Integer limit){
		if(page == null){
			page = 1;
		}
		if(limit == null){
			limit = 10;
		}
		int totalCount = chatService.getChatListCount(chat);
		List<Chat> list = chatService.getChatList(chat,(page-1) * limit, limit);
		output(response,JsonUtil.buildJsonByTotalCount(list, totalCount));
	}
	
	//去编辑聊天
	@RequestMapping("/goUpdateChat")
	public ModelAndView goUpdateChat(ModelAndView mv,Integer id){
		Chat chat = chatService.getChatById(id);
		mv.addObject("chat", chat);
		mv.setViewName("server/chatManage/updateChat");
		return mv;
	}
	
	//编辑聊天
	@RequestMapping("/updateChat")
	public void updateChat(HttpServletResponse response,Chat chat){
		chatService.updateChat(chat);
		output(response,JsonUtil.buildFalseJson(0, "编辑成功！"));
	}

	//删除聊天
	@RequestMapping("/deleteChat")
	public void deleteChat(HttpServletResponse response,Integer id){
		chatService.deleteChatByChatId(id);
		output(response,JsonUtil.buildFalseJson(0, "删除成功！"));
	}

}
