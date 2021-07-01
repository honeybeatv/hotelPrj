package com.site.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.ReserveVo;
import com.site.vo.ReviewVo;
import com.site.vo.RoomVo;
import com.site.vo.UserVo;

@Mapper
public interface RoomMapper {

	// index에서 검색
	// search메소드 페이징용 게시글 카운트
	int selectSearchCount(int startday, int endday, String rcity, int rpeople);
	// search메소드 페이징용 게시글 리스트
	List<RoomVo> selectSearchList(int startday, int endday, String rcity, int rpeople, int startrow, int endrow);

	// 상세조건 검색
	// AdvancedSearch 페이징용 게시글 카운트
	int selectAdvancedSearchCount(String checkIn, String checkOut, String rtype, int rroom, int rbed, int minPrice,
			int maxPrice, String rpet, String rsmoke, String rcity, int rpeople);
	// AdvancedSearch페이징용 게시글 리스트
	List<RoomVo> selectAdvancedRoomListPage(String checkIn, String checkOut, String rtype, int rroom, int rbed,
			int minPrice, int maxPrice, String rpet, String rsmoke, String rcity, int rpeople, int startRow,
			int endrow);

	// room 리스트 페이지 호출
	List<RoomVo> selectroomsListAll(int startrow, int endrow);

	// 글쓰기
	void insertRoomsWriteDo(RoomVo roomVo);

	// 방 상세정보
	RoomVo roomSingle(int roomNo);

	List<RoomVo> findOtherRoom(RoomVo roomVo);

	int selectRoomCount();

	//예약하기 누를시 user정보 가져오기
	UserVo userInfo(int userno);
		
		
	void insertRoomReserve(int roomNo);
	

}
