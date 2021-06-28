package com.site.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.site.service.ReserveService;
import com.site.vo.ReserveVo;
import com.site.vo.RoomVo;

@Controller
@RequestMapping("/reserve")
public class ReserveController {
	
	@Autowired
	ReserveService reserveService;
	
	
	//숙소 예약 페이지
	@RequestMapping("/reserveList")
	public String reserveList(Model model) {
		
		List<ReserveVo> list = reserveService.reserveListAll();
		
		System.out.println("test" + list.get(0));
		System.out.println(list);
		
		model.addAttribute("list", list);
		return "/reserveList";
	}
	 
	

}
