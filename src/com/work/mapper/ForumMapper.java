package com.work.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.work.pojo.Forum;

public interface ForumMapper {
	
	public List<Forum> getForumList(@Param("forum")Forum forum, @Param("page")Integer page, @Param("limit")Integer limit);
	public Integer getForumListCount(@Param("forum")Forum forum);
	public void addForum(@Param("forum")Forum forum);
	public void updateForum(@Param("forum")Forum forum);
	public Forum getForumById(@Param("forumId")Integer forumId);
	
	
}
