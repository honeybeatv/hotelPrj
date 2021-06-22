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
public class RoomServiceimpl implements RoomService {
	
	@Autowired
	RoomMapper roomMapper;


	@Override
	public List<RoomVo> getlist(int startday, int endday) throws ParseException {
		String start = Integer.toString(startday);
		String end = Integer.toString(endday);
		List<RoomVo> vo = roomMapper.getlist(start,end);
		return vo;
	}


	@Override
	public List<RoomVo> roomsListAll() {
		List<RoomVo> roomlist = roomMapper.selectroomsListAll();
		return roomlist;
	}
}
