package com.work.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.work.pojo.Collect;

public interface CollectMapper {
	public List<Collect> getCollectList(@Param("collect")Collect collect, @Param("page")Integer page, @Param("limit")Integer limit);
	public Integer getCollectListCount(@Param("collect")Collect collect);
	public void addCollect(@Param("collect")Collect collect);
	public Collect getCollectById(@Param("id")Integer id);
	public void deleteCollectById(@Param("id")int id);
	public void deleteMyCollect(@Param("collect")Collect collect);
	
	
}
