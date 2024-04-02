package com.work.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.work.common.utils.BaseUtil;
import com.work.common.utils.JsonUtil;


@Controller
@RequestMapping("/imageUpload")
public class ImageUploadController extends BaseUtil {
	//上传头像
	@RequestMapping(value = "/headerImage")
	public void headerImage(@RequestParam(value = "file") CommonsMultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String respJson = null;
		if (file == null) {
			respJson = JsonUtil.buildFalseJson(-1, "上传文件为空!");
			output(response, respJson);
			return;
		}
		if (file.getSize() > 5000000) { // 5M
			respJson = JsonUtil.buildFalseJson(-2, "文件大小限制在5M以内!");
			output(response, respJson);
			return;
		}
		Date now = new Date();
		String random = UUID.randomUUID().toString().replace("-", "").substring(0, 5);
		String houzui = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),
				file.getOriginalFilename().length());
		String filename = format.format(now) + random + houzui;// 文件名
		String path = request.getServletContext().getRealPath("/") + "headerImages" + "/" + filename;// 文件所在盘路径

		String contextPath = request.getContextPath();// 项目名
		String port = request.getServerPort() == 80 ? "" : ":" + request.getServerPort();
		String url = request.getScheme() + "://" + request.getServerName() + port + contextPath + "/headerImages/"
				+ filename;
		File oldFile = new File(path);
		file.transferTo(oldFile);
		respJson = JsonUtil.buildFalseJson(0, url);
		output(response, respJson);
	}
	//兼职图片
	@RequestMapping(value = "/workImage")
	public void workImage(@RequestParam(value = "file") CommonsMultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String respJson = null;
		if (file == null) {
			respJson = JsonUtil.buildFalseJson(-1, "上传文件为空!");
			output(response, respJson);
			return;
		}
		if (file.getSize() > 5000000) { // 5M
			respJson = JsonUtil.buildFalseJson(-2, "文件大小限制在5M以内!");
			output(response, respJson);
			return;
		}
		Date now = new Date();
		String random = UUID.randomUUID().toString().replace("-", "").substring(0, 5);
		String houzui = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),
				file.getOriginalFilename().length());
		String filename = format.format(now) + random + houzui;// 文件名
		String path = request.getServletContext().getRealPath("/") + "workImages" + "/" + filename;// 文件所在盘路径

		String contextPath = request.getContextPath();// 项目名
		String port = request.getServerPort() == 80 ? "" : ":" + request.getServerPort();
		String url = request.getScheme() + "://" + request.getServerName() + port + contextPath + "/workImages/"
				+ filename;
		File oldFile = new File(path);
		file.transferTo(oldFile);
		System.out.println("file:"+oldFile.getAbsolutePath());
		respJson = JsonUtil.buildFalseJson(0, url);
		output(response, respJson);
	}
	//帖子图片
	@RequestMapping(value = "/forumImage")
	public void forumImage(@RequestParam(value = "file") CommonsMultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String respJson = null;
		if (file == null) {
			respJson = JsonUtil.buildFalseJson(-1, "上传文件为空!");
			output(response, respJson);
			return;
		}
		if (file.getSize() > 5000000) { // 5M
			respJson = JsonUtil.buildFalseJson(-2, "文件大小限制在5M以内!");
			output(response, respJson);
			return;
		}
		Date now = new Date();
		String random = UUID.randomUUID().toString().replace("-", "").substring(0, 5);
		String houzui = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),
				file.getOriginalFilename().length());
		String filename = format.format(now) + random + houzui;// 文件名
		String path = request.getServletContext().getRealPath("/") + "forumImages" + "/" + filename;// 文件所在盘路径

		String contextPath = request.getContextPath();// 项目名
		String port = request.getServerPort() == 80 ? "" : ":" + request.getServerPort();
		String url = request.getScheme() + "://" + request.getServerName() + port + contextPath + "/forumImages/"
				+ filename;
		File oldFile = new File(path);
		file.transferTo(oldFile);
		respJson = JsonUtil.buildFalseJson(0, url);
		output(response, respJson);
	}
	//聊天图片
	@RequestMapping(value = "/chatImage")
	public void chatImage(@RequestParam(value = "file") CommonsMultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String respJson = null;
		if (file == null) {
			respJson = JsonUtil.buildFalseJson(-1, "上传文件为空!");
			output(response, respJson);
			return;
		}
		if (file.getSize() > 5000000) { // 5M
			respJson = JsonUtil.buildFalseJson(-2, "文件大小限制在5M以内!");
			output(response, respJson);
			return;
		}
		Date now = new Date();
		String random = UUID.randomUUID().toString().replace("-", "").substring(0, 5);
		String houzui = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),
				file.getOriginalFilename().length());
		String filename = format.format(now) + random + houzui;// 文件名
		String path = request.getServletContext().getRealPath("/") + "chatImages" + "/" + filename;// 文件所在盘路径
		
		String contextPath = request.getContextPath();// 项目名
		String port = request.getServerPort() == 80 ? "" : ":" + request.getServerPort();
		String url = request.getScheme() + "://" + request.getServerName() + port + contextPath + "/chatImages/"
				+ filename;
		File oldFile = new File(path);
		file.transferTo(oldFile);
		respJson = JsonUtil.buildFalseJson(0, url);
		output(response, respJson);
	}
	//信件图片
	@RequestMapping(value = "/mailboxImage")
	public void mailboxImage(@RequestParam(value = "file") CommonsMultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String respJson = null;
		if (file == null) {
			respJson = JsonUtil.buildFalseJson(-1, "上传文件为空!");
			output(response, respJson);
			return;
		}
		if (file.getSize() > 5000000) { // 5M
			respJson = JsonUtil.buildFalseJson(-2, "文件大小限制在5M以内!");
			output(response, respJson);
			return;
		}
		Date now = new Date();
		String random = UUID.randomUUID().toString().replace("-", "").substring(0, 5);
		String houzui = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),
				file.getOriginalFilename().length());
		String filename = format.format(now) + random + houzui;// 文件名
		String path = request.getServletContext().getRealPath("/") + "mailboxImages" + "/" + filename;// 文件所在盘路径
		
		String contextPath = request.getContextPath();// 项目名
		String port = request.getServerPort() == 80 ? "" : ":" + request.getServerPort();
		String url = request.getScheme() + "://" + request.getServerName() + port + contextPath + "/mailboxImages/"
				+ filename;
		File oldFile = new File(path);
		file.transferTo(oldFile);
		respJson = JsonUtil.buildFalseJson(0, url);
		output(response, respJson);
	}
	//系统图片、广告、轮播、公告
	@RequestMapping(value = "/systemImage")
	public void systemImage(@RequestParam(value = "file") CommonsMultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String respJson = null;
		if (file == null) {
			respJson = JsonUtil.buildFalseJson(-1, "上传文件为空!");
			output(response, respJson);
			return;
		}
		if (file.getSize() > 5000000) { // 5M
			respJson = JsonUtil.buildFalseJson(-2, "文件大小限制在5M以内!");
			output(response, respJson);
			return;
		}
		Date now = new Date();
		String random = UUID.randomUUID().toString().replace("-", "").substring(0, 5);
		String houzui = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),
				file.getOriginalFilename().length());
		String filename = format.format(now) + random + houzui;// 文件名
		String path = request.getServletContext().getRealPath("/") + "systemImages" + "/" + filename;// 文件所在盘路径
		
		String contextPath = request.getContextPath();// 项目名
		String port = request.getServerPort() == 80 ? "" : ":" + request.getServerPort();
		String url = request.getScheme() + "://" + request.getServerName() + port + contextPath + "/systemImages/"
				+ filename;
		File oldFile = new File(path);
		file.transferTo(oldFile);
		respJson = JsonUtil.buildFalseJson(0, url);
		output(response, respJson);
	}
	
}
