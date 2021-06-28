package com.site.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.ReserveVo;
import com.site.vo.RoomVo;

@Mapper
public interface ReserveMapper {

	

	List<ReserveVo> selectReserveListAll();

}
