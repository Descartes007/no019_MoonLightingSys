package com.work.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.work.mapper.CollectMapper;
import com.work.pojo.Collect;
import com.work.service.CollectService;

@Service
public class CollectServiceImpl implements CollectService{

	@Autowired
	private CollectMapper collectMapper;

	@Override
	public List<Collect> getCollectList(Collect collect, Integer page,
			Integer limit) {
		return collectMapper.getCollectList(collect, page, limit);
	}

	@Override
	public Integer getCollectListCount(Collect collect) {
		return collectMapper.getCollectListCount(collect);
	}

	@Override
	public void addCollect(Collect collect) {
		collectMapper.addCollect(collect);
	}

	@Override
	public Collect getCollectById(Integer id) {
		return collectMapper.getCollectById(id);
	}

	@Override
	public void deleteCollectById(int id) {
		collectMapper.deleteCollectById(id);
	}

	@Override
	public void deleteMyCollect(Collect collect) {
		collectMapper.deleteMyCollect(collect);
	}
	
	
}
