package com.mupe.muphoto.comment.domain;

import com.mupe.user.entity.UserEntity;

import lombok.Data;

@Data
public class CommentView {
		// 댓글 하나
		private Comment comment;
		
		// 댓글쓴이
		private UserEntity user;
}
