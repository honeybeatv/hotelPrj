package com.site.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.mapper.ReserveMapper;
import com.site.vo.RoomVo;

@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	ReserveMapper reserveMapper;

	@Override
	public RoomVo roomReserve(int re_no) {
		
		RoomVo roomVo = reserveMapper.roomReserve(re_no);
		
		
		
		return null;
	}

}
