package com.mupe.muphoto.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mupe.muphoto.like.dao.LikeToggleMapper;

@Service
public class LikeBO {
	
	@Autowired
	private LikeToggleMapper likeToggleMapper;

	public void LikeToggle(int postId, int userId) {
		if (likeToggleMapper.selectLikeCountByPostIdOrUserId(postId, null) > 0) {
			// 삭제
			likeToggleMapper.deleteLikeByPostIdUserId(postId, userId);
		} else {
			// 추가
			likeToggleMapper.insertLike(postId, userId);
		}
	}
	
	public int getLikeCountByPostId(int postId) {
		return likeToggleMapper.selectLikeCountByPostIdOrUserId(postId, null);
	}
	
	public boolean filledLike(int postId, Integer userId) {
		// 비로그인
		if (userId == null) {
			return false;
		}
		
		// 로그인
		return likeToggleMapper.selectLikeCountByPostIdOrUserId(postId, userId) > 0;
	}
	
	public void deleteLikeByPostId(int postId) {
		likeToggleMapper.deleteLikeByPostId(postId);
	}
}
