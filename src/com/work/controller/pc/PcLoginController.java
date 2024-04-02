package com.work.controller.pc;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.work.common.utils.BaseUtil;
import com.work.common.utils.JsonUtil;
import com.work.common.utils.MD5Util;
import com.work.pojo.SystemUpset;
import com.work.pojo.User;
import com.work.service.SystemUpsetService;
import com.work.service.UserService;

@Controller
@RequestMapping("/pc/login")
public class PcLoginController extends BaseUtil{

	@Autowired
	private UserService userService;
	@Autowired
	private SystemUpsetService systemUpsetService;
	
	//去登录页面
	@RequestMapping(value="/goLogin")
	public ModelAndView goLogin(HttpServletResponse response,HttpServletRequest request,ModelAndView mv,SystemUpset systemUpset){
		List<SystemUpset> systemUpsets = systemUpsetService.getSystemUpsetList(systemUpset, null, null);
		if(systemUpsets.size() > 0){
			mv.addObject("systemUpset", systemUpsets.get(0));
		}
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		if(pcUser == null){
			mv.setViewName("pc/login");
		}else{
			mv.addObject("updatePage", "y");
			mv.setViewName("pc/index");
		}
		return mv;
	}
	
	//执行登录
	@RequestMapping(value="/doLogin")
	public void doLogin(HttpServletRequest request,HttpServletResponse response,User user){
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		if(pcUser == null){
			if(user.getUserId() == null){
	        	output(response,JsonUtil.buildFalseJson(1,"账号不能为空"));
	        }
			if(user.getPassword().equals("") || user.getPassword() == null){
      		  	output(response,JsonUtil.buildFalseJson(1,"密码不能为空"));
      	  	}
			User userInfo = userService.getUserById(user.getUserId());
  		  	if(userInfo == null){
  		  		output(response,JsonUtil.buildFalseJson(1,"账号不正确或系统不存在该用户"));
  		  	}		  
  		  	if(!userInfo.getPassword().equals(MD5Util.MD5Encode(user.getPassword(),"utf-8"))){
  		  		output(response,JsonUtil.buildFalseJson(1,"您输入的密码不正确,请重试")); 
  		  	}		  
  		  	//判断账号是否被禁用
  		  	if(userInfo.getIsEffect() != 1){
  		  		output(response,JsonUtil.buildFalseJson(1,"对不起您的账号已被禁用"));
  		  	}else{
  		  		//执行登陆后台的逻辑
  		  		request.getSession().setAttribute("pcUser",userInfo);
  		  		output(response,JsonUtil.buildFalseJson(0,"登录成功"));
  		  	}
		}else{
			output(response,JsonUtil.buildFalseJson(0,"您已登录，无需重复登录"));
		}
	}
	
	//退出登录
	@RequestMapping(value="/outLogin")
	public void outLogin(HttpServletRequest request,HttpServletResponse response,User user){
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		if(pcUser != null){
			//销毁session
			request.getSession().invalidate();;
			output(response, JsonUtil.buildFalseJson(0, "退出登录成功!"));
		}else{
			output(response, JsonUtil.buildFalseJson(1, "您还未登陆不能执行退出操作"));
		}
	}
	
	//去注册页面
	@RequestMapping(value="/goRegister")
	public ModelAndView goRegister(ModelAndView mv,HttpServletRequest request,SystemUpset systemUpset){
		List<SystemUpset> systemUpsets = systemUpsetService.getSystemUpsetList(systemUpset, null, null);
		if(systemUpsets.size() > 0){
			mv.addObject("systemUpset", systemUpsets.get(0));
		}
		User user = (User) request.getSession().getAttribute("pcUser");
		if(user != null){
			mv.setViewName("pc/index");
		}else{
			mv.setViewName("pc/register");
		}
		return mv;
	}
	
	//检测昵称是否重复
	@RequestMapping(value="/findUserByNickName")
	public void findUserByNickName(HttpServletRequest request,HttpServletResponse response,User user){
		User userInfo = userService.getUserByNickName(user);
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		if(pcUser != null){
			if(userInfo != null && !pcUser.getNickName().equals(user.getNickName())){
				output(response, JsonUtil.buildFalseJson(0, "该昵称已被用户使用"));
			}else{
				output(response, JsonUtil.buildFalseJson(1, "该昵称未被用户使用"));
			}
		}else{
			if(userInfo != null){
				output(response, JsonUtil.buildFalseJson(0, "该昵称已被用户使用"));
			}else{
				output(response, JsonUtil.buildFalseJson(1, "该昵称未被用户使用"));
			}
		}
	}
	
	//执行注册
	@RequestMapping(value="/doRegister")
	public void doRegister(HttpServletRequest request,HttpServletResponse response,User user){
		user.setIsEffect(1);
		user.setUserLeven(0);
		user.setIsWork(0);
		user.setPassword(MD5Util.MD5Encode(user.getPassword(),"utf-8"));
		user.setCreateTime(new Date());
		userService.addUser(user);
		Integer userId =  user.getUserId();
		output(response, JsonUtil.buildFalseJson(0, String.valueOf(userId)));
	}
	
	//判断账号有没有设置密保
	@RequestMapping(value="/isQuestion")
	public void isQuestion(HttpServletRequest request,HttpServletResponse response,User user){
		User userInfo = userService.getUserById(user.getUserId());
		if(userInfo == null || userInfo.getIsEffect() == 0){
			output(response, JsonUtil.buildFalseJson(1, "该账号不存在！"));
		}else if(userInfo.getQuestion() == null || userInfo.getQuestion().equals("")){
			output(response, JsonUtil.buildFalseJson(1, "该账号没有设置密保！"));
		}else{
			output(response, JsonUtil.buildFalseJson(0, "该账号已设置密保！"));
		}
	}
	
	//去找回密码
	@RequestMapping(value="/goForgetPassword")
	public ModelAndView goForgetPassword(ModelAndView mv,HttpServletRequest request,User user){
		SystemUpset systemUpset = new SystemUpset(); 
		List<SystemUpset> systemUpsets = systemUpsetService.getSystemUpsetList(systemUpset, null, null);
		if(systemUpsets.size() > 0){
			mv.addObject("systemUpset", systemUpsets.get(0));
		}
		User userInfo = userService.getUserById(user.getUserId());
		mv.addObject("user", userInfo);
		mv.setViewName("pc/forget_password");
		return mv;
	}
	
	//判断答案是否正确
	@RequestMapping(value="/isAnswer")
	public void isAnswer(HttpServletRequest request,HttpServletResponse response,User user){
		User userInfo = userService.getUserById(user.getUserId());
		if(userInfo.getAnswer().equals(user.getAnswer())){
			request.getSession().setAttribute("temUser",userInfo);
			output(response, JsonUtil.buildFalseJson(0, "答案正确！"));
		}else{
			output(response, JsonUtil.buildFalseJson(1, "答案错误！"));
		}
	}
	
	//去设置新密码
	@RequestMapping(value="/goSetPassword")
	public ModelAndView goSetPassword(ModelAndView mv,HttpServletRequest request){
		SystemUpset systemUpset = new SystemUpset(); 
		List<SystemUpset> systemUpsets = systemUpsetService.getSystemUpsetList(systemUpset, null, null);
		if(systemUpsets.size() > 0){
			mv.addObject("systemUpset", systemUpsets.get(0));
		}
		mv.setViewName("pc/set_password");
		return mv;
	}
	
	//修改密码
	@RequestMapping("/updatePassword") 
	public void updatePassword(HttpServletRequest request,HttpServletResponse response,String passwordYes, String password){
		User temUser = (User) request.getSession().getAttribute("temUser");
		User user = new User();
		if(passwordYes.equals(password)){
			user.setUserId(temUser.getUserId());
			user.setPassword(MD5Util.MD5Encode(password,"utf-8"));
			userService.updateUser(user);
			output(response,JsonUtil.buildFalseJson(0, "修改密码成功"));
		}else{
			output(response,JsonUtil.buildFalseJson(1, "前后密码不一致"));
		}
	}
}
