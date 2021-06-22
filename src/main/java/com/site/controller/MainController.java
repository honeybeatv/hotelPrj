package com.site.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.site.service.SearchService;
import com.site.service.UserService;
import com.site.vo.RoomVo;

@Controller
public class MainController {

	@Autowired
	SearchService searchService;
	
	
	@RequestMapping("/index")
	public String index() {
		return "/index";
	}
		@RequestMapping("/rooms-single")
		public String test() {
			return "/rooms-single";
	}

	@RequestMapping("/search")
	public String search() {
		return "/rooms";
	}
	
	@RequestMapping("/advancedSearch")
	public String advancedSearch(@RequestParam("inDate") String checkIn, @RequestParam("outDate") String checkout, @RequestParam("roomType") String roomType,
						@RequestParam("bedroom") String bedroom, @RequestParam("bed") String bed,
						@RequestParam("minPrice") int minPrice, @RequestParam("maxPrice") int maxPrice, 
						@RequestParam("pet") String pet, @RequestParam("smoke") String smoke) {
		System.out.println(checkIn +" " + checkout);
		System.out.println(roomType);
		System.out.println(smoke + " " + pet);
		System.out.println(minPrice + ", " + maxPrice);
	
		
		//List<RoomVo> list = searchService.roomListAdvanced(checkIn, checkout, roomType, adult, child, minPrice, maxPrice);
		
		return "/rooms";
	}
}
