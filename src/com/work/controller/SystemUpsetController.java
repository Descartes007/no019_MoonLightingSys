package com.work.controller;

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
import com.work.pojo.SystemUpset;
import com.work.pojo.User;
import com.work.service.SystemUpsetService;

@Controller
@RequestMapping("/server/system")
public class SystemUpsetController extends BaseUtil{

	@Autowired
	private SystemUpsetService systemUpsetService;
	
	//去设置页面
	@RequestMapping("/goAddSystemUpset")
	public ModelAndView goAddSystemUpset(ModelAndView mv,SystemUpset systemUpset){
		List<SystemUpset> systems = systemUpsetService.getSystemUpsetList(systemUpset, 0, 10);
		if(systems.size() > 0){
			mv.addObject("system", systems.get(0));
		}else{
			mv.addObject("system", null);
		}
		mv.setViewName("server/systemUpsetManage/updateSystemUpset");
		return mv;
	}
	
	//设置信息
	@RequestMapping("/addSystemUpset")
	public void addSystemUpset(HttpServletRequest request,HttpServletResponse response,SystemUpset systemUpset){
		User serverUser = (User) request.getSession().getAttribute("serverUser");
		systemUpset.setCreateTime(new Date());
		systemUpset.setUserId(serverUser.getUserId());
		if(systemUpset.getId() != null){
			systemUpsetService.updateSystemUpset(systemUpset);
		}else{
			systemUpsetService.addSystemUpset(systemUpset);
		}
		output(response,JsonUtil.buildFalseJson(0, "设置成功！"));
	}

	
}
