package com.work.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.work.mapper.MailboxMapper;
import com.work.pojo.Mailbox;
import com.work.service.MailboxService;

@Service
public class MailboxServiceImpl implements MailboxService {

	@Autowired
	private MailboxMapper mailboxMapper;

	@Override
	public List<Mailbox> getMailboxList(Mailbox mailbox, Integer page,
			Integer limit) {
		return mailboxMapper.getMailboxList(mailbox, page, limit);
	}

	@Override
	public Integer getMailboxListCount(Mailbox mailbox) {
		return mailboxMapper.getMailboxListCount(mailbox);
	}

	@Override
	public void addMailbox(Mailbox mailbox) {
		mailboxMapper.addMailbox(mailbox);
	}

	@Override
	public void updateMailbox(Mailbox mailbox) {
		mailboxMapper.updateMailbox(mailbox);
	}

	@Override
	public Mailbox getMailboxById(Integer id) {
		return mailboxMapper.getMailboxById(id);
	}

	@Override
	public void deleteMailboxById(int id) {
		mailboxMapper.deleteMailboxById(id);
	}


}
