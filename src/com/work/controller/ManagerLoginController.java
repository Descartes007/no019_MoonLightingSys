package com.work.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
@RequestMapping("/manager/login")
public class ManagerLoginController extends BaseUtil {
	@Resource
	private UserService userService;
	@Resource
	private SystemUpsetService systemUpsetService;
	/**
	 * 管理后台登陆接口
	 * 
	 * @param request
	 * @param response
	 * @param ga
	 */
	@RequestMapping("/dologin")
	public void doLogin(HttpServletRequest request, HttpServletResponse response, User user) throws Exception {
		User serverUser = (User) request.getSession().getAttribute("serverUser");
		if(serverUser == null){
			if(user.getUserId() == null){
	        	  output(response,JsonUtil.buildFalseJson(1,"账号不能为空"));
	          }else{
	        	  if(user.getPassword().equals("") || user.getPassword() == null){
	        		  output(response,JsonUtil.buildFalseJson(1,"密码不能为空"));
	        	  }else{
	        		  User userInfo = userService.getUserById(user.getUserId());
	        		  if(userInfo == null || userInfo.getUserLeven() != 1){
	        			  output(response,JsonUtil.buildFalseJson(1,"账号不正确或系统不存在该用户"));
	        		  }else{
	        			  if(!userInfo.getPassword().equals(MD5Util.MD5Encode(user.getPassword(),"utf-8"))){
	        				  output(response,JsonUtil.buildFalseJson(1,"您输入的密码不正确,请重试")); 
	        			  }else{
	        				  //判断账号是否被禁用
	        				  if(userInfo.getIsEffect() != 1){
	        					  output(response,JsonUtil.buildFalseJson(1,"对不起您的账号已被禁用"));
	        				  }else{
	        					  //执行登陆后台的逻辑
	        					  request.getSession().setAttribute("serverUser",userInfo);
	        					  output(response, JsonUtil.buildFalseJson(0, "登陆成功,欢迎登录兼职平台管理系统"));
	        				  }
	        			  }
	        		  }
	        	  }
	          }
		}else{
			output(response, JsonUtil.buildFalseJson(0, "登陆成功,欢迎登录兼职平台管理系统"));
		}
		
	}

	@RequestMapping("/goIndex")
	public ModelAndView goHome(ModelAndView mv, HttpServletRequest request,SystemUpset systemUpset) {
		User serverUser = (User) request.getSession().getAttribute("serverUser");
		if (serverUser == null) { // 已退出
			mv.setViewName("server/login");
		} else {
			List<SystemUpset> systems = systemUpsetService.getSystemUpsetList(systemUpset, 0, 10);
			if(systems.size() > 0){
				mv.addObject("system", systems.get(0));
			}else{
				mv.addObject("system", null);
			}
			mv.setViewName("server/index");
		}
		mv.addObject("serverUser", serverUser);
		return mv;
	}

	@RequestMapping("/goServerLogin")
	public ModelAndView goHome(ModelAndView mv) {
		mv.setViewName("server/login");
		return mv;
	}

	@RequestMapping("/goMain")
	public ModelAndView goMain(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("server/main");
		return mv;
	}

	@RequestMapping("/dologout")
	public void managerLogOut(ModelAndView modelView, HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		output(response, JsonUtil.buildFalseJson(0, "退出成功"));
	}

	@RequestMapping("/goUpdatePassword")
	public ModelAndView goUpdatePassword(HttpServletRequest request, ModelAndView mv) {
		mv.setViewName("server/updatePwd");
		return mv;
	}
	
	//修改密码
	@RequestMapping("/updatePassword") 
	public void updatePassword(HttpServletRequest request,HttpServletResponse response,String rePassword, String password){
		User serverUser = (User) request.getSession().getAttribute("serverUser");
		User user = new User();
		if(password.equals(rePassword)){
			user.setUserId(serverUser.getUserId());
			user.setPassword(MD5Util.MD5Encode(password,"utf-8"));
			userService.updateUser(user);
			request.getSession().invalidate();
			output(response,JsonUtil.buildFalseJson(0, "修改密码成功"));
		}else{
			output(response,JsonUtil.buildFalseJson(1, "前后密码不一致"));
		}
	}
}
