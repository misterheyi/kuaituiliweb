package com.yzq.katl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yzq.katl.model.Riddle;
import com.yzq.katl.util.PageUtil;

public interface RiddleMapper {
	
	public abstract List<Riddle> selectRiddleList(@Param("page")PageUtil page);

	public abstract Integer selectRiddleListTotalCount();
	
	public abstract List<Riddle> selectNewRiddleList();
	
	public abstract List<Riddle> selectTopClickRiddleList();

	public abstract void updateRiddleClickTimes(Integer id);
}