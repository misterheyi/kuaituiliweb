package com.yzq.katl.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yzq.katl.service.BaikeService;


@Controller
public class BaiKeController {
	
	@Autowired
	private BaikeService baikeService;

	@RequestMapping(value="/baike",method={RequestMethod.GET})
	public ModelAndView essay(){
		ModelAndView view = new ModelAndView("baike");
		view.addAllObjects(baikeService.selectBaikeList(1));
		return view;
	}
	
	@RequestMapping(value={"/baike/{page}"},method={RequestMethod.GET})
	public ModelAndView essay(@PathVariable Integer page){
		ModelAndView view = new ModelAndView("baike");
		view.addAllObjects(baikeService.selectBaikeList(page));
		return view;
	}
	
	@RequestMapping(value={"/baike/detail/{id}"},method={RequestMethod.GET})
	public ModelAndView essayDetail(@PathVariable Integer id){
		ModelAndView view = new ModelAndView("baikedetail");
		view.addAllObjects(baikeService.selectBaikeDetail(id));
		return view;
	}
	
}
