package com.mupe.muphoto.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeToggleMapper {
	
	public int selectLikeCountByPostIdOrUserId(
			@Param("postId") int postId,
			@Param("userId") Integer userId);
	
	
	//추가
	public void insertLike(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	// 삭제
	public void deleteLikeByPostIdUserId(
			@Param("postId")int postId,
			@Param("userId") int userId);
	
	public void deleteLikeByPostId(int postId);
	
}
