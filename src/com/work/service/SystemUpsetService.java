package com.work.service;

import java.util.List;
import com.work.pojo.SystemUpset;

public interface SystemUpsetService {
	
	public List<SystemUpset> getSystemUpsetList(SystemUpset systemUpset, Integer page, Integer limit);
	public Integer getSystemUpsetListCount(SystemUpset systemUpset);
	public void addSystemUpset(SystemUpset systemUpset);
	public void updateSystemUpset(SystemUpset systemUpset);
	
}
