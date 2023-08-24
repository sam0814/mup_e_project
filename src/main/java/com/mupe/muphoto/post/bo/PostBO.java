package com.mupe.muphoto.post.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mupe.common.FileManagerService;
import com.mupe.muphoto.comment.bo.CommentBO;
import com.mupe.muphoto.like.bo.LikeBO;
import com.mupe.muphoto.post.dao.PostRepository;
import com.mupe.muphoto.post.entity.PostEntity;

@Service
public class PostBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private FileManagerService fileManager;

	public List<PostEntity> getPostList() {
		return postRepository.findAllByOrderByIdDesc();
	}
	
	public PostEntity addPost(int userId, String userLoginId, String content, MultipartFile file) {
		String imagePath = null;
		
		if (file != null) {
			imagePath = fileManager.saveFile(userLoginId, file);
		}
		
		return postRepository.save(PostEntity.builder()
									.userId(userId)
									.content(content)
									.imagePath(imagePath)
									.build());
	}
	
	public void deletePostByPostIdUserId(int postId, int userId) {
		// 기존글 가져오기
		PostEntity post = postRepository.findById(postId).orElse(null);
		if (post ==null) {
			logger.error("[delete post] postId:{}, userId:{}", postId, userId);
			return;
		}
		
		// 만약 이미지 있으면 이미지 삭제
		fileManager.deleteFile(post.getImagePath());
		
		// 글 삭제
		postRepository.delete(post);
		
		// 댓글 삭제
		commentBO.deleteCommentsByPostId(postId);
		
		// 좋아요 삭제
		likeBO.deleteLikeByPostId(postId);
	}
}
