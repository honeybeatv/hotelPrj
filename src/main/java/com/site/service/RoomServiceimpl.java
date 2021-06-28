package com.site.service;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.mapper.RoomMapper;
import com.site.vo.RoomVo;
import com.site.vo.UserVo;

@Service
public class RoomServiceimpl implements RoomService {
   
	@Autowired
   RoomMapper roomMapper;
	

	UserVo userVo;
	



   //index페이지에서 검색
   @Override
   public List<RoomVo> getlist(int startday, int endday, String rcity, int rpeople) throws ParseException {
      String start = Integer.toString(startday);
      String end = Integer.toString(endday);
      List<RoomVo> vo = roomMapper.getlist(start,end,rcity,rpeople);
      return vo;
   }

   //상세 조건 검색
   @Override
   public List<RoomVo> roomListAdvanced(String checkIn, String checkOut, String rtype, int rroom, int rbed, int minPrice,
		   int maxPrice, String rpet, String rsmoke, String rcity, int rpeople) {
	   System.out.println("service "+ rcity);
	   
	   
	   List<RoomVo> list = roomMapper.selectAdvancedRoomList(checkIn, checkOut, rtype, rroom, rbed, minPrice, maxPrice, rpet, rsmoke, rcity, rpeople);
	   System.out.println("service searchAdvanced " + list);
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
	public void roomsWriteDo(RoomVo roomVo) {
	
//		int userNo = userVo.getUserno();	// userNo 가져온다?  이게 왜 null이나옴? 
		int userNo = roomVo.getUserno();	// userNo 가져온다?  이게 왜 null이나옴? 이게 6이 뽑혀야하는데 0이나오네?
//		roomVo.setUserno(userNo);			// 받아온 userNo를 roomVo의 userNo에 대입?
		if( roomVo.getRsmoke()==null) {
			roomVo.setRsmoke("nosmoke");
		}
		if( roomVo.getRpet()==null) {
			roomVo.setRpet("nopet");
		}
		System.out.println("userNo ==> " + userNo);
		
		
		roomMapper.insertRoomsWriteDo(roomVo);
		System.out.println("roomVo ==> " + roomVo);	//
		
	}

	//페이징 연구중 by.봉
//	@Override
//	public List<RoomVo> roomListAdvanced2(String checkIn, String checkOut, String rtype, int rroom, int rbed,
//			int minPrice, int maxPrice, String rpet, String rsmoke, String rcity, int rpeople, int page) {
//		
//		//총 데이터 수 쿼리문으로 구해오기
//		//int listCount = 0;
//		//listCount = mapper.총 데이터 수
//		int listCount = roomMapper.selectSearchCount(checkIn, checkOut, rtype, rroom, rbed, minPrice, maxPrice, rpet, rsmoke, rcity, rpeople);
//		System.out.println("service count" + listCount);
//		
//		PageUtil paging = new PageUtil();
//		Map<String, Integer> pageNums= paging.getPageNum(page, 9, listCount);
//		
//		int startRow = pageNums.get("startrow");
//		int endrow = pageNums.get("endrow");
//		System.out.println(startRow);
//		
//		List<RoomVo> list = roomMapper.selectAdvancedRoomListPage(checkIn, checkOut, rtype, rroom, rbed, minPrice, maxPrice, rpet, rsmoke, rcity, rpeople, startRow, endrow);
//
//		System.out.println("paging list");
//		
//		return list;
//	}

	//숙소 상세 페이지
	@Override
	public RoomVo roomSingle(int roomNo) {
		
		RoomVo roomVo = roomMapper.roomSingle(roomNo);
		roomVo.setRoomVoList(roomMapper.findOtherRoom(roomVo));
		
		return roomVo;
	}
	


   
}