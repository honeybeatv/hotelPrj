package com.site.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.HostingVO;
import com.site.vo.RoomVo;
import com.site.vo.UserVo;

@Mapper
public interface AdminMapper {

	// 관리자 일반회원 정보 전체 호출
	List<UserVo> selectUserList(int uadmin, int startrow, int endrow);

	int selectUserCount();

	// *관리자 회원 삭제*
	
	// 1단계. 예약내역 삭제
	int deleteAdminReservationDeleteList(int userno);
	int selectAdminReservationDeleteCount(int userno);
	// 2단계. 호스트 상품 삭제
	int deleteAdminHostingDeleteList(int userno);
	int selectAdminHostingDeleteCount(int userno);
	// 3단계. 회원 삭제 
	int deleteAdminUsersDeleteList(UserVo userVo);
	int selectAdminUsersDeleteCount(UserVo userVo);
	
	List<HostingVO> selectHostingCount();
	// 회원 호스팅 상품 호출
	List<RoomVo> selectUserHostingViewList(int userno);





}