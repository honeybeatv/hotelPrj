package com.site.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.UserVo;

@Mapper
public interface AdminMapper {

	List<UserVo> selectUserList(int startrow, int endrow);

	int selectUserCount();


}