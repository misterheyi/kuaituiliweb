package com.yzq.katl.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yzq.katl.service.FamousService;


@Controller
public class FamousController {
	
	@Autowired
	private FamousService famousService;

	@RequestMapping(value="/famous",method={RequestMethod.GET})
	public ModelAndView essay(String title){
		ModelAndView view = new ModelAndView("famous");
		view.addAllObjects(famousService.selectFamousList(1,title));
		return view;
	}
	
	@RequestMapping(value={"/famous/{page}"},method={RequestMethod.GET})
	public ModelAndView essay(@PathVariable Integer page,String title){
		ModelAndView view = new ModelAndView("famous");
		view.addAllObjects(famousService.selectFamousList(page,title));
		return view;
	}
	
	@RequestMapping(value={"/famous/detail/{id}"},method={RequestMethod.GET})
	public ModelAndView famousDetail(@PathVariable Integer id){
		ModelAndView view = new ModelAndView("famousdetail");
		view.addAllObjects(famousService.selectFamousDetail(id));
		return view;
	}
}
