package com.site.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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



   
   @RequestMapping("/rooms-single")
   public String rooms(@RequestParam("roomNo") int roomNo, Model model) {
	   
//	   roomService.roomSingle(roomNo);
	   RoomVo roomVo = roomService.roomSingle(roomNo);
	   
	   
	   model.addAttribute("roomVo", roomVo);
	   
	   
      return "/rooms-single";
   }
   
   @RequestMapping("/roomsList") //쓰기페이지 호출
  	public String roomsList() {
  		return "/roomsList";
  	}

   
   @RequestMapping("/roomsadd") //쓰기페이지 호출
	public String roomsWrite() {
		return "/roomsadd";
	}

	@RequestMapping("/roomsWriteDo") //쓰기저장 호출
	public String roomsWriteDo(RoomVo roomVo) {
		System.out.println("1");
		roomService.roomsWriteDo(roomVo);	// 여기서 왜 0을 쳐 가지고오지 next val인데
		System.out.println("2");
		
		return "/roomsadd";
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
		model.addAttribute("rcity",vo.getRcity());		
		model.addAttribute("rpeople", vo.getRpeople());
		
		return "/rooms";
	}
	
	//상세 조건 검색
	@RequestMapping("/advancedSearch")
	public String advancedSearch(@RequestParam("inDate") @Nullable String inDate, @RequestParam("outDate") @Nullable String outDate,
						@RequestParam("rtype") @Nullable String rtype, @RequestParam("rroom") @Nullable int rroom,
						@RequestParam("rbed") @Nullable int rbed,
						@RequestParam("minPrice") @Nullable int minPrice, @RequestParam("maxPrice") @Nullable int maxPrice, 
						@RequestParam(value = "rpet", defaultValue = "nopet") @Nullable String rpet, @RequestParam(value= "rsmoke", defaultValue = "nosmoke") @Nullable String rsmoke,
						//@RequestParam("rpet") String rpet, @RequestParam("rsmoke") @Nullable String rsmoke,
						@RequestParam("rcity") @Nullable String rcity, @RequestParam("rpeople") @Nullable int rpeople, Model model  
						) {
		String checkIn = inDate.replaceAll("/", "");
		String checkOut = outDate.replaceAll("/", "");
		
		System.out.println(checkIn +" " + checkOut);
		System.out.println(rcity + rroom);
		System.out.println(rtype + " " + rpeople);
		System.out.println("흡연 : "+ rsmoke + " " + "동물 : "+ rpet+" end");
		System.out.println(minPrice + ", " + maxPrice);
		
		List<RoomVo> list = roomService.roomListAdvanced(checkIn, checkOut, rtype, rroom, rbed, minPrice, maxPrice, rpet, rsmoke, rcity, rpeople);
		
		System.out.println(list);
		
		model.addAttribute("list", list);
		model.addAttribute("start",inDate);
		model.addAttribute("end",outDate);
		model.addAttribute("rpeople", rpeople);
		model.addAttribute("rcity", rcity);
		return "rooms";
	}
}

