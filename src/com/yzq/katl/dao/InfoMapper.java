package com.yzq.katl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yzq.katl.dto.InfoDTO;
import com.yzq.katl.util.PageUtil;

public interface InfoMapper {
	
	public abstract List<InfoDTO> selectInfoList(@Param("page")PageUtil page);

	public abstract InfoDTO selectNextInfoById(@Param("id")Integer id);
	
	public abstract InfoDTO selectPreInfoById(@Param("id")Integer id);
	
	public abstract InfoDTO selectInfoById(@Param("id")Integer id);
	
	public abstract Integer selectInfoListTotalCount();
	
	public abstract List<InfoDTO> selectNewInfoList();
	
	public abstract List<InfoDTO> selectTopClickInfoList();
	
	public abstract List<InfoDTO> selectRandomInfoList();
	
	public abstract void updateInfoClickTimes(Integer id);
	
}