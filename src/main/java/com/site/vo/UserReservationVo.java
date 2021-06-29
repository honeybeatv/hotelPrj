package com.site.vo;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserReservationVo {

/*	private String cname; // user1.name
	private int cuserno; // user1.userno
	private String hname; // room.name
	private int huserno; // room.userno
*/	
	private int roomNo;	//room.roomNo
	private String rname;	//room.rname
	private String raddress;	//room.raddress
	private int rprice;		//room.rprice
	
	
	private String startday;	//reserve.startday
	private String endday;	//reserve.endday
}
