package com.site.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.mapper.RoomMapper;
import com.site.vo.RoomVo;

@Service
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	RoomMapper mapper;


	@Override
	public List<RoomVo> getlist(int startday, int endday) throws ParseException {
		String start = Integer.toString(startday);
		String end = Integer.toString(endday);
		List<RoomVo> vo = mapper.getlist(start,end);
		return vo;
	}
	
	@Override
	public List<RoomVo> roomsListAll() {
		List<RoomVo> roomlist = mapper.selectroomsListAll();
		return roomlist;
	}

	@Override
	public List<RoomVo> roomListAdvanced(String checkIn, String checkOut, String roomType, String bedroom, String bed,
			int minPrice, int maxPrice, String pet, String smoke) {
		// TODO Auto-generated method stub
		return null;
	}
}
