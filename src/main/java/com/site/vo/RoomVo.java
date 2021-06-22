package com.site.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomVo {
	
   private int roomno;
   private String rtype;
   private String rpeople;
   private String rinfo;
   private String rpicture;
   private String rcity;
   private String rprice;
   private String rroom;
   private String rbed;
   private String rsmoke;
   private String rpet;
   private String raddress;
}