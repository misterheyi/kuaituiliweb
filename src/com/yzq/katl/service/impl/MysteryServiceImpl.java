package com.yzq.katl.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yzq.katl.dao.ContentMapper;
import com.yzq.katl.dao.MysteryMapper;
import com.yzq.katl.dto.MysteryDTO;
import com.yzq.katl.service.MysteryService;
import com.yzq.katl.util.CommonSetting;
import com.yzq.katl.util.PageUtil;
import com.yzq.katl.util.PageView;

@Service("mysteryService")
public class MysteryServiceImpl implements MysteryService {

	@Autowired
	private MysteryMapper mysteryMapper;
	@Autowired
	private ContentMapper contentMapper;

	public Map<String, Object> selectMysteryList(Integer page) {
		Map<String, Object> obj = new HashMap<String, Object>();
		Integer total = this.mysteryMapper.selectMysteryListTotalCount();
		PageUtil pageUtil = new PageUtil(10, total, page); 
		List<MysteryDTO> mysteryList = mysteryMapper.selectMysteryList(pageUtil);
		String pageText = PageView.getPage(pageUtil.getCurrentPage(), pageUtil.getPageSize(), pageUtil.getRecordCount(), CommonSetting.WEB_ROOT+"/mystery/",null);
		obj.put("mysteryList", mysteryList);
		obj.put("pageText", pageText);
		obj.put("mysteryTopList", this.mysteryMapper.selectTopClickMysteryList());
		obj.put("cType", "MYSTERY");
		return obj;
	}

	@Override
	public List<MysteryDTO> selectNewMysteryList() {
		return this.mysteryMapper.selectNewMysteryList();
	}

	@Override
	public Map<String, Object> selectMysteryDetail(Integer id) {
		Map<String, Object> obj = new HashMap<String, Object>();
		obj.put("mystery", this.mysteryMapper.selectMysteryById(id));
		obj.put("next", this.mysteryMapper.selectNextMysteryById(id));
		obj.put("pre", this.mysteryMapper.selectPreMysteryById(id));
		obj.put("mysteryTopList", this.mysteryMapper.selectTopClickMysteryList());
		obj.put("mysteryRandomList", this.mysteryMapper.selectRandomMysteryList());
		obj.put("cType", "MYSTERY");
		this.mysteryMapper.updateMysteryClickTimes(id);
		return obj;
	}
	
}
