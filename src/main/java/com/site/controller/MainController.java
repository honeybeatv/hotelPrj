package com.site.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/index")
	public String index() {
		return "/index";
	}
		@RequestMapping("/rooms-single")
		public String test() {
			return "/rooms-single";
	}

}
