package com.site.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.mapper.UserMapper;
import com.site.vo.UserVo;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper userMapper;

	@Override // 회원 기본정보 페이지 호출
	public UserVo UserInfoView(String userid) {
		UserVo userVo = userMapper.selectUserInfo(userid);
		return userVo;
	}

	@Override // 회원 기본정보 수정페이지 호출
	public UserVo UserInfoModify(String userid) {
		UserVo userVo = userMapper.selectUserInfo(userid);
		return userVo;
	}

	@Override // 회원 기본정보 수정페이지 실행
	public void UserInfoModifyDo(UserVo userVo) {
		userMapper.updateUserInfoModifyDo(userVo);
	}


}
