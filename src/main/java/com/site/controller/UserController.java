package com.site.controller;

import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.site.service.UserService;
import com.site.vo.ReserveVo;
import com.site.vo.UserReservationVo;
import com.site.vo.RoomVo;
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
		System.out.println("# user logout success #");
		return "redirect:/";
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
	@RequestMapping ("/id_check")
	@ResponseBody
	public Map<String,Object> id_check(UserVo userVo,HttpServletRequest request) {
		System.out.println("userid ="+request.getParameter("userid"));
		Map<String,Object> map=new HashMap<String, Object>();
		int count = userService.id_check(request.getParameter("userid")); //회원가입 데이터입력 저장
		
		
		if(count==0) {
			map.put("flag", "success");
			map.put("data", "0"); //db존제하지 않으니 가입 가능
		}else {
			map.put("flag", "fail");
			map.put("data", "1"); //db존제 해  가입 불가능
			
		}
		return map;
	}

	@RequestMapping("/mypage")
	public String mypage() {
		System.out.println("# user mypage category #");
		return "/user/mypage";
	}

	@RequestMapping("/userInfoView")	// 회원 기본정보 페이지 호출
	public String userInfoView(Model model, @RequestParam("userno") int userno) {
		UserVo userVo = userService.userInfoView(userno);
		model.addAttribute("userVo", userVo);
		System.out.println("# mypage category_Informaton userInfoView userid : " + userVo.getUserid() + " #");
		
		return "/user/userInfoView";
	}

	@RequestMapping("/userInfoModify") // 회원 기본정보 수정페이지 호출
	public String mypageModify(Model model, @RequestParam("userno") int userno) {
		UserVo userVo = userService.userInfoModify(userno);
		model.addAttribute("userVo", userVo);
		
		System.out.println("# mypage category_Informaton userInfoModify userid : " + userVo.getUserid() + " #");
		
		return "/user/userInfoModify";
	}

	@RequestMapping("/userInfoModifyDo") // 회원 기본정보 수정페이지 실행
	public String userInfoModifyDo(UserVo userVo, @RequestParam("userno") int userno) {
		userService.userInfoModifyDo(userVo);
		
		System.out.println("# mypage category_Informaton userInfoModifyDo userid : " + userVo.getUserid() + " #");
		
		return "/user/userInfoView";
	}
	
	@RequestMapping("/userReservationView")	// 회원 예약정보 페이지 호출
	public String userReservationView(Model model, @RequestParam("userno") int userno) {
		UserVo userVo = userService.userInfoView(userno);
		List<UserReservationVo> userReservationList= userService.userReservationViewList(userno);
		
		System.out.println("# mypage category_Reservation userReservationView userno : " + userVo.getUserno() + " #");
		
		model.addAttribute("userReservationList", userReservationList);
		
		return "/user/userReservationView";
	}

	@RequestMapping("/userHostingView")	// 회원 호스팅 상품 페이지 호출
	public String userHostingView(Model model , @RequestParam("userno") int userno) {
		Map<String, Object> userHostingViewMap = userService.userHostingViewList(userno);
		model.addAttribute("userHostingViewMap", userHostingViewMap);
		
		System.out.println("# mypage category_Hosting View ListAll #");
		
		return "/user/userHostingView";
	}

	@RequestMapping("/userHostingModify") // 회원 호스팅 상품 수정페이지 호출
	public String userHostingModify(Model model, @RequestParam("userno") int userno, @RequestParam("roomNo") int roomNo) {
		Map<String, Object> userHostingModifyMap = userService.userHostingModifyList(userno, roomNo);
		model.addAttribute("userHostingModifyMap", userHostingModifyMap);
		
		System.out.println("# mypage category_Hosting Modify #");
		
		return "/user/userHostingModify";
	}

	@RequestMapping("/userHostingModifyDo") // 회원 호스팅 상품 수정페이지 실행
	public String userHostingModifyDo(Model model, RoomVo roomVo, @RequestParam("userno") int userno) {
		userService.userHostingModifDo(roomVo);
		
		System.out.println("userno : " + userno + " | roomVo : " + roomVo);
		System.out.println("# mypage category_Hosting ModifyDo #");
		
		Map<String, Object> userHostingViewMap = userService.userHostingViewList(userno);
		model.addAttribute("userHostingViewMap", userHostingViewMap);
		
		return "/user/userHostingView";
	}

	@RequestMapping("/userHostingDelete") // 회원 호스팅 상품 삭제
	@ResponseBody
	public Map<String, Object> userHostingDelete(RoomVo roomVo){
		System.out.println("# mypage category_Hosting Delete #");
		return userService.userHostingDelete(roomVo);
	}
	
}