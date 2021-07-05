package com.site.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVo {

	private int review_no; //자동입력
	private int roomno;	// 룸넘버
	private int userno;// 유저넘버
	private String userid;
	private String redate;
	private String recontent;
	private int rescore; 
	private String reviewpw; 
	
	private List<ReviewVo> reviewVoList;
}
