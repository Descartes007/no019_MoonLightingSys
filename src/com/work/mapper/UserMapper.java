package com.work.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.work.pojo.User;

public interface UserMapper{
	
	public List<User> getUserList(@Param("user")User user, @Param("page")Integer page, @Param("limit")Integer limit);
	public Integer getUserListCount(@Param("user")User user);
	public void addUser(@Param("user")User user);
	public void updateUser(@Param("user")User user);
	public User getUserById(@Param("userId")Integer userId);
	public User getUser(@Param("user")User user);
	public User getUserByNickName(@Param("user")User user);
}
