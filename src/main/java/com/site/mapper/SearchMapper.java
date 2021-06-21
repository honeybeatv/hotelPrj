package com.site.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.RoomVo;

@Mapper
public interface SearchMapper {

	List<RoomVo> selectAdvancedRoomList(String checkIn, String checkout, String roomType, String adult, String child,
			int minPrice, int maxPrice);

}
