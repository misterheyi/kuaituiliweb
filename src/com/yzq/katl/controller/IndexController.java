package com.yzq.katl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yzq.katl.service.IndexService;

@Controller
public class IndexController {

	@Autowired
	private IndexService indexService;
	
	@RequestMapping(value={"/","/index"},method={RequestMethod.GET})
	public ModelAndView toIndex(){
		ModelAndView view = new ModelAndView("index");
		view.addAllObjects(this.indexService.initIndexData());
		return view;
	}
	
	@RequestMapping(value="/aboutus",method={RequestMethod.GET})
	public ModelAndView aboutUs(){
		ModelAndView view = new ModelAndView("aboutus");
		return view;
	}
}
