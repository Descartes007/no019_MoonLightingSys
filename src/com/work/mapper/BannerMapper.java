package com.work.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.work.pojo.Banner;

public interface BannerMapper {
	
	public List<Banner> getBannerList(@Param("banner")Banner banner, @Param("page")Integer page, @Param("limit")Integer limit);
	public Integer getBannerListCount(@Param("banner")Banner banner);
	public void addBanner(@Param("banner")Banner banner);
	public void updateBanner(@Param("banner")Banner banner);
	public Banner getBannerById(@Param("id")Integer id);

}
