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
	private String uemail;
	private String userpw;
	private int userno;
	private String uphone;
	private int uadmin ;
}