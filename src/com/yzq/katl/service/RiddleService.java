package com.yzq.katl.service;

import java.util.List;
import java.util.Map;

import com.yzq.katl.model.Riddle;

public interface RiddleService {

	public abstract Map<String, Object> selectRiddleList(Integer page);
	
	public abstract List<Riddle> selectNewRiddleList();
	
	public abstract String updateRiddleClickTimes(Integer id);
}
