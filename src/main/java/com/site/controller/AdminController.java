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
	public String userInfoView(Model model, @RequestParam("userno") int userno) {
		UserVo adminVo = adminService.AdminInfoView(userno);
		model.addAttribute("adminVo", adminVo);
		
		System.out.println("# administration category_Informaton adminInfoView userid : " + adminVo.getUserid() + " #");
		System.out.println(adminVo);
		
		return "/admin/adminInfoView";
	}

	@RequestMapping("/adminInfoModify") // 관리자 기본정보 수정페이지 호출
	public String mypageModify(Model model, @RequestParam("userno") int userno) {
		UserVo adminVo = adminService.AdminInfoModify(userno);
		model.addAttribute("adminVo", adminVo);
		
		System.out.println("# administration category_Informaton adminInfoModify userid : " + adminVo.getUserid() + " #");
		
		return "/admin/adminInfoModify";
	}

	@RequestMapping("/adminInfoModifyDo") // 관리자 기본정보 수정페이지 실행
	public String adminInfoModifyDo(UserVo adminVo) {
		adminService.AdminInfoModifyDo(adminVo);
		
		System.out.println("# administration category_Informaton adminInfoModifyDo userid : " + adminVo.getUserid() + " #");
		
		return "redirect:/admin/adminInfoView?userno="+ adminVo.getUserno();
	}
	@RequestMapping("/administrationUsersView")	// 관리자 기본정보 페이지 호출
	public String administrationUsersView(Model model, @RequestParam(value="page", defaultValue="1") int page) {
		Map<String,Object> map = null;
		map = adminService.userList(page);
		model.addAttribute("map",map);
		
		return "/admin/administrationUsersView";
	}
	@RequestMapping("/adminUserHostingView")	// 회원 호스팅 상품 페이지 호출
	public String adminUserHostingView(Model model , @RequestParam("userno") int userno) {
//		Map<String, Object> adminUserHostingViewMap = adminService.adminUserHostingViewList(userno);
		model.addAttribute("adminUserHostingViewMap", adminUserHostingViewMap);
		
		System.out.println("# mypage category_Hosting View ListAll #");
		
		return "/admin/adminUserHostingView";
	}

}