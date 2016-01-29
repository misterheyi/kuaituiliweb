package com.yzq.katl.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yzq.katl.service.InfoService;


@Controller
public class InfoController {
	
	@Autowired
	private InfoService infoService;

	@RequestMapping(value="/info",method={RequestMethod.GET})
	public ModelAndView essay(){
		ModelAndView view = new ModelAndView("info");
		view.addAllObjects(infoService.selectInfoList(1));
		return view;
	}
	
	@RequestMapping(value={"/info/{page}"},method={RequestMethod.GET})
	public ModelAndView essay(@PathVariable Integer page){
		ModelAndView view = new ModelAndView("info");
		view.addAllObjects(infoService.selectInfoList(page));
		return view;
	}
	
	@RequestMapping(value={"/info/detail/{id}"},method={RequestMethod.GET})
	public ModelAndView essayDetail(@PathVariable Integer id){
		ModelAndView view = new ModelAndView("infodetail");
		view.addAllObjects(infoService.selectInfoDetail(id));
		return view;
	}
	
}
