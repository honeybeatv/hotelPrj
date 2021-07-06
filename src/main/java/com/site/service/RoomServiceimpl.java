package com.site.service;

import java.io.File;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.site.mapper.RoomMapper;
import com.site.mapper.UserMapper;
import com.site.vo.ReserveVo;
import com.site.vo.ReviewVo;
import com.site.vo.RoomVo;
import com.site.vo.UserVo;

@Service
public class RoomServiceimpl implements RoomService {
   
	@Autowired
   RoomMapper roomMapper;

	UserVo userVo;

   //index페이지에서 검색
	@Override
	public Map<String, Object> getlist(int startday, int endday, String rcity, int rpeople, int listPage) {

		int listCount = 0;
		listCount = roomMapper.selectSearchCount(startday, endday, rcity, rpeople);
		System.out.println(listCount);
		
		PageUtil paging = new PageUtil();
		Map<String, Object> listAndNums = new HashMap<String, Object>();
		listAndNums = paging.getPageNum(listPage, 9, listCount);
		
		int startrow = (int) listAndNums.get("startrow");
		int endrow = (int) listAndNums.get("endrow");
				
	    List<RoomVo> list = roomMapper.selectSearchList(startday,endday,rcity,rpeople, startrow, endrow);
		System.out.println(list);
		
		listAndNums.put("page", listPage);
		listAndNums.put("listCount", listCount);
		listAndNums.put("list", list);
		return listAndNums;
	}

   //상세 조건 검색
   @Override
   public Map<String, Object> roomListAdvanced(String checkIn, String checkOut, String rtype, int rroom, int rbed,
		   int minPrice, int maxPrice, String rpet, String rsmoke, String rcity, int rpeople, int page) {
	   
	   //총 데이터 수 쿼리문으로 구해오기
	   int listCount = 0;
	   //listCount = mapper.총 데이터 수
	   listCount = roomMapper.selectAdvancedSearchCount(checkIn, checkOut, rtype, rroom, rbed, minPrice, maxPrice, rpet, rsmoke, rcity, rpeople);
	   System.out.println("service count" + listCount);
	   
	   PageUtil paging = new PageUtil();
	   Map<String, Object> listAndNums = new HashMap<String, Object>();
	   listAndNums= paging.getPageNum(page, 9, listCount);	//현재 페이지, 한 페이지에 표시될 갯수, 전체 갯수
	   
	   System.out.println(listAndNums);
	   
	   int startrow = (int)listAndNums.get("startrow");
	   int endrow = (int)listAndNums.get("endrow");
	   System.out.println(startrow);
	   
	   //한 페이지에 표시 될 목록의 리스트
	   List<RoomVo> list = roomMapper.selectAdvancedRoomListPage(checkIn, checkOut, rtype, rroom, rbed, minPrice, maxPrice, rpet, rsmoke, rcity, rpeople, startrow, endrow);
	   
	   System.out.println("paging list " + list);
	   
	   listAndNums.put("page", page);
	   listAndNums.put("listCount", listCount);		
	   listAndNums.put("list", list);
	   return listAndNums;
   }


   //room 리스트 페이지 호출(index.jsp)
   @Override
   public Map<String,Object> roomsListAll(int page) {
      Map<String,Object> map = new HashMap<String,Object>();
		
		int limit = 6; // 페이지당 몇개의 게시물
		
		int startrow = (page-1)*limit + 1;
		int endrow = startrow+limit-1;
		List<RoomVo> list = roomMapper.selectroomsListAll(startrow,endrow);
		int listCount=0; // 총게시글 수
		listCount = roomMapper.selectRoomCount();
		//하단 넘버링 최대페이지
		int maxPage = (int)((double)listCount/limit+0.95);
		//하단 넘버링 시작페이지
		int startPage = (((int) ((double)page / 10 + 0.95)) - 1) * 10 + 1;
		//하단 끝 넘버링페이지
		int endPage = maxPage;
		// 1,2,3,4,5,6,7,8,9,10 -> 10개가 모두 있을 경우는 10을 endPage에 넣어줌.
		if (endPage>startPage+10-1) {
			endPage=startPage+10-1;
		}
		// page(현재페이지), listCount,startPage,endPage,maxPage 5개 리턴해서 보내줌
		map.put("listCount", listCount);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("maxPage", maxPage);
		map.put("page", page);
		map.put("list", list);
		return map;
   }
   
   //rooms 숙소 등록
	@Override
	public void roomsWriteDo(RoomVo roomVo,List<MultipartFile> files) {
		int i = 0;
		int userNo = roomVo.getUserno();	// userNo 가져온다?  이게 왜 null이나옴? 이게 6이 뽑혀야하는데 0이나오네?
		if( roomVo.getRsmoke()==null) {
			roomVo.setRsmoke("nosmoke");
		}
		if( roomVo.getRpet()==null) {
			roomVo.setRpet("nopet");
		}
		System.out.println("userNo ==> " + userNo);
		
		
		System.out.println("roomVo ==> " + roomVo);	//
		
		//String fileUrl = "C:/";
		String fileUrl = "C:/Users/pom53/git/hotelPrj/src/main/resources/static/upload/";
		//중복 방지를 위한 파일명 변경
		for(MultipartFile file : files) {
			i++;
		long time = System.currentTimeMillis();
		String uploadFileName = time+"_"+file.getOriginalFilename();
		//파일저장
		File f = new File(fileUrl + uploadFileName);
		//파일업로드
		try {
			file.transferTo(f);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if (i==1) {
		roomVo.setRpicture1(uploadFileName);
		} else if (i==2) {
		roomVo.setRpicture2(uploadFileName);
		} else if (i==3) {
		roomVo.setRpicture3(uploadFileName);
		}
		
		
		System.out.println("db 저장 전 uploadFile : " +uploadFileName);
		
		}
		roomMapper.insertRoomsWriteDo(roomVo);
	}
	
	//숙소 상세 페이지
	@Override
	public RoomVo roomSingle(int roomNo) {
		
		RoomVo roomVo = roomMapper.roomSingle(roomNo);
		
		roomVo.setRoomVoList(roomMapper.findOtherRoom(roomVo));
		
		return roomVo;
	}
	
	//예약 하기 누를시 user 이름,번호 가져오기
	@Override
	public UserVo userInfo(int userno) {
		
		UserVo userVo = roomMapper.userInfo(userno);
		
		return userVo;
	}

   //리뷰용 최근 예약 날짜 하나 얻기
	@Override
	public ReserveVo selectReserveDate(int roomNo, int userno) {
		System.out.println("service" + roomNo + ", " + userno);
		ReserveVo reserveVo = roomMapper.selectReserveDate(roomNo, userno);
		System.out.println("service out : " +  reserveVo);
		return reserveVo;
	}

	//리뷰 저장
	@Override
	public void reviewWriteDo(ReviewVo reviewVo) {
		roomMapper.reviewWriteDo(reviewVo);	
	}

	//리뷰 목록 불러오기
	@Override
	public Map<String, Object> reviewList(int page ,int roomNo) {
		Map<String,Object> map = new HashMap<String, Object>();
		int reviewCount = roomMapper.selectReivewListCount(roomNo);
		
		
		PageUtil paging = new PageUtil();
		map = paging.getPageNum(page, 20, reviewCount);
		
		int startrow = (int)map.get("startrow");
		int endrow = (int)map.get("endrow");
		
		List<ReviewVo> reviewList = roomMapper.selectReviewList(roomNo, startrow, endrow);
		map.put("page", page);
		map.put("reviewList", reviewList);
		map.put("reviewCount", reviewCount);
		
		System.out.println(map);
		
		return map;
	
	}

	@Override
	public List<ReviewVo> reviewListAll() {
		List<ReviewVo> reviewListAll = roomMapper.selectReviewListAll();
		
		return reviewListAll;
	}
   
}