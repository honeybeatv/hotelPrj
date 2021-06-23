package com.site.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.site.service.UserService;
import com.site.vo.RoomVo;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@RequestMapping("/index")
	public String index() {
		return "/index";
	}

}
