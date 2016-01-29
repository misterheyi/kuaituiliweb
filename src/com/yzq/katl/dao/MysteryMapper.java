package com.yzq.katl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yzq.katl.dto.MysteryDTO;
import com.yzq.katl.util.PageUtil;

public interface MysteryMapper {
	
	public abstract List<MysteryDTO> selectMysteryList(@Param("page")PageUtil page);

	public abstract Integer selectMysteryListTotalCount();
	
	public abstract List<MysteryDTO> selectNewMysteryList();
	
	public abstract List<MysteryDTO> selectTopClickMysteryList();
	
	public abstract List<MysteryDTO> selectRandomMysteryList();
	
	public abstract MysteryDTO selectMysteryById(Integer id);
	
	public abstract MysteryDTO selectNextMysteryById(Integer id);
	
	public abstract MysteryDTO selectPreMysteryById(Integer id);
	
	public abstract void updateMysteryClickTimes(Integer id);
}