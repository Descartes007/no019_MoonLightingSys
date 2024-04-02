package com.work.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.work.pojo.Work;

public interface WorkMapper {
	
	public List<Work> getWorkList(@Param("work")Work work, @Param("page")Integer page, @Param("limit")Integer limit);
	public Integer getWorkListCount(@Param("work")Work work);
	public void addWork(@Param("work")Work work);
	public void updateWork(@Param("work")Work work);
	public Work getWorkById(@Param("id")Integer id);
	
	
}
