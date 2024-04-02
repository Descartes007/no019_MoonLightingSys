package com.work.service;

import java.util.List;
import com.work.pojo.Banner;

public interface BannerService {
	
	public List<Banner> getBannerList(Banner banner, Integer page, Integer limit);
	public Integer getBannerListCount(Banner banner);
	public void addBanner(Banner banner);
	public void updateBanner(Banner banner);
	public Banner getBannerById(Integer id);
	
	
}
