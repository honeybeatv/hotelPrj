package com.site.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.site.service.AdminService;
import com.site.vo.RoomVo;
import com.site.vo.UserVo;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("# admin logout success #");
		return "redirect:/";
	}
	
	@RequestMapping("/administration")
	public String mypage() {
		System.out.println("# admin administration category #");
		return "/admin/administration";
	}
	
	@RequestMapping("/adminInfoView")	// 관리자 기본정보 페이지 호출
	public String adminInfoView(Model model, @RequestParam("userno") int userno) {
		UserVo adminVo = adminService.adminInfoView(userno);
		model.addAttribute("adminVo", adminVo);
		
		System.out.println("# admin category_Informaton adminInfoView userid : " + adminVo.getUserid() + " #");
		
		return "/admin/adminInfoView";
	}

	@RequestMapping("/adminInfoModify") // 관리자 기본정보 수정페이지 호출
	public String adminInfoModify(Model model, @RequestParam("userno") int userno) {
		UserVo adminVo = adminService.adminInfoModify(userno);
		model.addAttribute("adminVo", adminVo);
		
		System.out.println("# admin category_Informaton adminInfoModify userid : " + adminVo.getUserid() + " #");
		
		return "/admin/adminInfoModify";
	}
	
	@RequestMapping("/adminInfoModifyDo") // 관리자 기본정보 수정페이지 실행
	public String adminInfoModifyDo(Model model, UserVo adminVo, @RequestParam("userno") int userno) {
		adminService.adminInfoModifyDo(adminVo);
		model.addAttribute("adminVo", adminVo);
		
		System.out.println("# admin category_Informaton adminInfoModifyDo userid : " + adminVo.getUserid() + " #");
		
//		return "redirect:/admin/adminInfoView?userno="+ adminVo.getUserno();
		return "/admin/adminInfoView";
	}

	@RequestMapping("/adminUsersView")	// 관리자 회원정보 페이지 호출
	public String adminUsersView(Model model ,@RequestParam("uadmin") int uadmin, @RequestParam(value="page", defaultValue="1") int page) {
		Map<String,Object> map = null;
		map = adminService.userList(uadmin,page);
		model.addAttribute("map",map);
		
		System.out.println("# admin category_Users adminUsersView View ListAll #");
		
		return "/admin/adminUsersView";
	}

	@RequestMapping("/adminUsersDelete") // 관리자 회원 삭제
	@ResponseBody
	public Map<String, Object> adminUsersDelete(UserVo userVo){
		adminService.adminReservationDelete(userVo.getUserno()); // 삭제 실행을 위한 예약 내역 삭제
		adminService.adminHostingDelete(userVo.getUserno());
		
		System.out.println("# admin category_Users Delete #");
		
		return adminService.adminUsersDelete(userVo);
	}
	
	@RequestMapping("/adminReservationView")	// 관리자 회원 예약정보 호출
	public String adminReservationView(Model model, @RequestParam("uadmin") int uadmin) {
		Map<String,Object> adminReservationViewMap = adminService.adminReservationViewList(uadmin);
		model.addAttribute("adminReservationViewMap", adminReservationViewMap);
		
		System.out.println("# admin category_Reservation View ListAll #");
		
		return "/admin/adminReservationView";
	}
	

	@RequestMapping("/adminUsersHosting")	// 관리자 회원 상품 페이지 호출
	public String adminUsersHosting(Model model) {
		Map<String,Object> map = null;
		map = adminService.userHostingList();
		model.addAttribute("map",map);
		
		System.out.println("# admin category_Hosting adminUsersHosting View ListAll #");
		
		return "/admin/adminUsersHosting";
	}
	
	@RequestMapping("/adminUserHostingView")	// 회원 호스팅 상품 페이지 호출
	public String adminUserHostingView(Model model , @RequestParam("userno") int userno) {
		Map<String, Object> adminUserHostingViewMap = null;
		adminUserHostingViewMap = adminService.adminUserHostingViewList(userno);
		model.addAttribute("adminUserHostingViewMap", adminUserHostingViewMap);
		
		System.out.println("# admin category_Hosting View ListAll #");
		
		return "/admin/adminUserHostingView";
	}
}