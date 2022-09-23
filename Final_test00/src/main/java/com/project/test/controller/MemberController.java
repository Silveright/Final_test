package com.project.test.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.test.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private MemberService memberservice;
	@Autowired
	public MemberController(MemberService memberservice) {
		this.memberservice = memberservice;
	}
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView login(ModelAndView mv, 
							 @CookieValue(value="saveid", required=false) Cookie readCookie
							 ) {
		if(readCookie != null) {
			mv.addObject("saveid", readCookie.getValue());
		}
		mv.setViewName("loginForm");
		return mv;
	}
	
	@RequestMapping(value="/loginProcess", method = RequestMethod.POST)
	public String loginProcess(@RequestParam("id") String id, 
							   @RequestParam("password") String password,
							   @RequestParam(value="remember", defaultValue="",required=false)
								String remember,
								HttpServletResponse response,
								HttpSession session,
								RedirectAttributes rattr) {
		int result = memberservice.isId(id,password);
		result=1;
		logger.info("결과 : " +result);
		
		if(result==1) {
			//로그인 성공
			session.setAttribute("id", id);
			Cookie savecookie = new Cookie("saveid", id);
			if(!remember.equals("")) {
				savecookie.setMaxAge(60*60);
				logger.info("쿠키 저장: 60*60");
			}else {
				logger.info("쿠키 저장: 0");
				savecookie.setMaxAge(0);
			}
			response.addCookie(savecookie);
			return "redirect:/group/list";
		}else {
			rattr.addFlashAttribute("result",result);
			return "redirect:login";
		}
	}
}
