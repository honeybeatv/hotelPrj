package com.site.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.mapper.AdminMapper;
import com.site.mapper.UserMapper;
import com.site.vo.UserVo;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	UserMapper userMapper;
	@Autowired
	AdminMapper adminMapper;

	@Override // 관리자 기본정보 페이지 호출
	public UserVo AdminInfoView(int userno) {
		UserVo adminVo = userMapper.selectUserInfoList(userno);
		return adminVo;
	}

	@Override // 관리자 기본정보 수정페이지 호출
	public UserVo AdminInfoModify(int userno) {
		UserVo adminVo = userMapper.selectUserInfoList(userno);
		return adminVo;
	}

	@Override // 관리자 기본정보 수정페이지 실행
	public void AdminInfoModifyDo(UserVo adminVo) {
		userMapper.updateUserInfoModifyDo(adminVo);
	}
	
	@Override
	public Map<String, Object> userList(int page) {
		Map<String,Object> map = new HashMap<String, Object>();
		
		int limit = 10; //페이지당 몇개의 게시글을 가져올지 정의(10,20,30...)
		
		//[[게시글데이터 가져오기 : 1~10까지 게시글 데이터 가져오기 ]]
		int startrow = (page-1)*limit+1; //처음페이지 계산공식 1,11,21,31,41....
		int endrow = startrow+limit-1;   //마지막페이지 계산공식 10,20,30,40.....
		
		
		List<UserVo> list = adminMapper.selectUserList(startrow,endrow);
		//[[ 하단 넘버링 계산 : startpage,endpage,maxpage 처리 ]]
		int listCount=0;  //총게시글 수
		listCount = adminMapper.selectUserCount();
		
		
		//하단 최대 넘버링페이지 
		int maxPage = (int)((double)listCount/limit+0.95); 
		//하단 시작 넘버링페이지
		int startPage = (((int) ((double)page / 10 + 0.95)) - 1) * 10 + 1;
		//하단 끝 넘버링페이지
		int endPage = maxPage;
		// 1,2,3,4,5,6,7,8,9,10 -> 10개가 모두 있을 경우는 10을 endPage에 넣어줌.
		if (endPage>startPage+10-1) {
			endPage=startPage+10-1;
		}

		// list,page(현재페이지),listCount,startPage,endPage,maxPage 6개 리턴해서 보내줌.
		map.put("list", list);
		map.put("page", page);
		map.put("listCount", listCount);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("maxPage", maxPage);
		
		return map;
	}
}
