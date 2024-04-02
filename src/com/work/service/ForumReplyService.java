package com.work.service;

import java.util.List;
import com.work.pojo.ForumReply;


public interface ForumReplyService {
	
	public List<ForumReply> getForumReplyList(ForumReply forumReply, Integer page, Integer limit);
	public Integer getForumReplyListCount(ForumReply forumReply);
	public void addForumReply(ForumReply forumReply);
	public void updateForumReply(ForumReply forumReply);
	public ForumReply getForumReplyById(Integer id);
	public void deleteForumReply(Integer replyId);
	
}
