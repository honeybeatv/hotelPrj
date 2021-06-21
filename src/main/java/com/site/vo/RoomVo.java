package com.site.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomVo {
	private int RoomNo;
	private String Rtype;
	private String Rpeople;
	private String Rinfo;
	private String Rpicture;
	private String Rlocation;
	private String Rcity;
	private int Rprice;
	private int Rroom;
	private int Rbed;
	private String Rsmoke;
	private String Rpet;
	private String Raddress;
	private String startday;
	private String endday;
	
}
