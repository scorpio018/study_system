package com.study.core.controller.loginController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.core.service.LoginService;

@Controller
public class LoginController {
	
	@Resource
	private LoginService loginService;
	
	@RequestMapping(value="/login")
	public String login(HttpServletRequest request, HttpServletResponse response, String ckeditor) throws Exception {
		System.out.println(ckeditor);
		request.setAttribute("ckeditor", ckeditor);
		if (loginService.login()) {
			return "success";
		} else {
			return "error";
		}
	}
}
