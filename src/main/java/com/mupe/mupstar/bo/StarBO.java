package com.mupe.mupstar.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mupe.mupstar.dao.MupStarMapper;
import com.mupe.mupstar.domain.MupStar;

@Service
public class StarBO {

	@Autowired
	private MupStarMapper starMapper;
	
	public List<MupStar> getStarListByMovieId(int movieId) {
		return starMapper.selectStarListByMovieId(movieId);
	}
	
	public int getStar(int movieId, int userId) {
		return starMapper.selectStar(movieId, userId);
	}
	
	public int addStar(int movieId, int starCount, int userId) {
		return starMapper.insertStar(movieId, starCount, userId);
	}
	
	public void updateStar(int starCount) {
		//업데이트
		starMapper.updateStar(starCount);
	}
	
	
}
