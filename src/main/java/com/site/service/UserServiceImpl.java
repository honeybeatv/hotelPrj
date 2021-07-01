package com.site.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.site.mapper.UserMapper;
import com.site.vo.ReserveVo;
import com.site.vo.RoomVo;
import com.site.vo.UserReservationVo;
import com.site.vo.UserVo;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper userMapper;

	@Override //로그인 확인
	public UserVo login(UserVo userVo) {
		return userMapper.selectLogin(userVo);
	}
	@Override //회원가입
	public int join(UserVo userVo) {
		return userMapper.join_check(userVo);
	}
	@Override //아이디 중복체크
	public int id_check(String userid) {
		return userMapper.id_check(userid);
	}
	
	@Override // 회원 기본정보 페이지 호출
	public UserVo userInfoView(int userno) {
		UserVo userVo = userMapper.selectUserInfoList(userno);
		return userVo;
	}
	@Override // 회원 기본정보 수정페이지 호출
	public UserVo userInfoModify(int userno) {
		UserVo userVo = userMapper.selectUserInfoList(userno);
		return userVo;
	}
	@Override // 회원 기본정보 수정페이지 실행
	public void userInfoModifyDo(UserVo userVo) {
		userMapper.updateUserInfoModifyDo(userVo);
	}
	
	@Override // 회원 예약정보 페이지 호출
	public List<UserReservationVo> userReservationViewList(int userno) {
		
		List<UserReservationVo> uReservationReserveList =  userMapper.selectUserReservationViewList(userno);
		
		System.out.println(uReservationReserveList);
		
		return uReservationReserveList;
	}

	@Override // 회원 호스팅 상품 페이지 호출
	public Map<String, Object> userHostingViewList(int userno) {
		Map<String, Object> userHostingViewMap = new HashMap<String, Object>();
		
		List<RoomVo> userHostingViewList = userMapper.selectUserHostingViewList(userno);
		userHostingViewMap.put("userHostingViewList", userHostingViewList);

		return userHostingViewMap;
	}
	@Override // 회원 호스팅 상품 수정페이지 호출
	public Map<String, Object> userHostingModifyList(int userno, int roomNo) {
		Map<String, Object> userHostingModifyMap = new HashMap<String, Object>();
		
		List<RoomVo> userHostingModifyList = userMapper.selectUserHostingModifyList(userno, roomNo);
		userHostingModifyMap.put("userHostingModifyList", userHostingModifyList);

		return userHostingModifyMap;
	}
	@Override // 회원 호스팅 상품 수정페이지 실행
	public void userHostingModifDo (RoomVo roomVo) {
		userMapper.updateUserHostingModifDo(roomVo);
	}
	@Override // 호스팅 상품 삭제를 위한 예약 내역 삭제
	public Map<String, Object> userReservationDelete(int roomNo) {
		Map<String, Object> uReservartionDeleteMap = new HashMap<String, Object>();
		
		int resultDelete = userMapper.deleteUserReservationDeleteList(roomNo);
		int resultNum = userMapper.selectUserReservationDeleteCount(roomNo);
		
		String msg = "";
		if(resultNum == 0) {
			System.out.println("예약내역 삭제를 성공하였습니다.");
		}else {
			System.out.println("예약내역 삭제를 실패하였습니다.");
		}
		
		uReservartionDeleteMap.put("userReservationDeleteList", resultDelete);
		
		return uReservartionDeleteMap;
	}
	@Override // 회원 호스팅 상품 삭제
	public Map<String, Object> userHostingDelete(RoomVo roomVo) {
		Map<String, Object> uHostingdeleteMap = new HashMap<String, Object>();
		
		int resultDelete = userMapper.deleteUserHostingDeleteList(roomVo);
		int resultNum = userMapper.selectUserHostingDeleteCount(roomVo);
		
		String msg = "";
		if(resultNum == 0) {
			msg = "상품 삭제를 성공하였습니다.";
		}else {
			msg = "상품 삭제를 실패하였습니다.";
		}
		
		uHostingdeleteMap.put("userHostingDeleteList", resultDelete);
		uHostingdeleteMap.put("msg", msg);
		
		return uHostingdeleteMap;
	}
	
}
