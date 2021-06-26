package com.site.service;

import java.util.Map;

import com.site.vo.UserVo;

public interface AdminService {

	// 관리자 기본정보 페이지 호출
	UserVo AdminInfoView(int userno);
	// 관리자 기본정보 수정페이지 호출
	UserVo AdminInfoModify(int userno);
	// 관리자 기본정보 수정페이지 실행
	void AdminInfoModifyDo(UserVo adminVo);
	
	Map<String, Object> userList(int page);

}
