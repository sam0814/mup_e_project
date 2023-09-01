package com.mupe.mupstar.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mupe.mupstar.dao.MupStarMapper;

@Service
public class StarBO {

	@Autowired
	private MupStarMapper starMapper;
	
//	public int getStar(int movieId) {
//		return starMapper.selectStar(movieId);
//	}
	
	public int addStar(int movieId, int starCount) {
		return starMapper.insertStar(movieId, starCount);
	}
	
	
}
