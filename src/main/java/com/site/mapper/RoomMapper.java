package com.site.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.RoomVo;
import com.site.vo.UserVo;

@Mapper
public interface RoomMapper {

	//index에서 검색
	List<RoomVo> getlist(String start, String end, String city, int people);

	//상세조건 검색
	List<RoomVo> selectAdvancedRoomList(String checkIn, String checkOut, String rtype, int rroom, int rbed,
			int minPrice, int maxPrice, String rpet, String rsmoke, String rcity, int rpeople);

	//room 리스트 페이지 호출
	List<RoomVo> selectroomsListAll(int startrow, int endrow);

	//글쓰기
	void insertRoomsWriteDo(RoomVo roomVo);
	
	// 방 상세정보
	RoomVo roomSingle(int roomNo);
	
	//페이징용 게시글 카운트
		int selectSearchCount(String checkIn, String checkOut, String rtype, int rroom, int rbed, int minPrice,
				int maxPrice, String rpet, String rsmoke, String rcity, int rpeople);

		List<RoomVo> selectAdvancedRoomListPage(String checkIn, String checkOut, String rtype, int rroom, int rbed,
				int minPrice, int maxPrice, String rpet, String rsmoke, String rcity, int rpeople, int startRow,
				int endrow);

		List<RoomVo> findOtherRoom(RoomVo roomVo);

		int selectRoomCount();
		
		
		UserVo userInfo(int userno);

}


