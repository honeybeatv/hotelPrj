package com.site.controller;

import java.io.File;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.site.service.RoomService;
import com.site.service.UserService;
import com.site.vo.ReserveVo;
import com.site.vo.ReviewVo;
import com.site.vo.RoomVo;
import com.site.vo.UserVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/room")
@Slf4j
public class RoomController {
	
	@Autowired
	RoomService roomService;
	
	@Autowired
	UserService userService;
   
   //숙소 상세정보 보기
   @RequestMapping("/rooms-single")
   public String roomSingle(@RequestParam(value="roomNo") int roomNo,@RequestParam(value="start",defaultValue = "1") String start,@RequestParam(value="end",defaultValue = "1") String end,
		   HttpServletRequest request, Model model) {
	   
	   //세션으로 유저 정보 얻기
	   int userno = 0;
	   UserVo userVo = new UserVo();
	   HttpSession session = request.getSession();
	   
	   if(session.getAttribute("session_userno") != null) {
	   userno = (int)session.getAttribute("session_userno");
	   userVo = roomService.userInfo(userno);
	   }
	   //숙소정보 얻기
	   RoomVo roomVo = roomService.roomSingle(roomNo);
	   //리뷰용 최근 예약 날짜 하나 얻기
	   ReserveVo reserveVo = roomService.selectReserveDate(roomNo, userno);
	   System.out.println("숙소 예약날짜" + reserveVo);
	   
	   //댓글
	   Map<String, Object> reviewMap = new HashMap<String, Object>();
	   reviewMap = roomService.reviewList(roomNo);
	   System.out.println(reviewMap);
	   
	   System.out.println("Controller roomVo Test" + roomVo);
	   System.out.println(" Controller userVo Test " + userVo.getName());
	   
	   //리뷰저장
	   model.addAttribute("reviewMap",reviewMap);
	   model.addAttribute("roomVo", roomVo);
	   model.addAttribute("userVo", userVo);
	   model.addAttribute("reserveVo", reserveVo);
	   if(!start.equals(null) && !end.equals(null)) {
	   model.addAttribute("start", start);
	   model.addAttribute("end", end);
	   }
      return "/rooms-single";
   }
   
//   @RequestMapping(value="/roomsReserve")
//	public String roomsReserve(	@RequestParam(value="roomNo") int roomNo,
//			@RequestParam(value="userno") int userno,
//			@RequestParam(value="startday") String startday, 
//			@RequestParam(value="endday") String endday, Model model) {
//	 
//		
//		System.out.println("Controller userno" +userno);
//		System.out.println("Controller roomNo" +roomNo);
//	   System.out.println("Controller Startday" +startday);
//	   System.out.println("Controller endday" +endday);
//	   
//	   
//	   
//	   roomService.roomReserve(roomNo, userno, startday, endday);
//	   
//	   model.addAttribute("roomNo", roomNo);
//	   model.addAttribute("userno", userno);
//	   model.addAttribute("startday", startday);
//	   model.addAttribute("endday", endday);
//	   model.addAttribute("userno", userno);
//	   
//		return "/user/userReservationView";
//	}
   
   @RequestMapping("/roomsList") 
  	public String roomsList() {
  		return "/roomsList";
  	}
   
   @RequestMapping("/roomsadd") //쓰기페이지 호출
	public String roomsWrite() {
		return "/roomsadd";
	}

	@RequestMapping("/roomsWriteDo") //쓰기저장 호출
	public String roomsWriteDo(Model model,RoomVo roomVo, @RequestParam("userno") int userno, @RequestPart List<MultipartFile> file) {
		System.out.println("roomsWriteDo");
		System.out.println("1");
		roomService.roomsWriteDo(roomVo, file);	// 

		Map<String, Object> userHostingViewMap = userService.userHostingViewList(userno);
		model.addAttribute("userHostingViewMap", userHostingViewMap);

		return "/user/userHostingView";
	}
	
	//리뷰저장
	@RequestMapping("/reviewWriteDo")
	public String reviewWriteDo(@RequestParam("roomNo") int roomNo, ReviewVo reviewVo, HttpServletRequest request ) {
		reviewVo.setRoomno(roomNo);
		System.out.println("Controller in " + reviewVo);
		
		int userno = 0;
		HttpSession session = request.getSession();
		if(session.getAttribute("session_userno") != null) {
			  userno = (int)session.getAttribute("session_userno");  
			}
		
		reviewVo.setUserno(userno);
		
		roomService.reviewWriteDo(reviewVo);
		System.out.println("controller out " + reviewVo);
		return "redirect:/room/rooms-single?roomNo="+roomNo;
	}
	

   //index페이지에서 검색
	@RequestMapping("/search")
	public String test(HttpServletRequest request, @RequestParam @Nullable String page,@RequestParam("startDate") String start,@RequestParam("endDate") String end,RoomVo vo,Model model) throws ParseException {
		int listPage = 0;
		
		if ( page == null) {
			listPage = 1;
		} else {
			listPage = Integer.parseInt(page);
		}
		
		System.out.println(vo);
		String start1 = start.replaceAll("/", "");
		String end1 = end.replaceAll("/", "");
		int startday = Integer.parseInt(start1);
		int endday = Integer.parseInt(end1);
		System.out.println(startday+","+endday);
		
		Map<String, Object> listAndNums = roomService.getlist(startday,endday,vo.getRcity(),vo.getRpeople(), listPage);
		
		System.out.println(listAndNums.get("pageNums"));
		model.addAttribute("listAndNums", listAndNums);
		model.addAttribute("start",start);
		model.addAttribute("end",end);
		model.addAttribute("rcity",vo.getRcity());		
		model.addAttribute("rpeople", vo.getRpeople());
		   
		return "/rooms";
	}
	
	//상세 조건 검색
	@RequestMapping("/advancedSearch")
	public String advancedSearch(@RequestParam(value="page", defaultValue = "1")int page, @RequestParam("inDate") String inDate, @RequestParam("outDate") String outDate,
						@RequestParam("rtype") String rtype, @RequestParam("rroom") int rroom,
						@RequestParam("rbed") int rbed,
						@RequestParam("minPrice") int minPrice, @RequestParam("maxPrice") int maxPrice, 
						@RequestParam(value = "rpet", defaultValue = "nopet") String rpet, @RequestParam(value= "rsmoke", defaultValue = "nosmoke") String rsmoke,
						@RequestParam("rcity") String rcity, @RequestParam("rpeople") int rpeople, Model model ) throws ParseException {
		String checkIn = inDate.replaceAll("/", "");
		String checkOut = outDate.replaceAll("/", "");
		
		System.out.println(checkIn +" " + checkOut);
		System.out.println(rcity + rroom);
		System.out.println(rtype + " " + rpeople);
		System.out.println("흡연 : "+ rsmoke + " " + "동물 : "+ rpet+" end");
		System.out.println(minPrice + ", " + maxPrice);
		System.out.println("controller " + page);
		
		//페이징 연구중 by.봉
		Map<String, Object> listAndNums = roomService.roomListAdvanced(checkIn, checkOut, rtype, rroom, rbed, minPrice, maxPrice, rpet, rsmoke, rcity, rpeople, page);
		System.out.println(listAndNums);
		
		model.addAttribute("listAndNums", listAndNums);	//한 페이지에 표시 될 리스트+페이징용 숫자들5개
		model.addAttribute("start",inDate);	
		model.addAttribute("end",outDate); 
		model.addAttribute("rtype", rtype);
		model.addAttribute("rroom", rroom);	//jsp페이징에서 판단기준
		model.addAttribute("rbed", rbed);
		model.addAttribute("minPrice", minPrice);
		model.addAttribute("maxPrice", maxPrice);
		model.addAttribute("rpet", rpet);
		model.addAttribute("rsmoke", rsmoke);
		model.addAttribute("rpeople", rpeople);
		model.addAttribute("rcity", rcity);
		return "rooms";
	}
	
	
	//테스트
	@RequestMapping("/reviewList") 
	public String reviewList(ReviewVo reviewVo, Model model) {
		System.out.println("Test reviewVo : {}" +reviewVo);
		List<ReviewVo> reviewListAll = roomService.reviewListAll();
		
		model.addAttribute("reviewListAll", reviewListAll );
		return "/reviewList";
	}
	
}

