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

   @RequestMapping("/rooms")
   public String test() {
      return "/rooms";
   }
   @RequestMapping("/rooms-single")
   public String rooms() {
      return "/rooms-single";
   }
   
	@RequestMapping("/search")
	public String test(@RequestParam("startDate") String start,@RequestParam("endDate") String end,RoomVo vo,Model model) throws ParseException {
		System.out.println(vo);
		String start1 = start.replaceAll("/", "");
		String end1 = end.replaceAll("/", "");
		int startday = Integer.parseInt(start1);
		int endday = Integer.parseInt(end1);
		System.out.println(startday+","+endday);
		List<RoomVo> list = service.getlist(startday,endday);
		System.out.println(list);
		model.addAttribute("list",list);
		return "/rooms";
	}
	 @RequestMapping("/roomsadd")
	   public String roomsadd() {
	      return "/roomsadd";
	   }
	 
	 @RequestMapping("/roomsList") //room 리스트 페이지 호출
		public String roomsList(Model model) {
			
			List<RoomVo> roomsList = service.roomsListAll();
			model.addAttribute("roomsList", roomsList);
			
			System.out.println("roomsList" + roomsList);
			return "/roomsList";
		}

}