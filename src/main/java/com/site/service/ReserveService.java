package com.site.service;

import java.util.List;

import com.site.vo.ReserveVo;
import com.site.vo.RoomVo;

public interface ReserveService {


	List<ReserveVo> reserveListAll();

	RoomVo roomReserve(int re_no);

}
