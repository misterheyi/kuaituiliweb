package com.yzq.katl.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yzq.katl.dao.BaikeMapper;
import com.yzq.katl.dao.MysteryMapper;
import com.yzq.katl.dto.BaikeDTO;
import com.yzq.katl.service.BaikeService;
import com.yzq.katl.util.CommonSetting;
import com.yzq.katl.util.PageUtil;
import com.yzq.katl.util.PageView;

@Service("baikeService")
public class BaikeServiceImpl implements BaikeService {

	@Autowired
	private BaikeMapper baikeMapper;
	@Autowired
	private MysteryMapper mysteryMapper;

	public Map<String, Object> selectBaikeList(Integer page) {
		Map<String, Object> obj = new HashMap<String, Object>();
		
		Integer total = this.baikeMapper.selectBaikeListTotalCount();
		PageUtil pageUtil = new PageUtil(10, total, page);
		List<BaikeDTO> baikeList = baikeMapper.selectBaikeList(pageUtil);
		String pageText = PageView.getPage(pageUtil.getCurrentPage(), pageUtil.getPageSize(), pageUtil.getRecordCount(), CommonSetting.WEB_ROOT+"/baike/",null);
		obj.put("pageUtil", pageUtil);
		obj.put("baikeList", baikeList);
		obj.put("pageText", pageText);
		obj.put("baikeTopList", this.baikeMapper.selectTopClickBaikeList());
		obj.put("randomMysteryList", this.mysteryMapper.selectRandomMysteryList());
		obj.put("cType", "BAIKE");
		return obj;
	}

	@Override
	public List<BaikeDTO> selectNewBaikeList() {
		return this.baikeMapper.selectNewBaikeList();
	}

	@Override
	public Map<String, Object> selectBaikeDetail(Integer id) {
		Map<String, Object> obj = new HashMap<String, Object>();
		obj.put("baike", this.baikeMapper.selectBaikeById(id));
		obj.put("next", this.baikeMapper.selectNextBaikeById(id));
		obj.put("pre", this.baikeMapper.selectPreBaikeById(id));
		obj.put("baikeTopList", this.baikeMapper.selectTopClickBaikeList());
		obj.put("baikeRandomList", this.baikeMapper.selectRandomBaikeList());
		obj.put("cType", "BAIKE");
		this.baikeMapper.updateBaikeClickTimes(id);
		return obj;
	}

}
