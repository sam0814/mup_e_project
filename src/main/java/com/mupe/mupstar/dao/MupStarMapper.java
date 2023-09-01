package com.mupe.mupstar.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MupStarMapper {
	
	//public int selectStar(int movieId);
	
	public int insertStar(
			@Param("movieId") int movieId,
			@Param("startCount") int starCount);

}
