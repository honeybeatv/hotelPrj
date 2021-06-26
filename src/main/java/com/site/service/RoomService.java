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
	void roomsWriteDo(RoomVo roomVo); //void return타입이 필요없음

	RoomVo roomSingle(int roomNo);
	

}
