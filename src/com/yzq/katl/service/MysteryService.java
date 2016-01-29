package com.yzq.katl.service;

import java.util.List;
import java.util.Map;

import com.yzq.katl.dto.MysteryDTO;

public interface MysteryService {

	public abstract Map<String, Object> selectMysteryList(Integer page);
	
	public abstract List<MysteryDTO> selectNewMysteryList();

	public abstract Map<String, Object> selectMysteryDetail(Integer id);
}
