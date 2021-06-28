package com.site.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.RoomVo;

@Mapper
public interface ReserveMapper {

	RoomVo roomReserve(int re_no);

}
