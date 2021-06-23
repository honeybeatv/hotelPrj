package com.site.service;

import java.util.Map;

import com.site.vo.UserVo;

public interface UserService {

	// 회원 기본정보 페이지 호출
	UserVo UserInfoView(int userno);
	// 회원 기본정보 수정페이지 호출
	UserVo UserInfoModify(int userno);
	// 회원 기본정보 수정페이지 실행
	void UserInfoModifyDo(UserVo userVo);
	
	
	// 로그인
	UserVo login(UserVo userVo);
	// 회원가입
	int join(UserVo userVo);
	// 아이디 중복체크
	int id_check(String parameter);


}
