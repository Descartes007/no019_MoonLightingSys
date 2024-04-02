package com.work.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.work.mapper.ForumReplyMapper;
import com.work.pojo.ForumReply;
import com.work.service.ForumReplyService;

@Service
public class ForumReplyServiceImpl implements ForumReplyService{

	@Autowired
	private ForumReplyMapper forumReplyMapper;

	@Override
	public List<ForumReply> getForumReplyList(ForumReply forumReply,
			Integer page, Integer limit) {
		return forumReplyMapper.getForumReplyList(forumReply, page, limit);
	}

	@Override
	public Integer getForumReplyListCount(ForumReply forumReply) {
		return forumReplyMapper.getForumReplyListCount(forumReply);
	}

	@Override
	public void addForumReply(ForumReply forumReply) {
		forumReplyMapper.addForumReply(forumReply);
	}

	@Override
	public void updateForumReply(ForumReply forumReply) {
		forumReplyMapper.updateForumReply(forumReply);
	}

	@Override
	public ForumReply getForumReplyById(Integer id) {
		return forumReplyMapper.getForumReplyById(id);
	}

	@Override
	public void deleteForumReply(Integer replyId) {
		forumReplyMapper.deleteForumReply(replyId);
	}
	
	
}
