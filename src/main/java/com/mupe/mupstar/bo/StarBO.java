package com.mupe.mupstar.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mupe.mupick.dao.MupickMapper;
import com.mupe.mupick.domain.Mupick;
import com.mupe.mupstar.dao.MupStarMapper;
import com.mupe.mupstar.domain.MupStar;

@Service
public class StarBO {
	
	@Autowired
	private MupStarMapper mupStarMapper;

	
	public List<MupStar> getPostListByUserId(int userId) {
			
			return mupStarMapper.selectPostListByUserId(userId);
		}
	
	public MupStar getPostByPostIdAndUserId(int postId, int userId) {
		
		return mupStarMapper.selectPostByPostIdAndUserId(postId, userId);
	}
}
