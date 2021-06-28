package com.site.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.site.service.ReserveService;

@Controller
@RequestMapping("/reserve")
public class ReserveController {
	
	@Autowired
	ReserveService reserveService;
	
	//숙소 예약
	@RequestMapping("/roomReserve")
	public String roomReserve() {
		
		
		
		
		return "/roomReserve";
	}
	
	@RequestMapping("/contact")
	public String contact() {
		
		
		
		
		return "/contact";
	}
	

}
