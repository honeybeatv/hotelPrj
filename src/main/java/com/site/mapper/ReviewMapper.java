package com.site.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.ReviewVo;

@Mapper
public interface ReviewMapper {



	List<ReviewVo> selectReviewList();
	int selectReviewListCount();
	
	int insertReview(ReviewVo reviewVo);
	ReviewVo selectReviewOne(int review_no);
	
	
	void updateReview(ReviewVo reviewVo);
	int deleteReview(ReviewVo reviewVo);

}
