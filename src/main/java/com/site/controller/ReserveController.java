package com.site.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.site.service.ReserveService;
import com.site.service.UserService;
import com.site.vo.ReserveVo;
import com.site.vo.RoomVo;
import com.site.vo.UserVo;

@Controller
@RequestMapping("/reserve")
public class ReserveController {
	
	@Autowired
	ReserveService reserveService;
	@Autowired
	UserService userService;
	
	//숙소 전체 예약 리스트
	@RequestMapping("/reserveList")
	public String reserveList(Model model) {
		
		List<ReserveVo> list = reserveService.reserveListAll();
		
		System.out.println("test" + list.get(0));
		System.out.println(list);
		
		model.addAttribute("list", list);
		return "/reserveList";
	}
	
	@RequestMapping("/roomReserve")
	public String roomReserve(RoomVo roomVo, HttpServletRequest request,  Model model ) {
	
		//userno를 세션에서 가져옴
	   HttpSession session = request.getSession();
	   int userno = (int)session.getAttribute("session_userno");
		
	  //유저 객체 가져옴
	   UserVo userVo = userService.userInfoView(userno);
	   
	   model.addAttribute("userVo", userVo);
	   model.addAttribute("roomVo", reserveService.roomReserve(roomVo));
	   
		return "/roomReserve";
	}
	
	
	//예약 내역 DB저장
	@RequestMapping("/ajax/save")
	@ResponseBody
	public ReserveVo ajaxSave(ReserveVo ReserveVo, HttpServletRequest request,
			@RequestParam ("roomNo") int roomNo) {
	
		System.out.println("roomNo {TEST} :" + roomNo);
		
		HttpSession session = request.getSession();
		int userno = (int)session.getAttribute("session_userno");
		
		ReserveVo.setUserno(userno);
		ReserveVo.setRoomno(roomNo);
		
		System.out.println("ReserveVo {TEST} :" + ReserveVo);
		
		reserveService.save(ReserveVo);
	   
		ReserveVo.setCode("SUCCESS");
	   
		return ReserveVo; 
	}
	
}
