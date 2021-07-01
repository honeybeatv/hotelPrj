package com.site.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.site.service.RoomService;
import com.site.vo.RoomVo;

@Controller
public class MainController {
	
	@Autowired
	RoomService roomService;
	
	@RequestMapping("")
	public String index(Model model,@RequestParam @Nullable String page) {
		int listPage = 0;
		Map<String,Object> map = null;	
		if ( page == null) {
			listPage = 1;
		} else {
			listPage = Integer.parseInt(page);
		}
		map = roomService.roomsListAll(listPage);
		model.addAttribute("map",map);
		return "index";
	}
		
		

}
