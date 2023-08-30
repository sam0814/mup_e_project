package com.mupe.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mupe.admin.domain.Movie;

@Repository
public interface MovieMapper {

	public List<Movie> selectPostList();
	
	public Movie selectPostById(int id);
	
	//public Movie selectPostByPostId(int postId);
	
	public int insertPost(
			@Param("subject") String subject,
			@Param("imagePath") String imagePath,
			@Param("screen") boolean screen);
	
}
