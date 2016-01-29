package com.yzq.katl.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yzq.katl.dao.InfoMapper;
import com.yzq.katl.dao.MysteryMapper;
import com.yzq.katl.dto.InfoDTO;
import com.yzq.katl.service.InfoService;
import com.yzq.katl.util.CommonSetting;
import com.yzq.katl.util.PageUtil;
import com.yzq.katl.util.PageView;

@Service("infoService")
public class InfoServiceImpl implements InfoService {

	@Autowired
	private InfoMapper infoMapper;
	@Autowired
	private MysteryMapper mysterMapper;

	public Map<String, Object> selectInfoList(Integer page) {
		Map<String, Object> obj = new HashMap<String, Object>();
		Integer total = this.infoMapper.selectInfoListTotalCount();
		PageUtil pageUtil = new PageUtil(10, total, page); 
		List<InfoDTO> infoList = infoMapper.selectInfoList(pageUtil);
		String pageText = PageView.getPage(pageUtil.getCurrentPage(), pageUtil.getPageSize(), pageUtil.getRecordCount(), CommonSetting.WEB_ROOT+"/info/",null);
		obj.put("pageUtil", pageUtil);
		obj.put("infoList", infoList);
		obj.put("pageText", pageText);
		obj.put("infoTopList", this.infoMapper.selectTopClickInfoList());
		obj.put("randomMysteryList", this.mysterMapper.selectRandomMysteryList());
		obj.put("cType", "INFO");
		return obj;
	}

	@Override
	public List<InfoDTO> selectNewInfoList() {
		return this.infoMapper.selectNewInfoList();
	}

	@Override
	public Map<String, Object> selectInfoDetail(Integer id) {
		Map<String, Object> obj = new HashMap<String, Object>();
		obj.put("info", this.infoMapper.selectInfoById(id));
		obj.put("next", this.infoMapper.selectNextInfoById(id));
		obj.put("pre", this.infoMapper.selectPreInfoById(id));
		obj.put("infoTopList", this.infoMapper.selectTopClickInfoList());
		obj.put("infoRandomList", this.infoMapper.selectRandomInfoList());
		obj.put("cType", "INFO");
		this.infoMapper.updateInfoClickTimes(id);
		return obj;
	}


}
