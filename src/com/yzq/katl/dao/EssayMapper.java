package com.yzq.katl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yzq.katl.dto.EssayDTO;
import com.yzq.katl.util.PageUtil;

public interface EssayMapper {
	
	public abstract List<EssayDTO> selectEssayList(@Param("type")Integer type , @Param("page")PageUtil page);

	public abstract Integer selectEssayListTotalCount(@Param("type")Integer type);
	
	public abstract EssayDTO selectNextEssayById(@Param("id")Integer id);
	
	public abstract EssayDTO selectPreEssayById(@Param("id")Integer id);
	
	public abstract EssayDTO selectEssayById(@Param("id")Integer id);
	
	public abstract List<EssayDTO> selectNewEssayList();
	
	public abstract List<EssayDTO> selectTopClickEssayList();
	
	public abstract List<EssayDTO> selectRandomEssayList();
	
	public abstract void updateEssayClickTimes(Integer id);
}