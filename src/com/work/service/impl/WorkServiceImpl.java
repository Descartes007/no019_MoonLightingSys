package com.work.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.work.mapper.WorkMapper;
import com.work.pojo.Work;
import com.work.service.WorkService;

@Service
public class WorkServiceImpl implements WorkService {

	@Autowired
	private WorkMapper workMapper;

	@Override
	public List<Work> getWorkList(Work work, Integer page, Integer limit) {
		return workMapper.getWorkList(work, page, limit);
	}

	@Override
	public Integer getWorkListCount(Work work) {
		return workMapper.getWorkListCount(work);
	}

	@Override
	public void addWork(Work work) {
		workMapper.addWork(work);
	}

	@Override
	public void updateWork(Work work) {
		workMapper.updateWork(work);
	}

	@Override
	public Work getWorkById(Integer id) {
		return workMapper.getWorkById(id);
	}
	
	
	
	
}
