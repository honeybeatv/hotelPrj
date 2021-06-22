
package com.site.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.RoomVo;

@Mapper
public interface RoomMapper {

	List<RoomVo> getlist(String start, String end);

	List<RoomVo> selectroomsListAll();
	

}
