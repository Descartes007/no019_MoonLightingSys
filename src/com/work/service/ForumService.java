package com.work.service;

import java.util.List;
import com.work.pojo.Forum;

public interface ForumService {
	
	public List<Forum> getForumList(Forum forum, Integer page, Integer limit);
	public Integer getForumListCount(Forum forum);
	public void addForum(Forum forum);
	public void updateForum(Forum forum);
	public Forum getForumById(Integer id);
	
}
