package com.mupe.mupick.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mupe.common.FileManagerService;
import com.mupe.mupick.dao.MupickMapper;
import com.mupe.mupick.domain.Mupick;

@Service
public class MupickBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MupickMapper mupickMapper;
	
	@Autowired
	private FileManagerService fileManager;
	
	public List<Mupick> getPostListByUserId(int userId) {
		
		return mupickMapper.selectPostListByUserId(userId);
	}

	public int addPost(int userId, String userLoginId,
			String subject, String content,
			MultipartFile file) {
		
		String imagePath = null;
		
		// 이미지가 있으면 업로드 후 imagePath 받아옴
		if (file != null) {
			imagePath = fileManager.saveFile(userLoginId, file);
		}
		return mupickMapper.insertPost(userId, subject, content, imagePath);
	}
	
	public Mupick getPostByPostIdAndUserId(int postId, int userId) {
		return mupickMapper.selectPostByPostIdAndUserId(postId, userId);
	}
	
	public void updatePost(int userId, String userLoginId,
			int postId, String subject, String content, MultipartFile file) {
		
		// update 대상인 기존 글 가져오기 (validation, 이미지 교체시 기존 이미지 제거를 위해)
		Mupick mupick = mupickMapper.selectPostByPostIdAndUserId(postId, userId);
		logger.warn("###[글 수정] post is null. postId:{}, userId:{}", postId, userId);
		if (mupick == null) {
			logger.warn("###[글 수정] post ud null. postId:{}, userId:{}", postId, userId);
			return;
		}
		
		// 파일이 비어있지 않다면 업로드 후 imagePath 얻어옴
		// 업로드가 성공하면 기존 이미지 제거
		String imagePath = null;
		if (file != null) {
			// 업로드
			imagePath = fileManager.saveFile(userLoginId, file);
			
			// 기존 이미지 제거
			if (imagePath != null && mupick.getImagePath() != null) {
				//이미지 제거
				fileManager.deleteFile(mupick.getImagePath());
			}
			
		}
		// 글 업데이트
		mupickMapper.updatePostByIdAndUserId(postId, userId, subject, content, imagePath);
	}
	
	public void deletePostByPostIdAndUserId(int postId, int userId) {
		// 기존 글을 가져온다 (이미지가 있으면 삭제해야하기 때문에)
		Mupick mupick = mupickMapper.selectPostByPostIdAndUserId(postId, userId);
		if (mupick == null) {
			logger.error("###[글 삭제] post id null, postId:{}, userId:{}", postId, userId);
			return;
		}
		
		// 기존 이미지가 있으면 삭재
		if (mupick.getImagePath() != null) {
			// 이미지 제거
			fileManager.deleteFile(mupick.getImagePath());
		}
		
		mupickMapper.deletePostByIdAndUserId(postId, userId);
	}
	
	
}
