package com.site.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomVo {
	private int roomNo;
	private String rname;
	private String rtype;
	private String rpeople;
	private String rinfo;
	private String rpicture;
	private String rcity;
	private int rprice;
	private int rroom;
	private int rbed;
	private String rsmoke;
	private String rpet;
	private String raddress;
	private int userno;
}
