package com.site.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.site.vo.RoomVo;

public interface RoomService {
	
	//index에서 검색
	List<RoomVo> getlist(int startday, int endday, String rcity, int rpeople) throws ParseException;

	//상세 조건 검색
	List<RoomVo> roomListAdvanced(String checkIn, String checkOut, String rtype, int rroom, int rbed, int minPrice,
			int maxPrice, String rpet, String rsmoke, String rcity, int rpeople);

	//room 리스트 페이지 호출
	List<RoomVo> roomsListAll();
	
	//rooms 숙소 등록
	void roomsWriteDo(RoomVo roomVo);

	//페이징 연구중 by.봉
	List<RoomVo> roomListAdvanced2(String checkIn, String checkOut, String rtype, int rroom, int rbed, int minPrice,
			int maxPrice, String rpet, String rsmoke, String rcity, int rpeople, int page);
	

}
