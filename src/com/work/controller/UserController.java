package com.work.controller;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.work.common.utils.BaseUtil;
import com.work.common.utils.JsonUtil;
import com.work.common.utils.MD5Util;
import com.work.pojo.User;
import com.work.service.UserService;

@Controller
@RequestMapping("/server/user")
public class UserController extends BaseUtil{
	@Autowired
	private UserService userService;
	
	//去用户列表
	@RequestMapping("/goUserList")
	public ModelAndView goUserList(ModelAndView mv){
		mv.setViewName("server/userManage/userList");
		return mv;
	}
	
	//获取用户列表
	@RequestMapping("/getUserList")
	public void getUserList(HttpServletResponse response,User user,Integer page,Integer limit){
		if(page == null){
			page = 1;
		}
		if(limit == null){
			limit = 10;
		}
		Integer totalCount = userService.getUserListCount(user);
		List<User> list = userService.getUserList(user,(page-1) * limit, limit);
		output(response,JsonUtil.buildJsonByTotalCount(list, totalCount));
	}
	
	//去添加用户
	@RequestMapping("/goAddUser")
	public ModelAndView goAddUser(ModelAndView mv){
		mv.setViewName("server/userManage/addUser");
		return mv;
	}
	
	//添加用户
	@RequestMapping("/addUser")
	public void addUser(HttpServletResponse response,User user){
		user.setCreateTime(new Date());
		user.setPassword(MD5Util.MD5Encode(user.getPassword(),"utf-8"));
		userService.addUser(user);
		output(response,JsonUtil.buildFalseJson(0, "添加成功！"));
	}
	
	//去编辑用户
	@RequestMapping("/goUpdateUser")
	public ModelAndView goUpdateUser(ModelAndView mv,Integer userId){
		User user = userService.getUserById(userId);
		mv.addObject("user", user);
		mv.setViewName("server/userManage/updateUser");
		return mv;
	}
	
	//编辑用户
	@RequestMapping("/updateUser")
	public void updateUser(HttpServletResponse response,User user){
		userService.updateUser(user);
		output(response,JsonUtil.buildFalseJson(0, "编辑成功！"));
	}

	//禁用用户
	@RequestMapping("/deleteUser")
	public void deleteUser(HttpServletResponse response,User user){
		userService.updateUser(user);
		output(response,JsonUtil.buildFalseJson(0, "禁用成功！"));
	}
	

}
