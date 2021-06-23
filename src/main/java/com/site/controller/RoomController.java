package com.site.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
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
	RoomService roomService;
	
   @RequestMapping("/index")
   public String index() {
      return "/index";
   }

   @RequestMapping("/rooms")
   public String test() {
      return "/rooms";
   }
   
   @RequestMapping("/rooms-single")
   public String rooms() {
      return "/rooms-single";
   }
   
   @RequestMapping("/roomsadd")
   public String roomsadd() {
      return "/roomsadd";
   }
   @RequestMapping("/roomsList") //room 리스트 페이지 호출
	public String roomsList(Model model) {
		
		List<RoomVo> roomsList = roomService.roomsListAll();
		model.addAttribute("roomsList", roomsList);
		
		System.out.println("roomsList" + roomsList);
		return "/roomsList";
   }

   //index페이지에서 검색
	@RequestMapping("/search")
	public String test(@RequestParam("startDate") String start,@RequestParam("endDate") String end,RoomVo vo,Model model) throws ParseException {
		System.out.println(vo);
		String start1 = start.replaceAll("/", "");
		String end1 = end.replaceAll("/", "");
		int startday = Integer.parseInt(start1);
		int endday = Integer.parseInt(end1);
		System.out.println(startday+","+endday);
		List<RoomVo> list = roomService.getlist(startday,endday,vo.getRcity(),vo.getRpeople());
		System.out.println(list);
		model.addAttribute("list",list);
		model.addAttribute("start",start);
		model.addAttribute("end",end);
		model.addAttribute("vo", vo);
		return "/rooms";
	}
	
	//상세 조건 검색
	@RequestMapping("/advancedSearch")
	public String advancedSearch(@RequestParam("inDate") @Nullable String inDate, @RequestParam("outDate") @Nullable String outDate, @RequestParam("roomType") @Nullable String roomType,
						@RequestParam("bedroom") @Nullable String bedroom, @RequestParam("bed") @Nullable String bed,
						@RequestParam("minPrice") @Nullable int minPrice, @RequestParam("maxPrice") @Nullable int maxPrice, 
						@RequestParam("pet") @Nullable String pet, @RequestParam("smoke") @Nullable String smoke) {
		System.out.println(inDate +" " + outDate);
		System.out.println(roomType);
		System.out.println(smoke + " " + pet);
		System.out.println(minPrice + ", " + maxPrice);
	
		String checkIn = inDate.replaceAll("/", "");
		String checkOut = outDate.replaceAll("/", "");
		
		List<RoomVo> list = roomService.roomListAdvanced(checkIn, checkOut, roomType, bedroom, bed, minPrice, maxPrice, pet, smoke);
		
		return "/rooms";
	}
}

