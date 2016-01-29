package com.yzq.katl.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yzq.katl.dao.EssayMapper;
import com.yzq.katl.dao.MysteryMapper;
import com.yzq.katl.dto.EssayDTO;
import com.yzq.katl.service.EssayService;
import com.yzq.katl.util.CommonSetting;
import com.yzq.katl.util.PageUtil;
import com.yzq.katl.util.PageView;

@Service("essayService")
public class EssayServiceImpl implements EssayService {

	@Autowired
	private EssayMapper essayMapper;
	@Autowired
	private MysteryMapper mysteryMapper;

	public Map<String, Object> selectEssayList(Integer type, Integer page) {
		Map<String, Object> obj = new HashMap<String, Object>();
		Integer total = this.essayMapper.selectEssayListTotalCount(type);
		PageUtil pageUtil = new PageUtil(10, total, page); 
		List<EssayDTO> essayList = essayMapper.selectEssayList(type,pageUtil);
		String pageText = PageView.getPage(pageUtil.getCurrentPage(), pageUtil.getPageSize(), pageUtil.getRecordCount(),  CommonSetting.WEB_ROOT+"/essay/"+type+"/",null);
		obj.put("pageUtil", pageUtil);
		obj.put("essayList", essayList);
		obj.put("pageText", pageText);
		obj.put("type", type);
		obj.put("essayTopList", this.essayMapper.selectTopClickEssayList());
		obj.put("randomMysteryList", this.mysteryMapper.selectRandomMysteryList());
		obj.put("cType", "ESSAY");
		return obj;
	}

	@Override
	public List<EssayDTO> selectNewEssayList() {
		return this.essayMapper.selectNewEssayList();
	}

	@Override
	public Map<String, Object> selectEssayDetail(Integer id) {
		Map<String, Object> obj = new HashMap<String, Object>();
		obj.put("essay", this.essayMapper.selectEssayById(id));
		obj.put("next", this.essayMapper.selectNextEssayById(id));
		obj.put("pre", this.essayMapper.selectPreEssayById(id));
		obj.put("essayTopList", this.essayMapper.selectTopClickEssayList());
		obj.put("randomEssayList", this.essayMapper.selectRandomEssayList());
		obj.put("cType", "ESSAY");
		this.essayMapper.updateEssayClickTimes(id);
		return obj;
	}

}
