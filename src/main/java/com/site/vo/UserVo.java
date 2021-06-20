package com.site.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVo {
	
	private String name;
	private String userid;
	private String userpw;
	private String user_no;
	private String uaddress;
	private String uphone;
	private String unickname;
	private int uadmin ;
}