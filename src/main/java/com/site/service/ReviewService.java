package com.site.service;

import java.util.Map;

import com.site.vo.ReviewVo;

public interface ReviewService {

	Map<String, Object> reviewList();

	Map<String, Object> reviewInsert(ReviewVo reviewVo);

	Map<String, Object> reviewDelete(ReviewVo reviewVo);

	ReviewVo reviewUpdate(ReviewVo reviewVo);

}
