package com.work.service;

import java.util.List;
import com.work.pojo.Adver;

public interface AdverService {
	
	public List<Adver> getAdverList(Adver adver, Integer page, Integer limit);
	public Integer getAdverListCount(Adver adver);
	public void addAdver(Adver adver);
	public void updateAdver(Adver adver);
	public Adver getAdverById(Integer id);
	public void deleteAdverById(int id);
	
	
	
}
