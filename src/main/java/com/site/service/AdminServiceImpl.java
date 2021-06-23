package com.site.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.mapper.UserMapper;
import com.site.vo.UserVo;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	UserMapper userMapper;

	@Override // 관리자 기본정보 페이지 호출
	public UserVo AdminInfoView(int userno) {
		UserVo adminVo = userMapper.selectUserInfo(userno);
		return adminVo;
	}

	@Override // 관리자 기본정보 수정페이지 호출
	public UserVo AdminInfoModify(int userno) {
		UserVo adminVo = userMapper.selectUserInfo(userno);
		return adminVo;
	}

	@Override // 관리자 기본정보 수정페이지 실행
	public void AdminInfoModifyDo(UserVo adminVo) {
		userMapper.updateUserInfoModifyDo(adminVo);
	}
}
