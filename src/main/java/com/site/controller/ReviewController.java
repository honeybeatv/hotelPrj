package com.site.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.site.service.ReviewService;
import com.site.vo.ReviewVo;

@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;

	@RequestMapping("/reviewList")
	public String reviewList() {
		return "/reviewList";
	}

	@RequestMapping("/review")
	public String reviewList(Model model) {
		// replyVo, replyCount 가져옴
		Map<String, Object> map = reviewService.reviewList();
		model.addAttribute("map", map);
		return "/room-single";
	}

	// 댓글저장 - ajax
	@RequestMapping("/reviewInsert")
	@ResponseBody
	public Map<String, Object> replyInsert(ReviewVo reviewVo) {
		// 댓글을 저장하면서 댓글을 가져옴.
		return reviewService.reviewInsert(reviewVo);
	}

	// 댓글삭제 - ajax
	@RequestMapping("/reviewdelete")
	@ResponseBody
	public Map<String, Object> deleteReview(ReviewVo reviewVo) {
		// 댓글을 저장하면서 댓글을 가져옴.
		return reviewService.reviewDelete(reviewVo);
	}

	// 댓글수정 - ajax
	@RequestMapping("/reviewfix")
	@ResponseBody
	public ReviewVo replyUpdate(ReviewVo reviewVo) {
		System.out.println("controller getReviewNo : " + reviewVo.getReview_no());
		System.out.println("controller getReviewContent : " + reviewVo.getRecontent());
		// 댓글을 수정하면서 댓글을 가져옴.
		return reviewService.reviewUpdate(reviewVo);
	}

}
