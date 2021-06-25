package com.site.service;

import java.util.List;
import java.util.Map;

import com.site.vo.ReserveVo;
import com.site.vo.RoomReserveVo;
import com.site.vo.RoomVo;
import com.site.vo.UserVo;

public interface UserService {

	// 로그인
	UserVo login(UserVo userVo);
	// 회원가입
	int join(UserVo userVo);
	// 아이디 중복체크
	int id_check(String parameter);
	
	// 회원 기본정보 페이지 호출
	UserVo userInfoView(int userno);
	// 회원 기본정보 수정페이지 호출
	UserVo userInfoModify(int userno);
	// 회원 기본정보 수정페이지 실행
	void userInfoModifyDo(UserVo userVo);
	
	// 회원 예약정보 페이지 호출
	List<RoomReserveVo> userReservationViewList(int userno);
	
	// 회원 호스팅 상품 페이지 호출
	Map<String, Object> userHostingViewList(int userno);
	// 회원 호스팅 상품 수정페이지 호출
	Map<String, Object> userHostingModifyList(int userno, int roomNo);
	// 회원 호스팅 상품 수정페이지 실행
	void userHostingModifDo(RoomVo roomVo);
	// 회원 호스팅 상품 삭제
	Map<String, Object> userHostingDelete(RoomVo roomVo);

}
