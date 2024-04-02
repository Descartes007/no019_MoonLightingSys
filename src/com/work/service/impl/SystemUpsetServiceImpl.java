package com.work.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.work.mapper.SystemUpsetMapper;
import com.work.pojo.SystemUpset;
import com.work.service.SystemUpsetService;

@Service
public class SystemUpsetServiceImpl implements SystemUpsetService{

	@Autowired
	private SystemUpsetMapper systemUpsetMapper;

	@Override
	public List<SystemUpset> getSystemUpsetList(SystemUpset systemUpset,
			Integer page, Integer limit) {
		return systemUpsetMapper.getSystemUpsetList(systemUpset, page, limit);
	}

	@Override
	public Integer getSystemUpsetListCount(SystemUpset systemUpset) {
		return systemUpsetMapper.getSystemUpsetListCount(systemUpset);
	}

	@Override
	public void addSystemUpset(SystemUpset systemUpset) {
		systemUpsetMapper.addSystemUpset(systemUpset);
	}

	@Override
	public void updateSystemUpset(SystemUpset systemUpset) {
		systemUpsetMapper.updateSystemUpset(systemUpset);
	}

	
	

}
