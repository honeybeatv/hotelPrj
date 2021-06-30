package com.site.service;

import java.util.List;

import com.site.vo.ReserveVo;
import com.site.vo.RoomVo;
import com.site.vo.UserVo;

public interface ReserveService {


	List<ReserveVo> reserveListAll();

	RoomVo roomReserve(RoomVo roomVo);

	UserVo userInfo(int userno);

	void roomReserve(int roomNo, int userno, String startday, String endday);

	void save(ReserveVo roomVo);

}
