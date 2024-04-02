package com.work.common.utils;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.work.pojo.SystemUpset;
import com.work.pojo.User;
import com.work.service.SystemUpsetService;

public class LoginInterceptor implements HandlerInterceptor {

	@Autowired
	private SystemUpsetService systemUpsetService;
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		//系统配置
		SystemUpset systemUpset = new SystemUpset();
		List<SystemUpset> systemUpsets = systemUpsetService.getSystemUpsetList(systemUpset, null, null);
		if(systemUpsets.size() > 0){
			request.setAttribute("systemUpset", systemUpsets.get(0));
		}
		//请求链接
		String url = request.getRequestURI();
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		User serverUser = (User) request.getSession().getAttribute("serverUser");
		
		//对个人中心和动作请求进行拦截
		if(url.contains("pc/personal") || url.contains("pc/action")){
			if(pcUser != null){
				return true;
			}
			else{
				request.setAttribute("msg", "您还没有登录，请先登录！");
				request.getRequestDispatcher("/WEB-INF/jsp/pc/login.jsp").forward(request, response);
				return false;
			}
		}
		//后台管理进行拦截
		if(url.contains("server")){
			if(serverUser != null){
				return true;
			}
			else{
				request.setAttribute("msg", "您还没有登录，请先登录！");
				request.getRequestDispatcher("/WEB-INF/jsp/server/login.jsp").forward(request, response);
				return false;
			}
		}
		
		return true;
	}
}
