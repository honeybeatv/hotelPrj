package com.site.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.mapper.UserMapper;
import com.site.vo.ReserveVo;
import com.site.vo.RoomVo;
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
	public Map<String, Object> userReservationViewList(int userno) {
		Map<String, Object> uRVMap = new HashMap<String, Object>();
		
//		List<RoomVo> uReservationRoomList =  userMapper.selectUserReservationRoomList(userno);
		List<ReserveVo> uReservationReserveList =  userMapper.selectUserReservationReserveList(userno);
		uRVMap.put("uReservationReserveList", uReservationReserveList);
		
		return uRVMap;
	}
	
	
	@Override // 회원 호스팅 페이지 호출
	public RoomVo userHostingView(int userno) {
		RoomVo roomVo = userMapper.selectUserHostingList(userno);
		return roomVo;
	}
	
}
