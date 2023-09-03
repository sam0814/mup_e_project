package com.mupe.mupstar.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mupe.mupstar.domain.MupStar;

@Repository
public interface MupStarMapper {
	
	public List<MupStar> selectStarListByMovieId(int movieId);
	
	public int selectStar(
			@Param("movieId") int movieId,
			@Param("userId") int userId);
	
	public int insertStar(
			@Param("movieId") int movieId,
			@Param("startCount") int starCount,
			@Param("userId") int userId);
	
	public void updateStar(int starCount);

}
