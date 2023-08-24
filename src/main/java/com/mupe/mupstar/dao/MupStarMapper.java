package com.mupe.mupstar.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mupe.mupick.domain.Mupick;
import com.mupe.mupstar.domain.MupStar;

@Repository
public interface MupStarMapper {
	
	public List<Map<String, Object>> selectPostList();
	
	public List<MupStar> selectPostListByUserId(int userId);
	
	public MupStar selectPostByPostIdAndUserId(
			@Param("postId") int postId, 
			@Param("userId") int userId);
}
