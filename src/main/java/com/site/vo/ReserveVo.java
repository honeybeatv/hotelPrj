package com.site.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.sql.TIMESTAMP;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReserveVo {
	
	private int re_no;
	private int roomno;
	private String status;
	private String startday;
	private String endday;
	private int userno;
	
}
