package com.site.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.site.service.RoomService;
import com.site.vo.RoomVo;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	RoomService roomService;
	
	@RequestMapping("/index")
	public String index(Model model) {
		List<RoomVo> list = roomService.roomsListAll();
		model.addAttribute("list", list);
		return "index";
	}

}
