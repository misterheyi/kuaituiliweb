package com.yzq.katl.service;

import java.util.Map;

public interface FamousService {

	public abstract Map<String, Object> selectFamousList(Integer type,String page);
	
	public abstract Map<String, Object> selectFamousDetail(Integer id);
	
}
