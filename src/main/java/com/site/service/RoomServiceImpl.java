package com.site.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.mapper.RoomMapper;
import com.site.vo.RoomVo;

@Service
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	   RoomMapper roomMapper;
	
	
	@Override
	public List<RoomVo> roomsListAll() {
		List<RoomVo> roomlist = roomMapper.selectroomsListAll();
		return roomlist;
	}


	

	  
}
