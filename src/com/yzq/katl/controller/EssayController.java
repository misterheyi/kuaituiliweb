package com.yzq.katl.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yzq.katl.service.EssayService;


@Controller
public class EssayController {
	
	@Autowired
	private EssayService essayService;

	@RequestMapping(value="/essay",method={RequestMethod.GET})
	public ModelAndView essay(){
		ModelAndView view = new ModelAndView("essay");
		view.addAllObjects(essayService.selectEssayList(0,1));
		return view;
	}
	
	@RequestMapping(value={"/essay/{type}/{page}"},method={RequestMethod.GET})
	public ModelAndView essay(@PathVariable Integer type , @PathVariable Integer page){
		ModelAndView view = new ModelAndView("essay");
		view.addAllObjects(essayService.selectEssayList(type,page));
		return view;
	}
	
	@RequestMapping(value={"/essay/detail/{id}"},method={RequestMethod.GET})
	public ModelAndView essayDetail(@PathVariable Integer id){
		ModelAndView view = new ModelAndView("essaydetail");
		view.addAllObjects(essayService.selectEssayDetail(id));
		return view;
	}
	
}
