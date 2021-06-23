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
	public UserVo UserInfoView(int userno) {
		UserVo userVo = userMapper.selectUserInfo(userno);
		return userVo;
	}

	@Override // 회원 기본정보 수정페이지 호출
	public UserVo UserInfoModify(int userno) {
		UserVo userVo = userMapper.selectUserInfo(userno);
		return userVo;
	}

	@Override // 회원 기본정보 수정페이지 실행
	public void UserInfoModifyDo(UserVo userVo) {
		userMapper.updateUserInfoModifyDo(userVo);
	}
	
	
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


}
