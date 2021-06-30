package com.site.vo;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminReservationVo {

	private int re_no;	// re.re_no 예약번호
	private String cname; // user1.name 예약자 성명
	private String rname;	//room.rname 숙소 이름
	private String startday;	//reserve.startday
	private String endday;	//reserve.endday
	private String raddress;	//room.raddress
	private String hname; // user1.name 호스트 성명

}
