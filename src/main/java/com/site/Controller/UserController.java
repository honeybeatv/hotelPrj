package com.site.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.site.service.UserService;
import com.site.vo.UserVo;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping("/index01")
	public String index01() {
		return "/index01";
	}

	@RequestMapping("/index")
	public String index() {
		return "/index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "/login";
	}
}