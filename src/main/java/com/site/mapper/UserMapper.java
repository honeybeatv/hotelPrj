package com.site.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.service.UserService;
import com.site.vo.ReserveVo;
import com.site.vo.RoomVo;
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
	List<ReserveVo> selectUserReservationReserveList(int userno);
	
	// 회원 호스팅 정보 호출
	List<RoomVo> selectUserHostingEditList(int userno);
	// 회원 호스팅 상품 삭제
	int selectUserHostingDeleteCount(RoomVo roomVo);
	int deleteUserHostingDeleteList(RoomVo roomVo);

}
