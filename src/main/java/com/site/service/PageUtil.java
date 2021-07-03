package com.site.service;

import java.util.HashMap;
import java.util.Map;

public class PageUtil {

	// 현재 페이지, 한 페이지에 표시할 갯수, 총 게시글 수를 파라미터로
	public Map<String, Object> getPageNum(int page, int limit, int listCount) {

		Map<String, Object> resultMap = new HashMap<String, Object>();

		System.out.println("pageutil in ");
		// 게시글 데이터 계산해서 가져오기
		int startrow = (page - 1) * limit + 1; // 첫 페이지 계산 공식 1, 11, 21, 31....
		int endrow = startrow + limit - 1; // 마지막 페이지 계산 공식 10, 20, 30, 40..

		// startpage, endpage, maxpage 처리

		// 하단 최대 넘버링 페이지
		// +0.95는 integer를 바로 하면 소수 뒷자리가 잘려서 정수로 변해버리기에 한자리 올려서 정수로 변환시키기 위해. =>올림 하려고
		int maxPage = (int) ((double) listCount / limit + 0.95);
		// 하단 시작 넘버링 페이지
		// 한 페이지에 표시 할 갯수를 10이라고 정해놔서 10. 다른 숫자의 경우는 바꿔주면 됨.
		// 하단 넘버링의 기준이 5개여서 5로 나누고 곱하는 것.
		int startPage = (((int) ((double) page / 5 + 0.95)) - 1) * limit + 1;
		// 하단 끝 넘버링 페이지
		int endPage = maxPage;
		// 1~10페이지까지 모두 있을경우는 10을 endPage에 넣어줌. maxpage가 더 크면 5을 넣어줘.
		// 여기의 5은 페이지 하단의 숫자(넘버링)을 몇개까지 띄울껀지.
		if (endPage > startPage + 5 - 1) {
			endPage = startPage + 5 - 1;
		}

		resultMap.put("startrow", startrow);
		resultMap.put("endrow", endrow);
		resultMap.put("startPage", startPage);
		resultMap.put("endPage", endPage);
		resultMap.put("maxPage", maxPage);

		System.out.println("pageutil out" + startrow);

		return resultMap;
	}
}
