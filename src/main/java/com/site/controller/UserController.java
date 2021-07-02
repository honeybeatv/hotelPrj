package com.site.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.site.service.UserService;
import com.site.vo.ReserveVo;
import com.site.vo.RoomVo;
import com.site.vo.UserReservationVo;
import com.site.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	JavaMailSender javaMailSender;
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("# user logout success #");
		return "redirect:/";
	}

	@RequestMapping("/login")
	public String login(HttpServletRequest request,Model model) {
		System.out.println("# user login page #");
		String referer = request.getHeader("Referer");
		System.out.println(referer);
		model.addAttribute("page", referer);
		return "/user/login";
	}
	
	@RequestMapping(value="/login_check")
	@ResponseBody
	public Map<String,Object> login_check(UserVo userVo,HttpServletRequest request,Model model,@RequestParam(value="page",required=false) String page) {
		
		Map<String,Object> map=new HashMap<String, Object>();
		HttpSession session = request.getSession();
		UserVo uVo = userService.login(userVo); //전체리스트 가져오기
		if(page.equals("http://localhost:8000/room/search")) {
			page = "/";
		} else if (page.equals("http://localhost:8000/room/advancedSearch")) {
			page = "/";
		}
		map.put("uVo",uVo);
		if(uVo==null) {
			map.put("flag", "fail");
			map.put("msg", "아이디와 패스워드가 일치하지 않습니다.");
			
			session.setAttribute("session_flag","fail");
			
			System.out.println("# user login fail #");
		}else {
			map.put("flag", "success");
			map.put("msg", "로그인 성공!");
			map.put("page",page);
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
		System.out.println(userHostingModifyMap);
		
		return "/user/userHostingModify";
	}

	@RequestMapping("/userHostingModifyDo") // 회원 호스팅 상품 수정페이지 실행
	public String userHostingModifyDo(Model model, RoomVo roomVo, 
									  @RequestParam("userno") int userno,
									  @RequestPart List<MultipartFile> file) {
		
		userService.userHostingModifDo(roomVo, file);
		
		System.out.println("userno : " + userno + " | roomVo : " + roomVo);
		System.out.println("# mypage category_Hosting ModifyDo #");
		
		Map<String, Object> userHostingViewMap = userService.userHostingViewList(userno);
		model.addAttribute("userHostingViewMap", userHostingViewMap);
		
		return "/user/userHostingView";
	}

	@RequestMapping("/userHostingDelete") // 회원 호스팅 상품 삭제
	@ResponseBody
	public Map<String, Object> userHostingDelete(RoomVo roomVo){
		userService.userReservationDelete(roomVo.getRoomNo());
		
		System.out.println("# mypage category_Hosting Delete #");
		return userService.userHostingDelete(roomVo);
	}
	
	@RequestMapping("/CheckMail")
	@ResponseBody
	public Map<String, Object> SendMail(String mail, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		Random random = new Random();
		String key = "";

		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("khw00050@gmail.com");
		message.setTo(mail); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소
		// 입력 키를 위한 코드
		for (int i = 0; i < 3; i++) {
			int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
			key += (char) index;
		}
		int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
		key += numIndex;
		message.setSubject("인증번호 입력을 위한 메일 전송");
		message.setText("인증 번호 : " + key);
		System.out.println(key);
		javaMailSender.send(message);
		map.put("key", key);
		return map;
	}
	@RequestMapping("/userHostingReservation")
	public String HostingReservation(@RequestParam("roomNo") int roomNo,Model model) {
		List<ReserveVo> list = userService.HostingReservation(roomNo);
		model.addAttribute("list", list);
		
		
		return "/user/userHostingReservationView";
	}
	@RequestMapping("/userHostingReservationApprove")
	@ResponseBody
	public Map<String, Object> userHostingReservationApprove(int re_no) {
		Map<String, Object> map = new HashMap<>();
		int result = userService.userHostingReservationApprove(re_no);
		System.out.println(result);
		if(result == 1) {
			map.put("msg", "승인처리되었습니다.");
		}
		return map;
	}
	@RequestMapping("/userHostingReservationReject")
	@ResponseBody
	public Map<String, Object> userHostingReservationReject(int re_no) {
		Map<String, Object> map = new HashMap<>();
		int result = userService.userHostingReservationReject(re_no);
		System.out.println(result);
		if(result == 1) {
			map.put("msg", "거부처리되었습니다.");
		}
		return map;
	}
	
}