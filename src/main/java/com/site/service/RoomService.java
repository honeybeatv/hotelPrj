package com.site.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.site.vo.RoomVo;

public interface RoomService {

	List<RoomVo> getlist(int startday, int endday) throws ParseException;
	

}
