package com.mupe.muphoto.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mupe.muphoto.comment.bo.CommentBO;
import com.mupe.muphoto.comment.domain.CommentView;
import com.mupe.muphoto.like.bo.LikeBO;
import com.mupe.muphoto.post.bo.PostBO;
import com.mupe.muphoto.post.entity.PostEntity;
import com.mupe.muphoto.timeline.domain.CardView;
import com.mupe.user.bo.UserBO;
import com.mupe.user.entity.UserEntity;

@Service
public class TimelineBO {

	@Autowired
	private PostBO postBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	public List<CardView> generateCardViewList(Integer userId) {
		List<CardView> cardViewList = new ArrayList<>();
		
		// 글 목록 가져오기
		List<PostEntity> postList = postBO.getPostList();
		
		// 글 목록 반목문
		for (PostEntity post : postList) {
			CardView card = new CardView();
			
			//글 세팅
			card.setPost(post);
			
			// 글쓴이 세팅
			UserEntity user = userBO.getUserEntityById(post.getUserId());
			card.setUser(user);
			
			// 댓글 세팅
			List<CommentView> commentViewList  = commentBO.generateCommentViewList(post.getId());
			card.setCommentList(commentViewList);
			
			// 좋아요 개수
			int likeCount = likeBO.getLikeCountByPostId(post.getId());
			card.setLikeCount(likeCount);
			
			// 좋아요 여부
			boolean filledLike = likeBO.filledLike(post.getId(), userId);
			card.setFilledLike(filledLike);
			
			//cardViewList에 담는다
			cardViewList.add(card);
		}
		
		return cardViewList;
	}
}
