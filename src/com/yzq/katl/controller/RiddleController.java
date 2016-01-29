package com.yzq.katl.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yzq.katl.service.RiddleService;


@Controller
public class RiddleController {
	
	@Autowired
	private RiddleService riddleService;

	@RequestMapping(value="/riddle",method={RequestMethod.GET})
	public ModelAndView essay(){
		ModelAndView view = new ModelAndView("riddle");
		view.addAllObjects(riddleService.selectRiddleList(1));
		return view;
	}
	
	@RequestMapping(value={"/riddle/{page}"},method={RequestMethod.GET})
	public ModelAndView essay(@PathVariable Integer page){
		ModelAndView view = new ModelAndView("riddle");
		view.addAllObjects(riddleService.selectRiddleList(page));
		return view;
	}
	
	@RequestMapping(value="/riddle/updateRiddleClickTimes",method={RequestMethod.POST})
	@ResponseBody
	public String updateRiddleClickTimes(Integer id){
		return this.riddleService.updateRiddleClickTimes(id);
	}
	
}
