package com.mupe.muphoto.comment.domain;

import java.util.List;

import com.mupe.user.entity.UserEntity;

import lombok.Data;

@Data
public class CommentView {

	// 댓글 하나
		private Comment comment;
		
		// 댓글쓴이
		private UserEntity user;
		
		// 댓글들
		private List<CommentView> commentList;
		
		// 좋아요들 개수
		private int likeCount;
		
		//내가 좋아요 눌렀는지 여부
		private boolean isFilled;
}
