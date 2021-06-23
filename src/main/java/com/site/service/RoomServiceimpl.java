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

   //index페이지에서 검색
   @Override
   public List<RoomVo> getlist(int startday, int endday, String rcity, String rpeople) throws ParseException {
      String start = Integer.toString(startday);
      String end = Integer.toString(endday);
      List<RoomVo> vo = roomMapper.getlist(start,end,rcity,rpeople);
      return vo;
   }

   //상세 조건 검색
   @Override
   public List<RoomVo> roomListAdvanced(String checkIn, String checkOut, String rtype, int rroom, int rbed, int minPrice,
		   int maxPrice, String rpet, String rsmoke, String rcity, int rpeople) {
	   
	   List<RoomVo> list = roomMapper.selectAdvancedRoomList(checkIn, checkOut, rtype, rroom, rbed, minPrice, maxPrice, rpet, rsmoke, rcity, rpeople);
	   return list;
   }


   //room 리스트 페이지 호출
   @Override
   public List<RoomVo> roomsListAll() {
      List<RoomVo> roomlist = roomMapper.selectroomsListAll();
      return roomlist;
   }

   //rooms 숙소 등록
	@Override
	public void roomsAddDo(RoomVo roomVo) {
		roomMapper.insertRoomsAddDo(roomVo);
	}
}