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
import com.work.pojo.Banner;
import com.work.pojo.User;
import com.work.service.BannerService;

@Controller
@RequestMapping("/server/banner")
public class BannerController extends BaseUtil{

	@Autowired
	private BannerService bannerService;
	
	//去轮播列表
	@RequestMapping("/goBannerList")
	public ModelAndView goBannerList(ModelAndView mv){
		mv.setViewName("server/bannerManage/bannerList");
		return mv;
	}
	
	//获取轮播列表
	@RequestMapping("/getBannerList")
	public void getBannerList(HttpServletResponse response,Banner banner,Integer page,Integer limit){
		if(page == null){
			page = 1;
		}
		if(limit == null){
			limit = 10;
		}
		int totalCount = bannerService.getBannerListCount(banner);
		List<Banner> list = bannerService.getBannerList(banner,(page-1) * limit, limit);
		output(response,JsonUtil.buildJsonByTotalCount(list, totalCount));
	}
	
	//去添加轮播
	@RequestMapping("/goAddBanner")
	public ModelAndView goAddBanner(ModelAndView mv){
		mv.setViewName("server/bannerManage/addBanner");
		return mv;
	}
	
	//添加轮播
	@RequestMapping("/addBanner")
	public void addBanner(HttpServletRequest request,HttpServletResponse response,Banner banner){
		User serverUser = (User) request.getSession().getAttribute("serverUser");
		banner.setCreateTime(new Date());
		banner.setUserId(serverUser.getUserId());
		bannerService.addBanner(banner);
		output(response,JsonUtil.buildFalseJson(0, "添加成功！"));
	}
	
	//去编辑轮播
	@RequestMapping("/goUpdateBanner")
	public ModelAndView goUpdateBanner(ModelAndView mv,Integer id){
		Banner banner = bannerService.getBannerById(id);
		mv.addObject("banner", banner);
		mv.setViewName("server/bannerManage/updateBanner");
		return mv;
	}
	
	//编辑轮播
	@RequestMapping("/updateBanner")
	public void updateBanner(HttpServletResponse response,Banner banner){
		bannerService.updateBanner(banner);
		output(response,JsonUtil.buildFalseJson(0, "编辑成功！"));
	}

	//禁用轮播
	@RequestMapping("/deleteBanner")
	public void deleteBanner(HttpServletResponse response,Banner banner){
		bannerService.updateBanner(banner);
		output(response,JsonUtil.buildFalseJson(0, "禁用成功！"));
	}

}
