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
	private int roomno;	// 유저아이디
	private int userno;// 룸번호
	private String redate;
	private String recontent;
	private int rescore; //자동입력
	private String reviewpw; 

}
