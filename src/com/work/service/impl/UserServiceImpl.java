package com.work.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.work.service.UserService;
import com.work.mapper.UserMapper;
import com.work.pojo.User;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	@Override
	public List<User> getUserList(User user, Integer page, Integer limit) {
		return userMapper.getUserList(user, page, limit);
	}
	
	@Override
	public Integer getUserListCount(User user) {
		return userMapper.getUserListCount(user);
	}
	
	

	@Override
	public void addUser(User user) {
		userMapper.addUser(user);
	}
	
	@Override
	public User getUserById(Integer userId) {
		User user = userMapper.getUserById(userId);
		return user;
	}

	@Override
	public void updateUser(User user) {
		userMapper.updateUser(user);
	}

	@Override
	public User getUser(User user) {
		return userMapper.getUser(user);
	}

	@Override
	public User getUserByNickName(User user) {
		return userMapper.getUserByNickName(user);
	}
	
	
	
}
