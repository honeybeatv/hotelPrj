package com.site.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.site.service.UserService;
import com.site.vo.RoomVo;

@Controller
public class MainController {
	
	@RequestMapping("/index")
	public String index() {
		return "/index";
	}

}
