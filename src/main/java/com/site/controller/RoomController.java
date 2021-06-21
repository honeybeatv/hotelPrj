package com.site.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.site.service.RoomService;
import com.site.vo.RoomVo;

@Controller
@RequestMapping("/room")
public class RoomController {
	

	@Autowired
	RoomService service;
	
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
	public String test(@RequestParam("startDate") String start,@RequestParam("endDate") String end,RoomVo vo,Model model) throws ParseException {
		System.out.println(vo);
		String start1 = start.replaceAll("/", "");
		String end1 = end.replaceAll("/", "");
		int startday = Integer.parseInt(start1);
		int endday = Integer.parseInt(end1);
		System.out.println(startday+","+endday);
		List<RoomVo> temp = service.getlist(startday,endday);
		System.out.println(temp);
		model.addAttribute("temp",temp);
		return "/rooms";
	}

}
