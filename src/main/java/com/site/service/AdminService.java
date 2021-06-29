package com.site.service;

import java.util.Map;

import com.site.vo.UserVo;

public interface AdminService {

	// 관리자 기본정보 페이지 호출
	UserVo adminInfoView(int userno);
	// 관리자 기본정보 수정페이지 호출
	UserVo adminInfoModify(int userno);
	// 관리자 기본정보 수정페이지 실행
	void adminInfoModifyDo(UserVo adminVo);
	
	Map<String, Object> userList(int uadmin, int page);
	// 관리자 회원 삭제
	Map<String, Object> adminUsersDelete(UserVo userVo);
	
	Map<String, Object> userHostingList();
	// 회원 호스팅 상품 페이지 호출
	Map<String, Object> adminUserHostingViewList(int userno);

}
