package com.mupe.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mupe.admin.domain.Movie;
import com.mupe.mupick.domain.Mupick;

@Repository
public interface MovieMapper {

	public List<Map<String, Object>> selectPostList();
	
	public List<Movie> selectPostListById(int id);
	
	public Movie selectPostByPostId(int postId);
	
	public int insertPost(
			@Param("subject") String subject,
			@Param("imagePath") String imagePath);
	
	public void deletePostById(int id);
}
