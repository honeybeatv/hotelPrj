package com.site.vo;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomReserveVo {

	private String rname;	//room.rname
	private String rcity;	//room.rcity
	private String startday;	//reserve.startday
	private String endday;	//reserve.endday
}
