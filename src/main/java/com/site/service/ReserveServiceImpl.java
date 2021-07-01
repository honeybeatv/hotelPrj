package com.site.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.mapper.ReserveMapper;
import com.site.vo.ReserveVo;
import com.site.vo.RoomVo;
import com.site.vo.UserVo;

@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	ReserveMapper reserveMapper;



	@Override
	public List<ReserveVo> reserveListAll() {
		List<ReserveVo> list = reserveMapper.selectReserveListAll();
		return list;
	}




	@Override
	public RoomVo roomReserve(int roomNo) {

		return reserveMapper.roomReserve(roomNo);
	}




	@Override
	public UserVo userInfo(int userno) {
		
		UserVo userVo = reserveMapper.userInfo(userno);
		
		
		return userVo;
	}




	@Override
	public void roomReserve(int roomNo, int userno, String startday, String endday) {
		reserveMapper.insertRoomReserve(roomNo,userno,startday,endday);
		
		
	}




	@Override
	public void save(ReserveVo ReserveVo) {
		
		reserveMapper.insertRoomReserve(ReserveVo.getRoomno(), ReserveVo.getUserno(), ReserveVo.getStartday(), ReserveVo.getEndday());
		
	}




	

}
