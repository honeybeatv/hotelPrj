package com.site.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVo {

	private int reviewNo; //자동입력
	private String userid;	// 유저아이디
	private int roomno;// 룸번호
	private String reviewPw;
	private String reviewContent;
	private String reviewDate; //자동입력

}
