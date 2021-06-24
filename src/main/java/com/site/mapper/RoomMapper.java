package com.site.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.RoomVo;

@Mapper
public interface RoomMapper {

	//index에서 검색
	List<RoomVo> getlist(String start, String end, String city, String people);

	//상세조건 검색
	List<RoomVo> selectAdvancedRoomList(String checkIn, String checkOut, String rtype, int rroom, int rbed,
			int minPrice, int maxPrice, String rpet, String rsmoke, String rcity, int rpeople);

	//room 리스트 페이지 호출
	List<RoomVo> selectroomsListAll();

	//글쓰기
	void insertRoomsWriteDo(RoomVo roomVo);

}


