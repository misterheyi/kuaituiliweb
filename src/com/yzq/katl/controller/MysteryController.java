package com.yzq.katl.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yzq.katl.service.MysteryService;


@Controller
public class MysteryController {
	
	@Autowired
	private MysteryService mysteryService;

	@RequestMapping(value="/mystery",method={RequestMethod.GET})
	public ModelAndView essay(){
		ModelAndView view = new ModelAndView("mystery");
		view.addAllObjects(mysteryService.selectMysteryList(1));
		return view;
	}
	
	@RequestMapping(value={"/mystery/{page}"},method={RequestMethod.GET})
	public ModelAndView essay(@PathVariable Integer page){
		ModelAndView view = new ModelAndView("mystery");
		view.addAllObjects(mysteryService.selectMysteryList(page));
		return view;
	}
	
	@RequestMapping(value={"/mystery/detail/{id}"},method={RequestMethod.GET})
	public ModelAndView mysteryDetail(@PathVariable Integer id){
		ModelAndView view = new ModelAndView("mysterydetail");
		view.addAllObjects(mysteryService.selectMysteryDetail(id));
		return view;
	}
	
}
