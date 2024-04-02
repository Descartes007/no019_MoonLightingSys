package com.work.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.work.mapper.NoticeMapper;
import com.work.pojo.Notice;
import com.work.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeMapper noticeMapper;

	@Override
	public List<Notice> getNoticeList(Notice notice, Integer page, Integer limit) {
		return noticeMapper.getNoticeList(notice, page, limit);
	}

	@Override
	public Integer getNoticeListCount(Notice notice) {
		return noticeMapper.getNoticeListCount(notice);
	}

	@Override
	public void addNotice(Notice notice) {
		noticeMapper.addNotice(notice);
	}

	@Override
	public void updateNotice(Notice notice) {
		noticeMapper.updateNotice(notice);
	}

	@Override
	public Notice getNoticeById(Integer id) {
		return noticeMapper.getNoticeById(id);
	}

	@Override
	public void deleteNoticeById(int id) {
		noticeMapper.deleteNoticeById(id);
	}
	

}
