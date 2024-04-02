package com.work.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.work.pojo.Mailbox;

public interface MailboxMapper {
	public List<Mailbox> getMailboxList(@Param("mailbox")Mailbox mailbox, @Param("page")Integer page, @Param("limit")Integer limit);
	public Integer getMailboxListCount(@Param("mailbox")Mailbox mailbox);
	public void addMailbox(@Param("mailbox")Mailbox mailbox);
	public void updateMailbox(@Param("mailbox")Mailbox mailbox);
	public Mailbox getMailboxById(@Param("id")Integer id);
	public void deleteMailboxById(@Param("id")int id);
	
	
}
