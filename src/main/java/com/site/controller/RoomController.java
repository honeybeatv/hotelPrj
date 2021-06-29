package com.site.controller;

import java.io.File;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.site.service.RoomService;

import com.site.vo.RoomVo;


import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/room")
@Slf4j
public class RoomController {
	
	@Autowired
	RoomService roomService;
	
	@RequestMapping("/fileDo")
	@ResponseBody
	   public List<String> fileDo(RoomVo roomVo, @RequestPart List<MultipartFile> files)  throws Exception {

	      List<String> list = new ArrayList<>();
	      //2. 파일첨부 되는 것 체크
	      for(MultipartFile file : files) {
	      // 파일저장위치
	    	  String originalfileName = file.getOriginalFilename();
	    	  File f = new File("E:/0_koreavc/00_subclass/java/hotelPrj/src/main/resources/static/upload/" + originalfileName);
	     // String fileUrl = "E:/0_koreavc/00_subclass/java/hotelPrj/src/main/resources/static/upload/";
	      
	      // 파일이름중복방지
	      long time = System.currentTimeMillis();
	      String uploadFileName = time + "_" + file.getOriginalFilename(); 
	      
	      // 파일저장
	      //File f = new File(fileUrl + uploadFileName);   
	      // 파일전송
	      try {
	         file.transferTo(f);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      // 파일이름 삽입
	      roomVo.setRpicture(uploadFileName);
	      file.transferTo(f);
	      
	      //1. 파일첨부 내용 넘어오는것 체크
//	      System.out.println("파일업로드 유저 이름 : " + roomVo.getUserid());
//	      System.out.println("파일업로드 btitle : " + roomVo.getBtitle());
//	      System.out.println("파일업로드 bcontent : " + roomVo.getBcontent());
	      System.out.println("파일업로드 파일 이름 : " + file.getOriginalFilename());
	      System.out.println("파일업로드 변경된 파일 이름 : " + uploadFileName);

	      // - 파일업로드   -db저장
	      }
	      return list;
	      
	  }
	
   @RequestMapping("/index")
   public String index() {
      return "/index";
   }
   

   //숙소 상세정보 보기
   @RequestMapping("/rooms-single")
   public String roomSingle(@RequestParam(value="roomNo") int roomNo, Model model) {
//	   roomService.roomSingle(roomNo);
	   RoomVo roomVo = roomService.roomSingle(roomNo);
	  
	   
	   model.addAttribute("roomVo", roomVo);
	   
      return "/rooms-single";
   }
  
   
   @RequestMapping("/roomsList") 
  	public String roomsList() {
  		return "/roomsList";
  	}

   
   @RequestMapping("/roomsadd") //쓰기페이지 호출
	public String roomsWrite() {
		return "/roomsadd";
	}

	@RequestMapping("/roomsWriteDo") //쓰기저장 호출
	public String roomsWriteDo(Model model,RoomVo roomVo,@RequestPart MultipartFile file) {

		
		System.out.println("1");
		roomService.roomsWriteDo(roomVo, file);	// 
		model.addAttribute("roomVo",roomVo);
		System.out.println(roomVo.getRoomNo());

		return "redirect:/user/userHostingView?userno="+roomVo.getUserno();
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
		List<RoomVo> list = roomService.roomListAdvanced(checkIn, checkOut, rtype, rroom, rbed, minPrice, maxPrice, rpet, rsmoke, rcity, rpeople);
		
		//페이징 연구중 by.봉
		//List<RoomVo> list = roomService.roomListAdvanced2(checkIn, checkOut, rtype, rroom, rbed, minPrice, maxPrice, rpet, rsmoke, rcity, rpeople, page);
		
		//System.out.println(list);
		
		model.addAttribute("list", list);
		model.addAttribute("start",inDate);
		model.addAttribute("end",outDate); 
		model.addAttribute("rpeople", rpeople);
		model.addAttribute("rcity", rcity);
		return "rooms";
	}
}

