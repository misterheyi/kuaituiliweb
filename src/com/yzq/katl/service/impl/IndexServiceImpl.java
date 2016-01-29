package com.yzq.katl.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yzq.katl.dao.BaikeMapper;
import com.yzq.katl.dao.EssayMapper;
import com.yzq.katl.dao.FamousMapper;
import com.yzq.katl.dao.InfoMapper;
import com.yzq.katl.dao.LinkMapper;
import com.yzq.katl.dao.MysteryMapper;
import com.yzq.katl.dao.RiddleMapper;
import com.yzq.katl.dto.BaikeDTO;
import com.yzq.katl.dto.EssayDTO;
import com.yzq.katl.dto.FamousDTO;
import com.yzq.katl.dto.InfoDTO;
import com.yzq.katl.dto.MysteryDTO;
import com.yzq.katl.model.Link;
import com.yzq.katl.model.Riddle;
import com.yzq.katl.service.IndexService;

@Service("indexService")
public class IndexServiceImpl implements IndexService{

	@Autowired
	private MysteryMapper mysterMapper;
	@Autowired
	private BaikeMapper baikeMapper;
	@Autowired
	private InfoMapper infoMapper;
	@Autowired
	private FamousMapper famousMapper;
	@Autowired
	private EssayMapper essayMapper;
	@Autowired
	private RiddleMapper riddleMapper;
	@Autowired
	private LinkMapper linkMapper;
	
	@Override
	public Map<String, Object> initIndexData() {
		Map<String,Object> obj = new HashMap<String,Object>();
		//查询新的九条未解之谜
		List<MysteryDTO> mysteryList = this.mysterMapper.selectNewMysteryList();
		obj.put("mysteryList", mysteryList);
		
		//查询最新百科咨询
		List<BaikeDTO> baikeList = this.baikeMapper.selectNewBaikeList();
		obj.put("baikeList", baikeList);
		
		//查询最新咨询中心
		List<InfoDTO> infoList = this.infoMapper.selectNewInfoList();
		obj.put("infoList", infoList);
		
		//查询最新名人
		List<FamousDTO> famousList = this.famousMapper.selectNewFamousList();
		obj.put("famous", famousList.get(0));
		
		//推理名家
		obj.put("famousList", famousList);
		
		//查询最新短文
		List<EssayDTO> essayList = this.essayMapper.selectNewEssayList();
		obj.put("essayList", essayList);
		
		//查询最新密语
		List<Riddle> riddleList = this.riddleMapper.selectNewRiddleList();
		obj.put("riddleList", riddleList);
		
		List<Link> linkList = this.linkMapper.selectShowLinkList(); 
		obj.put("linkList", linkList);
		obj.put("cType", "INDEX");
		return obj;
	}

}
