package com.work.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.work.mapper.BannerMapper;
import com.work.pojo.Banner;
import com.work.service.BannerService;

@Service
public class BannerServiceImpl implements BannerService{

	@Autowired
	private BannerMapper bannerMapper;

	@Override
	public List<Banner> getBannerList(Banner banner, Integer page, Integer limit) {
		return bannerMapper.getBannerList(banner, page, limit);
	}

	@Override
	public Integer getBannerListCount(Banner banner) {
		return bannerMapper.getBannerListCount(banner);
	}

	@Override
	public void addBanner(Banner banner) {
		bannerMapper.addBanner(banner);
	}

	@Override
	public void updateBanner(Banner banner) {
		bannerMapper.updateBanner(banner);
	}

	@Override
	public Banner getBannerById(Integer id) {
		return bannerMapper.getBannerById(id);
	}

	
		
}
