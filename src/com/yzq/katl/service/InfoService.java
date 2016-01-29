package com.yzq.katl.service;

import java.util.List;
import java.util.Map;

import com.yzq.katl.dto.InfoDTO;

public interface InfoService {

	public abstract Map<String, Object> selectInfoList(Integer page);

	public abstract Map<String, Object> selectInfoDetail(Integer id);
	
	public abstract List<InfoDTO> selectNewInfoList();
	
}
