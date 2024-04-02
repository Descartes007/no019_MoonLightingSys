package com.work.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.work.mapper.ChatMapper;
import com.work.pojo.Chat;
import com.work.service.ChatService;

@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private ChatMapper chatMapper;

	@Override
	public List<Chat> getChatList(Chat chat, Integer page, Integer limit) {
		return chatMapper.getChatList(chat, page, limit);
	}

	@Override
	public Integer getChatListCount(Chat chat) {
		return chatMapper.getChatListCount(chat);
	}

	@Override
	public void addChat(Chat chat) {
		chatMapper.addChat(chat);
	}

	@Override
	public void updateChat(Chat chat) {
		chatMapper.updateChat(chat);
	}

	@Override
	public Chat getChatById(Integer id) {
		return chatMapper.getChatById(id);
	}

	@Override
	public void deleteChatByChatId(int id) {
		chatMapper.deleteChatById(id);
	}
	
	@Override
	public List<Chat> findChatList(Chat chat, Integer page, Integer limit) {
		return chatMapper.findChatList(chat, page, limit);
	}
	
	@Override
	public Integer findChatListCount(Chat chat) {
		return chatMapper.findChatListCount(chat);
	}

	@Override
	public List<Chat> myChatList(Chat chat) {
		return chatMapper.myChatList(chat);
	}
	
	


	
}
