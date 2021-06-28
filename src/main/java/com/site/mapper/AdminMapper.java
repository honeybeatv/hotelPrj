package com.site.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.UserVo;

@Mapper
public interface AdminMapper {

	// 관리자 일반회원 정보 전체 호출
	List<UserVo> selectUserList(int uadmin, int startrow, int endrow);

	int selectUserCount();

	// 관리자 회원 삭제
	int deleteAdminUsersDeleteList(UserVo userVo);
	int selectAdminUsersDeleteCount(UserVo userVo);


}