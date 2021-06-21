package com.site.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomVo {

	private int Room_No;
	private String Rtype;
	private String Rarea;
	private String Rpeople;
	private String Rinfo;
	private String Rguide;
	private String Rpicture;
	private String Rlocation;
	private String Rcity;
}
