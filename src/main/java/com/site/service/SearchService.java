package com.site.service;

import java.util.List;

import com.site.vo.RoomVo;

public interface SearchService {

	List<RoomVo> roomListAdvanced(String checkIn, String checkout, String roomType, String adult, String child, int minPrice, int maxPrice);
 
}
