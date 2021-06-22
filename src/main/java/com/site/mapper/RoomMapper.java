package com.site.mapper;

import java.util.Date;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.RoomVo;

@Mapper
public interface RoomMapper {


	List<RoomVo> selectroomsListAll();

	List<RoomVo> getlist(String start, String end);

	List<RoomVo> selectAdvancedRoomList(String checkIn, String checkOut, String roomType, String bedroom, String bed,
			int minPrice, int maxPrice, String pet, String smoke);


}


