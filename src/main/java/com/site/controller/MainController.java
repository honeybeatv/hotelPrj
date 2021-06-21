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
@RequestMapping("/main")
public class MainController {

	@Autowired
	SearchService searchService;
	
	
	@RequestMapping("/index")
	public String index() {
		return "/index";
	}

	@RequestMapping("/search")
	public String search() {
		return "/rooms";
	}
	
	@RequestMapping("/advancedSearch")
	public String advancedSearch(@RequestParam("inDate") String checkIn, @RequestParam("outDate") String checkout, @RequestParam("roomType") String roomType,
						@RequestParam("personAdult") String adult, @RequestParam("personChild") String child,
						@RequestParam("minPrice") int minPrice, @RequestParam("maxPrice") int maxPrice) {
		System.out.println(checkIn +" " + checkout);
		System.out.println(roomType);
		System.out.println(adult + " " + child);
		System.out.println(minPrice + ", " + maxPrice);
		List<RoomVo> list = searchService.roomListAdvanced(checkIn, checkout, roomType, adult, child, minPrice, maxPrice);
		
		return "/rooms";
	}
}
