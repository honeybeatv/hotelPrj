package com.site.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.service.UserService;
import com.site.vo.UserVo;

@Mapper
public interface UserMapper {

	// 로그인
	UserVo selectLogin(UserVo userVo);
	// 회원가입
	int join_check(UserVo userVo);
	// 아이디 중복체크
	int id_check(String userid);

	// 회원 기본정보 호출
	UserVo selectUserInfoList(int userno);
	// 회원 기본정보 수정
	void updateUserInfoModifyDo(UserVo userVo);
	
	// 회원 예약정보 호출
	List<UserVo> selectUserReservationList(int userno);

}
