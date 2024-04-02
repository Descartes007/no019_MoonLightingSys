package com.work.controller.pc;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.work.common.utils.BaseUtil;
import com.work.common.utils.JsonUtil;
import com.work.common.utils.Page;
import com.work.pojo.Adver;
import com.work.pojo.Banner;
import com.work.pojo.Chat;
import com.work.pojo.Forum;
import com.work.pojo.ForumReply;
import com.work.pojo.Notice;
import com.work.pojo.QueryVo;
import com.work.pojo.SystemUpset;
import com.work.pojo.User;
import com.work.pojo.Work;
import com.work.service.AdverService;
import com.work.service.BannerService;
import com.work.service.ChatService;
import com.work.service.ForumReplyService;
import com.work.service.ForumService;
import com.work.service.NoticeService;
import com.work.service.SystemUpsetService;
import com.work.service.UserService;
import com.work.service.WorkService;

@Controller
@RequestMapping("/pc/index")
public class PcIndexController extends BaseUtil{

	@Autowired
	private AdverService adverService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private WorkService workService;
	@Autowired
	private UserService userService;
	@Autowired
	private ForumService forumService;
	@Autowired
	private ChatService chatService;
	@Autowired
	private BannerService bannerService;
	@Autowired
	private SystemUpsetService systemUpsetService;
	@Autowired
	private ForumReplyService forumReplyService;
	
	//公共头部
	@RequestMapping(value="/goHeader.action")
	public ModelAndView goHeader(HttpServletRequest request,ModelAndView mv,SystemUpset systemUpset){
		List<SystemUpset> systemUpsets = systemUpsetService.getSystemUpsetList(systemUpset, null, null);
		if(systemUpsets.size() > 0){
			mv.addObject("systemUpset", systemUpsets.get(0));
		}
		mv.setViewName("pc/header");
		return mv;
	}
	
	//公共尾部
	@RequestMapping(value="/goFooter.action")
	public ModelAndView goFooter(ModelAndView mv,SystemUpset systemUpset){
		List<SystemUpset> systemUpsets = systemUpsetService.getSystemUpsetList(systemUpset, null, null);
		if(systemUpsets.size() > 0){
			mv.addObject("systemUpset", systemUpsets.get(0));
		}
		mv.setViewName("pc/footer");
		return mv;
	}
	
	//去首页面
	@RequestMapping(value="/goIndex.action")
	public ModelAndView goLogin(HttpServletRequest request,ModelAndView mv, Work work, QueryVo vo){
		//判断滚动条
		String isScroll = "f";
		//获取兼职
		Page<Work> page=new Page<Work>();
		if(work.getWorkCategory() != null && !work.getWorkCategory().equals("")){
			isScroll = "t";
//			try {
//				work.setWorkCategory(new String(work.getWorkCategory().getBytes("ISO8859-1"),"UTF-8"));
//			} catch (UnsupportedEncodingException e) {
//				e.printStackTrace();
//			}
		}
		System.out.println(work.getWorkCategory());
		work.setIsEffect(1);
		work.setIsAuditing(1);
		if(vo.getSize()!=8){ 
			vo.setSize(8);
		}
		if(vo.getPage()==null){
			vo.setPage(1);
		}
		//每页数
		page.setSize(vo.getSize());
		if (vo != null){
			//判断当前页
			if(vo.getPage() != null) {
				page.setPage(vo.getPage());
				vo.setStartRow((vo.getPage() -1)*vo.getSize());
			}
			page.setTotal(workService.getWorkListCount(work));
			page.setRows(workService.getWorkList(work, (vo.getPage()-1) * vo.getSize(), vo.getSize()));
		}
		mv.addObject("page", page);
		//系统配置
		SystemUpset systemUpset = new SystemUpset();
		List<SystemUpset> systemUpsets = systemUpsetService.getSystemUpsetList(systemUpset, null, null);
		if(systemUpsets.size() > 0){
			mv.addObject("systemUpset", systemUpsets.get(0));
		}
		//轮播图
		Banner banner = new Banner();
		banner.setIsEffect(1);
		List<Banner> banners = bannerService.getBannerList(banner, null, null);
		mv.addObject("banners", banners);
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		mv.addObject("pcUser", pcUser);
		if(vo.getPage() != 1){
			isScroll = "t";
		}
		mv.addObject("isScroll", isScroll);
		mv.setViewName("pc/index");
		return mv;
	}
	
	//首页获取分类兼职
	@RequestMapping("/getWorkByWorkCate")
	public void getWorkByWorkCate(HttpServletResponse response,Work work){
		work.setIsEffect(1);
		work.setIsAuditing(1);
		Integer count = workService.getWorkListCount(work);
		List<Work> works = workService.getWorkList(work, 0, 8);
		SimpleDateFormat cTime = new SimpleDateFormat("yyyy-MM-dd");
		if(works.size() > 0){
			for(int i = 0; i<works.size(); i++){
				works.get(i).setCreateTimes(cTime.format(works.get(i).getCreateTime()));
			}
		}
		output(response,JsonUtil.buildJsonByTotalCount(works, count));
	}
	
	//查看兼职
	@RequestMapping(value="/goFindWork.action")
	public ModelAndView goFindWork(ModelAndView mv,Work work){
		SystemUpset systemUpset = new SystemUpset();
		List<SystemUpset> systemUpsets = systemUpsetService.getSystemUpsetList(systemUpset, null, null);
		if(systemUpsets.size() > 0){
			mv.addObject("systemUpset", systemUpsets.get(0));
		}
		work = workService.getWorkById(work.getId());
		mv.addObject("work", work);
		mv.setViewName("pc/find_work");
		return mv;
	}
	
	//查看用户资料
	@RequestMapping(value="/goFindUser.action")
	public ModelAndView goFindUser(HttpServletRequest request,ModelAndView mv,SystemUpset systemUpset,User user){
		List<SystemUpset> systemUpsets = systemUpsetService.getSystemUpsetList(systemUpset, null, null);
		if(systemUpsets.size() > 0){
			mv.addObject("systemUpset", systemUpsets.get(0));
		}
		user = userService.getUserById(user.getUserId());
		mv.addObject("user", user);
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		mv.addObject("pcUser", pcUser);
		mv.setViewName("pc/user_info");
		return mv;
	}
	
	//去聊天页面
	@RequestMapping(value="/goChat.action")
	public ModelAndView goChat(HttpServletRequest request,ModelAndView mv,SystemUpset systemUpset,User user){
		List<SystemUpset> systemUpsets = systemUpsetService.getSystemUpsetList(systemUpset, null, null);
		if(systemUpsets.size() > 0){
			mv.addObject("systemUpset", systemUpsets.get(0));
		}
		user = userService.getUserById(user.getUserId());
		int userId = user.getUserId();
		mv.addObject("user", user);
		//Session信息
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		mv.addObject("pcUser", pcUser);
		if(pcUser == null){
			mv.setViewName("pc/login");
		}else if(pcUser.getUserId() == userId){
			mv.addObject("updatePage", "y");
			mv.setViewName("pc/index");
		}else{
			//更新isLook
			Chat chat = new Chat();
			chat.setUserIdFa(user.getUserId());
			chat.setUserIdJie(pcUser.getUserId());
			chat.setIsLook(1);
			chatService.updateChat(chat);
			mv.setViewName("pc/chat");
		}
		return mv;
	}
	
	//去论坛页面
	@RequestMapping(value="/goForum.action")
	public ModelAndView goForum(HttpServletRequest request,ModelAndView mv, QueryVo vo){
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		mv.addObject("pcUser", pcUser);
		//获取广告
		Adver adver = new Adver();
		List<Adver> advers = adverService.getAdverList(adver, null, null);
		mv.addObject("advers", advers);
		//获取帖子
		Page<Forum> page=new Page<Forum>();
		Forum forum = new Forum();
		forum.setIsEffect(1);
		if(vo.getSize()!=10){ 
			vo.setSize(10);
		}
		if(vo.getPage()==null){
			vo.setPage(1);
		}
		//每页数
		page.setSize(vo.getSize());
		if (vo != null){
			//判断当前页
			if(vo.getPage() != null) {
				page.setPage(vo.getPage());
				vo.setStartRow((vo.getPage() -1)*vo.getSize());
			}
			page.setTotal(forumService.getForumListCount(forum));
			page.setRows(forumService.getForumList(forum, (vo.getPage()-1) * vo.getSize(), vo.getSize()));
		}
		//获取评论
		ForumReply forumReply = new ForumReply();
		for(int i=0; i<page.getRows().size(); i++){
			forumReply.setForumId(page.getRows().get(i).getForumId());
			page.getRows().get(i).setForumReplys(forumReplyService.getForumReplyList(forumReply, null, null));
		}
		mv.addObject("page", page);
		mv.setViewName("pc/forum");
		return mv;
	}
	
	//去信箱页面
	@RequestMapping(value="/goMailbox.action")
	public ModelAndView goMailbox(HttpServletRequest request,ModelAndView mv,SystemUpset systemUpset){
		List<SystemUpset> systemUpsets = systemUpsetService.getSystemUpsetList(systemUpset, null, null);
		if(systemUpsets.size() > 0){
			mv.addObject("systemUpset", systemUpsets.get(0));
		}
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		mv.addObject("pcUser", pcUser);
		if(pcUser == null){
			mv.setViewName("pc/login");
		}else{
			mv.setViewName("pc/mailbox");
		}
		return mv;
	}
	
	//去发布兼职
	@RequestMapping(value="/goPublishWork.action")
	public ModelAndView goPublishWork(HttpServletRequest request,ModelAndView mv,SystemUpset systemUpset){
		List<SystemUpset> systemUpsets = systemUpsetService.getSystemUpsetList(systemUpset, null, null);
		if(systemUpsets.size() > 0){
			mv.addObject("systemUpset", systemUpsets.get(0));
		}
		User pcUser = (User) request.getSession().getAttribute("pcUser");
		mv.addObject("pcUser", pcUser);
		if(pcUser == null){
			mv.setViewName("pc/login");
		}else{
			mv.setViewName("pc/publish_work");
		}
		return mv;
	}
	
	//去公告页面
	@RequestMapping(value="/goNotice.action")
	public ModelAndView goNotice(HttpServletRequest request, ModelAndView mv, QueryVo vo){
		//获取个公告
		Page<Notice> page=new Page<Notice>();
		Notice notice = new Notice();
		if(vo.getSize()!=12){ 
			vo.setSize(12);
		}
		if(vo.getPage()==null){
			vo.setPage(1);
		}
		//每页数
		page.setSize(vo.getSize());
		if (vo != null){
			//判断当前页
			if(vo.getPage() != null) {
				page.setPage(vo.getPage());
				vo.setStartRow((vo.getPage() -1)*vo.getSize());
			}
			page.setTotal(noticeService.getNoticeListCount(notice));
			page.setRows(noticeService.getNoticeList(notice, (vo.getPage()-1) * vo.getSize(), vo.getSize()));
		}
		mv.addObject("page", page);
		mv.setViewName("pc/notice");
		return mv;
	}
	
	//获取公告
	@RequestMapping(value="/getNotice.action")
	public void getNotice(Notice notice,HttpServletRequest request,HttpServletResponse response){
		notice = noticeService.getNoticeById(notice.getId());
		SimpleDateFormat cTime = new SimpleDateFormat("yyyy-MM-dd");
		notice.setCreateTimes(cTime.format(notice.getCreateTime()));
		output(response,JsonUtil.objectToJson(notice));
	}
}
