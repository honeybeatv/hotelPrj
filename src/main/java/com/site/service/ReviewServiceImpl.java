package com.site.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.mapper.ReviewMapper;
import com.site.vo.ReviewVo;


@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	ReviewMapper reviewMapper;

	@Override
	public Map<String, Object> reviewList() {
		Map<String,Object> map = new HashMap<String, Object>();
		List<ReviewVo> reviewList = reviewMapper.selectReviewList();
		int reviewCount = reviewMapper.selectReviewListCount();
		
		map.put("reviewList", reviewList);
		map.put("reviewCount", reviewCount);
		
		
		return null;
		
		

}

	@Override
	public Map<String, Object> reviewInsert(ReviewVo reviewVo) {
		Map<String,Object> map = new HashMap<String, Object>();
		
		int review_no = reviewMapper.insertReview(reviewVo);
		System.out.println("impl reviewVo : "+ review_no);
		System.out.println("impl reviewVo.getReplyNo() : "+ reviewVo.getReview_no());
		
		ReviewVo vo = reviewMapper.selectReviewOne(reviewVo.getReview_no());
		int reviewCount = reviewMapper.selectReviewListCount();
		
		map.put("reviewVo", vo);
		map.put("reviewCount", reviewCount);
		return null;
	}

	@Override
	public Map<String, Object> reviewDelete(ReviewVo reviewVo) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		int result = reviewMapper.deleteReview(reviewVo);
		int reviewCount = reviewMapper.selectReviewListCount();
		
		System.out.println("impl result : " +result);
		String msg = "";
		if(result==1) {
			msg="댓글삭제가 완료되었습니다.";
			
		}else {
			msg="댓글 삭제 처리에 에러가 발생했습니다.";
		}
		
		
		
		map.put("reviewCount", reviewCount);
		map.put("msg",msg);
		
		return map;
	}

	@Override
	public ReviewVo reviewUpdate(ReviewVo reviewVo) {
		System.out.println("impl reviewVo :"+reviewVo.getReview_no());
		
		reviewMapper.updateReview(reviewVo);
		
		ReviewVo vo = reviewMapper.selectReviewOne(reviewVo.getReview_no());
		System.out.println("impl content : "+vo.getRecontent());
		return vo;
	}
}