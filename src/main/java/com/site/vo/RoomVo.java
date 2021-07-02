package com.site.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomVo {
	
	private int roomNo;
	private String rtype;
	private int rpeople;
	private String rinfo;
	private String rpicture1;
	private String rpicture2;
	private String rpicture3;
	private String rcity;
	private int rprice;
	private int rroom;
	private int rbed;
	private String rsmoke;
	private String rpet;
	private String raddress;
	private String rname;
	private int userno;
	private int count;
	private String prevyn;
	
	private List<RoomVo> roomVoList;
	
	private UserVo userVo;
	
}
