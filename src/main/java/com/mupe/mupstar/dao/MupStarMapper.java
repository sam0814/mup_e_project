package com.mupe.mupstar.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mupe.mupstar.domain.MupStar;
import com.mupe.mupstar.domain.StarView;

@Repository
public interface MupStarMapper {
	
	public List<Map<String, Object>> selectPostList();
	
	public List<StarView> selectStarList();
	
	public List<MupStar> selectPostListByUserId(int userId);
	
	public MupStar selectPostByPostIdAndUserId(
			@Param("postId") int postId, 
			@Param("userId") int userId);
	
	public int selectStarCountByPostIdOrUserId(
			@Param("postId") int postId,
			@Param("userId") Integer userId);
	
	
	//추가
	public void insertStar(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	// 삭제
	public void deleteStarByPostIdUserId(
			@Param("postId")int postId,
			@Param("userId") int userId);
	
	public void deleteStarByPostId(int postId);
}
