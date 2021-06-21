package com.site.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.site.vo.RoomVo;

@Controller
@RequestMapping("/room")
public class RoomController {
	

	@RequestMapping("/index")
	public String index() {
		return "/index";
	}

	@RequestMapping("/search")
	public String search(RoomVo vo) {
		System.out.println(vo);
		return "/rooms";
	}

	@RequestMapping("/test")
	public String test(@RequestParam("startDate") String one,RoomVo vo) {
		System.out.println(vo);
		System.out.println(one);
		return "/rooms";
	}

}
