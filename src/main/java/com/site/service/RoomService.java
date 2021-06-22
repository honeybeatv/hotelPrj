package com.site.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.site.vo.RoomVo;

public interface RoomService {

	List<RoomVo> getlist(int startday, int endday) throws ParseException;

	//상세 조건 검색
	List<RoomVo> roomListAdvanced(String checkIn, String checkOut, String roomType, String bedroom, String bed,
			int minPrice, int maxPrice, String pet, String smoke);
	

}
