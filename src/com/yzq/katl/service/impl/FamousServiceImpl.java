package com.yzq.katl.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yzq.katl.dao.ContentMapper;
import com.yzq.katl.dao.FamousMapper;
import com.yzq.katl.dto.FamousDTO;
import com.yzq.katl.service.FamousService;
import com.yzq.katl.util.CommonSetting;
import com.yzq.katl.util.PageUtil;
import com.yzq.katl.util.PageView;

@Service("famousService")
public class FamousServiceImpl implements FamousService {

	@Autowired
	private FamousMapper famousMapper;
	@Autowired
	private ContentMapper contentMapper;

	public Map<String, Object> selectFamousList(Integer page,String title) {
		Map<String, Object> obj = new HashMap<String, Object>();
		Integer total = this.famousMapper.selectFamousListTotalCount(title);
		PageUtil pageUtil = new PageUtil(16, total, page); 
		List<FamousDTO> essayList = famousMapper.selectFamousList(title,pageUtil);
		String pageText;
		if(title != null){
			pageText = PageView.getPage(pageUtil.getCurrentPage(), pageUtil.getPageSize(), pageUtil.getRecordCount(), CommonSetting.WEB_ROOT+"/famous/","title="+title);
		}else{
			pageText = PageView.getPage(pageUtil.getCurrentPage(), pageUtil.getPageSize(), pageUtil.getRecordCount(), CommonSetting.WEB_ROOT+"/famous/",null);
		}
		obj.put("pageUtil", pageUtil);
		obj.put("famousList", essayList);
		obj.put("pageText", pageText);
		obj.put("title", title);
		obj.put("famousTopList", this.famousMapper.selectTopClickFamousList());
		obj.put("cType", "FAMOUS");
		obj.put("searchTitle", title);
		return obj;
	}

	@Override
	public Map<String, Object> selectFamousDetail(Integer id) {
		Map<String, Object> obj = new HashMap<String, Object>();
		obj.put("famous", this.famousMapper.selectFamousById(id));
		obj.put("famousTopList", this.famousMapper.selectTopClickFamousList());
		obj.put("famousRandomList", this.famousMapper.selectRandomFamousList());
		obj.put("cType", "FAMOUS");
		this.famousMapper.updateFamousClickTimes(id);
		return obj;
	}

}
