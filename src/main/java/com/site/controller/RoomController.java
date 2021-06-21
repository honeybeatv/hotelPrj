package com.site.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/room")
public class RoomController {

   @RequestMapping("/index")
   public String index() {
      return "/index";
   }

   @RequestMapping("/search")
   public String search() {
      return "/rooms";
   }

   @RequestMapping("/test")
   public String test() {
      return "/rooms";
   }
   @RequestMapping("/rooms-single")
   public String rooms() {
      return "/rooms-single";
   }
   

}