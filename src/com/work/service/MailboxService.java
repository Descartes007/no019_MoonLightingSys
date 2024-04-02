package com.work.service;

import java.util.List;
import com.work.pojo.Mailbox;

public interface MailboxService {
	
	public List<Mailbox> getMailboxList(Mailbox mailbox, Integer page, Integer limit);
	public Integer getMailboxListCount(Mailbox mailbox);
	public void addMailbox(Mailbox mailbox);
	public void updateMailbox(Mailbox mailbox);
	public Mailbox getMailboxById(Integer id);
	public void deleteMailboxById(int id);
	
}
