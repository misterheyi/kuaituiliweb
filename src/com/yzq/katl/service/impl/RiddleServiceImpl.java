package com.yzq.katl.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yzq.katl.dao.RiddleMapper;
import com.yzq.katl.model.Riddle;
import com.yzq.katl.service.RiddleService;
import com.yzq.katl.util.CommonSetting;
import com.yzq.katl.util.PageUtil;
import com.yzq.katl.util.PageView;

@Service("riddleService")
public class RiddleServiceImpl implements RiddleService {

	@Autowired
	private RiddleMapper riddleMapper;

	public Map<String, Object> selectRiddleList(Integer page) {
		Map<String, Object> obj = new HashMap<String, Object>();
		Integer total = this.riddleMapper.selectRiddleListTotalCount();
		PageUtil pageUtil = new PageUtil(10, total, page); 
		List<Riddle> riddleList = riddleMapper.selectRiddleList(pageUtil);
		String pageText = PageView.getPage(pageUtil.getCurrentPage(), pageUtil.getPageSize(), pageUtil.getRecordCount(), CommonSetting.WEB_ROOT+"/riddle/",null);
		obj.put("pageUtil", pageUtil);
		obj.put("riddleList", riddleList);
		obj.put("pageText", pageText);
		obj.put("riddleTopList", this.riddleMapper.selectTopClickRiddleList());
		obj.put("cType", "RIDDLE");
		return obj;
	}

	@Override
	public List<Riddle> selectNewRiddleList() {
		return riddleMapper.selectNewRiddleList();
	}

	@Override
	public String updateRiddleClickTimes(Integer id) {
		try{
			this.riddleMapper.updateRiddleClickTimes(id);
			return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "failure";
		}
	}

}
