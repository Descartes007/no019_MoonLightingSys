package com.work.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.work.mapper.ForumMapper;
import com.work.pojo.Forum;
import com.work.service.ForumService;

@Service
public class ForumServiceImpl implements ForumService{

	@Autowired
	private ForumMapper forumMapper;

	@Override
	public List<Forum> getForumList(Forum forum, Integer page, Integer limit) {
		return forumMapper.getForumList(forum, page, limit);
	}

	@Override
	public Integer getForumListCount(Forum forum) {
		return forumMapper.getForumListCount(forum);
	}

	@Override
	public void addForum(Forum forum) {
		forumMapper.addForum(forum);
	}

	@Override
	public void updateForum(Forum forum) {
		forumMapper.updateForum(forum);
	}

	@Override
	public Forum getForumById(Integer id) {
		return forumMapper.getForumById(id);
	}
	
	

}
