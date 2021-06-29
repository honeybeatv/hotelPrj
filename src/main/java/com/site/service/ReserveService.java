package com.site.service;

import java.util.List;

import com.site.vo.ReserveVo;
import com.site.vo.RoomVo;
import com.site.vo.UserVo;

public interface ReserveService {


	List<ReserveVo> reserveListAll();

	RoomVo roomReserve(int re_no);

	UserVo userInfo(int userno);

}
