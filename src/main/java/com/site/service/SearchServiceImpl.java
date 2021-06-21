package com.site.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.mapper.SearchMapper;
import com.site.vo.RoomVo;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	SearchMapper mapper;
	
	@Override
	public List<RoomVo> roomListAdvanced(String checkIn, String checkout, String roomType, String adult, String child,
			int minPrice, int maxPrice) {
		
		return mapper.selectAdvancedRoomList(checkIn, checkout, roomType, adult, child, minPrice, maxPrice);
	}

}
