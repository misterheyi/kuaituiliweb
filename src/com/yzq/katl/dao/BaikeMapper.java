package com.yzq.katl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yzq.katl.dto.BaikeDTO;
import com.yzq.katl.util.PageUtil;

public interface BaikeMapper {
	
	public abstract List<BaikeDTO> selectBaikeList(@Param("page")PageUtil page);

	public abstract BaikeDTO selectNextBaikeById(@Param("id")Integer id);
	
	public abstract BaikeDTO selectPreBaikeById(@Param("id")Integer id);
	
	public abstract BaikeDTO selectBaikeById(@Param("id")Integer id);
	
	public abstract Integer selectBaikeListTotalCount();
	
	public abstract List<BaikeDTO> selectNewBaikeList();
	
	public abstract List<BaikeDTO> selectTopClickBaikeList();
	
	public abstract List<BaikeDTO> selectRandomBaikeList();
	
	public abstract void updateBaikeClickTimes(Integer id);
}