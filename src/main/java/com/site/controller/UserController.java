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
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("# user logout #");
		return "redirect:/main/index";
	}

	@RequestMapping("/login")
	public String login() {
		System.out.println("# user login page #");
		return "/user/login";
	}
	
	@RequestMapping(value="/login_check")
	@ResponseBody
	public Map<String,Object> login_check(UserVo userVo,HttpServletRequest request,Model model) {
		
		Map<String,Object> map=new HashMap<String, Object>();
		HttpSession session = request.getSession();
		UserVo uVo = userService.login(userVo); //전체리스트 가져오기
		
		map.put("uVo",uVo);
		if(uVo==null) {
			map.put("flag", "fail");
			map.put("msg", "아이디와 패스워드가 일치하지 않습니다.");
			
			session.setAttribute("session_flag","fail");
			
			System.out.println("# user login fail #");
		}else {
			map.put("flag", "success");
			map.put("msg", "로그인 성공!");
			
			session.setAttribute("session_flag","success");	//nav.jsp 에서 로그인 확인용
			session.setAttribute("session_userid", uVo.getUserid());	//로그인 확인 및 환영문구 이용
			session.setAttribute("session_userno", uVo.getUserno());	//정보호출용
			session.setAttribute("session_uemail", uVo.getUemail());
			session.setAttribute("session_uadmin", uVo.getUadmin());	//회원,관리자 확인용
			
			System.out.println("# user login success session_userid : " + session.getAttribute("session_userid") + " #");
		}
		return map;
	}
	
	@RequestMapping("/join")
	public String join() {
		System.out.println("user join page");
		return "/user/join";
	}
	@RequestMapping ("/join_check")
	@ResponseBody
	public Map<String,Object> join_check(UserVo userVo,HttpServletRequest request,Model model) {
		
		Map<String,Object> map=new HashMap<String, Object>();
		int count = userService.join(userVo); //회원가입 데이터입력 저장
		
		
		if(count==0) {
			map.put("flag", "fail");
			map.put("msg", "회원가입 실패.");
			
			System.out.println("# user join fail #");
		}else {
			map.put("flag", "success");
			map.put("msg", "회원가입 성공!");
			
			System.out.println("# user join success #");
		}
		return map;
	}

	@RequestMapping("/mypage")
	public String mypage() {
		System.out.println("# user mypage category #");
		return "/user/mypage";
	}

	@RequestMapping("/userInfoView")	// 회원 기본정보 페이지 호출
	public String UserInfoView(Model model, @RequestParam("userno") int userno) {
		UserVo userVo = userService.UserInfoView(userno);
		model.addAttribute(userVo);
		
		System.out.println("# mypage category_Informaton UserInfoView userid : " + userVo.getUserid() + " #");
		
		return "/user/userInfoView";
	}

	@RequestMapping("/userInfoModify") // 회원 기본정보 수정페이지 호출
	public String mypageModify(Model model, @RequestParam("userno") int userno) {
		UserVo userVo = userService.UserInfoModify(userno);
		model.addAttribute(userVo);
		
		System.out.println("# mypage category_Informaton userInfoModify userid : " + userVo.getUserid() + " #");
		
		return "/user/userInfoModify";
	}

	@RequestMapping("/userInfoModifyDo") // 회원 기본정보 수정페이지 실행
	public String userInfoModifyDo(UserVo userVo) {
		userService.UserInfoModifyDo(userVo);
		
		System.out.println("# mypage category_Informaton userInfoModifyyDo userid : " + userVo.getUserid() + " #");
		
		return "redirect:/user/userInfoView?userno="+ userVo.getUserno();
	}
}