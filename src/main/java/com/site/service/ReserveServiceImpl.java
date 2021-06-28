package com.site.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.mapper.ReserveMapper;
import com.site.vo.ReserveVo;
import com.site.vo.RoomVo;

@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	ReserveMapper reserveMapper;

	



	@Override
	public List<ReserveVo> reserveListAll() {
		List<ReserveVo> list = reserveMapper.selectReserveListAll();
		return list;
	}

}
