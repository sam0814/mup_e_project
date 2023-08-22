package com.mupe.muphoto.timeline.domain;

import java.util.List;

import com.mupe.muphoto.comment.domain.CommentView;
import com.mupe.muphoto.post.entity.PostEntity;
import com.mupe.user.entity.UserEntity;

import lombok.Data;

@Data
public class CardView {

	// 글 1개
		private PostEntity post;
		
		// 글쓴이 정보
		private UserEntity user;
		
		// 댓글들
		private List<CommentView> commentList;
		
		// 좋아요들 개수
		private int likeCount;
		
		// 내가 좋아요를 눌렀는지 여부
		private boolean filledLike;
}
