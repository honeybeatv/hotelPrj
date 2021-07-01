package com.site.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.site.vo.ReserveVo;
import com.site.vo.RoomVo;
import com.site.vo.UserVo;

public interface RoomService {
	
	//index에서 검색_페이징
	Map<String, Object> getlist(int startday, int endday, String rcity, int rpeople, int listPage);

	//상세 조건 검색_페이징
	Map<String, Object> roomListAdvanced(String checkIn, String checkOut, String rtype, int rroom, int rbed, int minPrice,
			int maxPrice, String rpet, String rsmoke, String rcity, int rpeople, int page);

	//room 리스트 페이지 호출
	Map<String, Object> roomsListAll(int page);
	
	//rooms 숙소 등록
	void roomsWriteDo(RoomVo roomVo, List<MultipartFile> file); //void return타입이 필요없음
	
	//숙소 상세페이지
	RoomVo roomSingle(int roomNo);

	UserVo userInfo(int userno);
	
	
	void roomReserve(int roomNo, int userno, String startday, String endday);




	
	


}
