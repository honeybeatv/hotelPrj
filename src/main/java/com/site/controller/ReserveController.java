package com.site.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.site.service.ReserveService;
import com.site.vo.RoomVo;

@Controller
@RequestMapping("/reserve")
public class ReserveController {
	
	@Autowired
	ReserveService reserveService;
	
	//숙소 예약
	@RequestMapping("/roomReserve")
	public String roomReserve(@RequestParam(value="re_no") int re_no, Model model) {
		
		RoomVo roomVo = reserveService.roomReserve(re_no);
		
		model.addAttribute("roomVo", roomVo);
		return "/roomReserve";
	}
	

}
