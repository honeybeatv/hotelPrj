package com.site.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.ReserveVo;
import com.site.vo.RoomVo;
import com.site.vo.UserVo;

@Mapper
public interface ReserveMapper {

	

	List<ReserveVo> selectReserveListAll();

	List<ReserveVo> findOtherRoom(ReserveVo reserveVo);

	RoomVo roomReserve(int roomNo);

	void insertRoomReserve(int roomNo, int userno, String startday, String endday, String request);


}
