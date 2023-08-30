package com.mupe.mupick.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mupe.mupick.domain.Mupick;

@Repository
public interface MupickMapper {

	public List<Mupick> selectPostList();
	
	public List<Mupick> selectPostListByUserId(int userId);
	
	public int insertPost(
			@Param("userId") int userId, 
			@Param("subject") String subject, 
			@Param("content") String content,
			@Param("imagePath") String imagePath);
	
	public Mupick selectPostByPostIdAndUserId(
			@Param("postId") int postId, 
			@Param("userId") int userId);
	
	public void updatePostByIdAndUserId(
			@Param("postId") int postId,
			@Param("userId") int userId,
			@Param("subject") String subject,
			@Param("content") String content,
			@Param("imagePath") String imagepath);
	
	public void deletePostByIdAndUserId(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
}
