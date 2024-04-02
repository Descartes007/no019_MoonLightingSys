package com.work.service;

import java.util.List;
import com.work.pojo.Notice;


public interface NoticeService {
	
	public List<Notice> getNoticeList(Notice notice, Integer page, Integer limit);
	public Integer getNoticeListCount(Notice notice);
	public void addNotice(Notice notice);
	public void updateNotice(Notice notice);
	public Notice getNoticeById(Integer id);
	public void deleteNoticeById(int id);
}
