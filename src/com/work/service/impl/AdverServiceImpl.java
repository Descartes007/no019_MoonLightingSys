package com.work.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.work.mapper.AdverMapper;
import com.work.pojo.Adver;
import com.work.service.AdverService;

@Service
public class AdverServiceImpl implements AdverService{

	@Autowired
	private AdverMapper adverMapper;

	@Override
	public List<Adver> getAdverList(Adver adver, Integer page, Integer limit) {
		return adverMapper.getAdverList(adver, page, limit);
	}

	@Override
	public Integer getAdverListCount(Adver adver) {
		return adverMapper.getAdverListCount(adver);
	}

	@Override
	public void addAdver(Adver adver) {
		adverMapper.addAdver(adver);
	}

	@Override
	public void updateAdver(Adver adver) {
		adverMapper.updateAdver(adver);
	}

	@Override
	public Adver getAdverById(Integer id) {
		return adverMapper.getAdverById(id);
	}

	@Override
	public void deleteAdverById(int id) {
		adverMapper.deleteAdverById(id);
	}
	
}
