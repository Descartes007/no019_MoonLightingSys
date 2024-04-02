package com.work.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.work.pojo.Adver;

public interface AdverMapper {
	
	public List<Adver> getAdverList(@Param("adver")Adver adver, @Param("page")Integer page, @Param("limit")Integer limit);
	public Integer getAdverListCount(@Param("adver")Adver adver);
	public void addAdver(@Param("adver")Adver adver);
	public void updateAdver(@Param("adver")Adver adver);
	public Adver getAdverById(@Param("id")Integer id);
	public void deleteAdverById(@Param("id")int id);
}
