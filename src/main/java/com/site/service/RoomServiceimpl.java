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
	RoomMapper mapper;



	@Override
	public List<RoomVo> getlist(int startday, int endday, String rcity, String rpeople) throws ParseException {
		// TODO Auto-generated method stub
		String start = Integer.toString(startday);
		String end = Integer.toString(endday);
		List<RoomVo> vo = mapper.getlist(start,end,rcity,rpeople);
		return vo;
	}
}
