package com.work.service;

import java.util.List;
import com.work.pojo.Work;

public interface WorkService {
	
	public List<Work> getWorkList(Work work, Integer page, Integer limit);
	public Integer getWorkListCount(Work work);
	public void addWork(Work work);
	public void updateWork(Work work);
	public Work getWorkById(Integer id);
	
}
