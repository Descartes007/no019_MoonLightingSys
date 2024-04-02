package com.work.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.work.pojo.Notice;


public interface NoticeMapper {
	
	public List<Notice> getNoticeList(@Param("notice")Notice notice, @Param("page")Integer page, @Param("limit")Integer limit);
	public Integer getNoticeListCount(@Param("notice")Notice notice);
	public void addNotice(@Param("notice")Notice notice);
	public void updateNotice(@Param("notice")Notice notice);
	public Notice getNoticeById(@Param("id")Integer id);
	public void deleteNoticeById(@Param("id")int id);
	
}
