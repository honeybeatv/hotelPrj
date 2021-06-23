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
		return "redirect:/main/index";
	}
	
	@RequestMapping("/administration")
	public String mypage() {
		System.out.println("# admin administration category #");
		return "/admin/administration";
	}
	
	@RequestMapping("/userInfoView")	// 회원 기본정보 페이지 호출
	public String UserInfoView(Model model, @RequestParam("userno") int userno) {
		UserVo userVo = adminService.AdminInfoView(userno);
		model.addAttribute(userVo);
		
		System.out.println("# administration category_Informaton UserInfoView userid : " + userVo.getUserid() + " #");
		
		return "/user/userInfoView";
	}

	@RequestMapping("/userInfoModify") // 회원 기본정보 수정페이지 호출
	public String mypageModify(Model model, @RequestParam("userno") int userno) {
		UserVo userVo = adminService.AdminInfoModify(userno);
		model.addAttribute(userVo);
		
		System.out.println("# administration category_Informaton userInfoModify userid : " + userVo.getUserid() + " #");
		
		return "/user/userInfoModify";
	}

	@RequestMapping("/adminInfoModifyDo") // 회원 기본정보 수정페이지 실행
	public String userInfoModifyDo(UserVo userVo) {
		adminService.AdminInfoModifyDo(userVo);
		
		System.out.println("# administration category_Informaton userInfoModifyyDo userid : " + userVo.getUserid() + " #");
		
		return "redirect:/admin/adminInfoView?userno="+ userVo.getUserno();
	}

}