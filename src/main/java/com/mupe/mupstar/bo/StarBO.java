package com.mupe.mupstar.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mupe.admin.bo.MovieBO;
import com.mupe.admin.domain.Movie;
import com.mupe.muphoto.comment.domain.CommentView;
import com.mupe.muphoto.post.entity.PostEntity;
import com.mupe.muphoto.timeline.domain.CardView;
import com.mupe.mupstar.dao.MupStarMapper;
import com.mupe.mupstar.domain.MupStar;
import com.mupe.mupstar.domain.StarView;
import com.mupe.user.entity.UserEntity;

@Service
public class StarBO {
	
	@Autowired
	private MovieBO movieBO;
	
	@Autowired
	private MupStarMapper mupStarMapper;
	
	public List<StarView> getStarList() {
		return mupStarMapper.selectStarList();
	}

	
	public List<MupStar> getPostListByUserId(int userId) {
		
		return mupStarMapper.selectPostListByUserId(userId);
	}
	
//	public MupStar getPostByPostIdAndUserId(int postId, int userId) {
//		
//		return mupStarMapper.selectPostByPostIdAndUserId(postId, userId);
//	}
	
	public void StarToggle(int postId, int userId) {
		if (mupStarMapper.selectStarCountByPostIdOrUserId(postId, userId) > 0) {
			// 삭제
			mupStarMapper.deleteStarByPostIdUserId(postId, userId);
		} else {
			// 추가
			mupStarMapper.insertStar(postId, userId);
		}
	}
	
	public int getStarCountByPostId(int postId) {
		return mupStarMapper.selectStarCountByPostIdOrUserId(postId, null);
	}
	
	
	
	public boolean filledStar(int postId, Integer userId) {
		// 비로그인
		if (userId == null) {
			return false;
		}
		
		// 로그인
		return mupStarMapper.selectStarCountByPostIdOrUserId(postId, userId) > 0;
	}
	
	public void deleteStarByPostId(int postId) {
		mupStarMapper.deleteStarByPostId(postId);
	}
}
