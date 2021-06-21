package com.site.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomVo {

	private String room_No;
	private String rType;
	private String rArea;
	private String rPeople;
	private String rInfo;
	private String rGuide;
	private String rPicture;
	private String rLocation;
	private String rCity;
	private String rPrice;
}
