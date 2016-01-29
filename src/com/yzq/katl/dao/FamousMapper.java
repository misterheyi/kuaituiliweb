package com.yzq.katl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yzq.katl.dto.FamousDTO;
import com.yzq.katl.util.PageUtil;

public interface FamousMapper {
	
	public abstract List<FamousDTO> selectFamousList(@Param("title")String title , @Param("page")PageUtil page);

	public abstract Integer selectFamousListTotalCount(@Param("title")String title);
	
	public abstract FamousDTO selectFamousById(@Param("id")Integer id);
	
	public abstract List<FamousDTO> selectNewFamousList();
	
	public abstract List<FamousDTO> selectTopClickFamousList();
	
	public abstract List<FamousDTO> selectRandomFamousList();
	
	public abstract void updateFamousClickTimes(Integer id);
	
}