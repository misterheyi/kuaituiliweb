package com.yzq.katl.service;

import java.util.List;
import java.util.Map;

import com.yzq.katl.dto.BaikeDTO;

public interface BaikeService {

	public abstract Map<String, Object> selectBaikeList(Integer page);
	
	public abstract List<BaikeDTO> selectNewBaikeList();
	
	public abstract Map<String, Object> selectBaikeDetail(Integer id);
}
