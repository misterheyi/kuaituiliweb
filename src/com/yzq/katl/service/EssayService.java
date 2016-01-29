package com.yzq.katl.service;

import java.util.List;
import java.util.Map;

import com.yzq.katl.dto.EssayDTO;

public interface EssayService {

	public abstract Map<String, Object> selectEssayList(Integer type,Integer page);
	
	public abstract Map<String, Object> selectEssayDetail(Integer id);
	
	public abstract List<EssayDTO> selectNewEssayList();
}
