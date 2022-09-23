package com.project.test.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.test.service.GroupService;

@Controller
@RequestMapping(value="/group")
public class GroupController {
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	private GroupService groupservice;
	/*
	 * @Autowired public GroupController(GroupService groupservice) {
	 * this.groupservice = groupservice; }
	 */
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView grouplist(ModelAndView mv) {
		mv.setViewName("group/grouplist");
		return mv;
		
	}
}
