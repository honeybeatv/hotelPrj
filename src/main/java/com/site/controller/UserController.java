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

import com.site.service.UserService;
import com.site.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping("/login")
	public String login() {
		System.out.println("user login");
		return "/user/login";
	}
	
	@RequestMapping("/join")
	public String join() {
		System.out.println("user join");
		return "/user/join";
	}

	@RequestMapping("/mypage")
	public String mypage() {
		System.out.println("user mypage");
		return "/user/mypage";
	}

	@RequestMapping("/UserInfoView")	// 회원 기본정보 페이지 호출
	public String UserInfoView(Model model, @RequestParam("userno") int userno) {
		UserVo userVo = userService.UserInfoView(userno);
		model.addAttribute(userVo);
		
		System.out.println("UserInfoView userid : " + userVo.getUserid());
		
		return "/user/UserInfoView";
	}

	@RequestMapping("/UserInfoModify") // 회원 기본정보 수정페이지 호출
	public String mypageModify(Model model, @RequestParam("userno") int userno) {
		UserVo userVo = userService.UserInfoModify(userno);
		model.addAttribute(userVo);
		
		System.out.println("UserInfoModify userid : " + userVo.getUserid());
		
		return "/user/UserInfoModify";
	}

	@RequestMapping("/UserInfoModifyDo") // 회원 기본정보 수정페이지 실행
	public String UserInfoModifyDo(UserVo userVo) {
		userService.UserInfoModifyDo(userVo);
		System.out.println("UserInfoModifyDo userid : " + userVo.getUserid());
		
//		userVo = userService.UserInfoView(userVo.getUserid());
//		return "redirect:/mypageView?name="+userVo.getName();
		return "redirect:/user/UserInfoView?userno="+ userVo.getUser_no();
	}
}