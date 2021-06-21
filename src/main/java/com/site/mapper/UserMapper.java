package com.site.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.site.service.UserService;
import com.site.vo.UserVo;

@Mapper
public interface UserMapper {

	// 회원 기본정보 호출
	UserVo selectUserInfo(String userid);
	// 회원 기본정보 수정
	void updateUserInfoModifyDo(UserVo userVo);;

}