package com.mupe.admin.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mupe.admin.dao.MovieMapper;
import com.mupe.admin.domain.Movie;
import com.mupe.common.FileManagerService;
import com.mupe.mupick.domain.Mupick;

@Service
public class MovieBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MovieMapper movieMapper;

	@Autowired
	private FileManagerService fileManager;
	
	public List<Movie> getPostListById(int id) {
		return movieMapper.selectPostListById(id);
	}
	
	public int addPost(String subject, MultipartFile file) {
		String imagePath = null;
		
		if (file != null) {
			imagePath = fileManager.saveFile(imagePath, file);
		}
		
		return movieMapper.insertPost(subject, imagePath);
	}
	
	public Movie getPostByPostId(int postId) {
		return movieMapper.selectPostByPostId(postId);
	}
	
	public void deletePostById(int id) {
		// 기존 글 가져오기
		Movie movie = movieMapper.selectPostByPostId(id);
		
		if (movie == null) {
			logger.error("###[글 삭제] post id null", id);
			return;
		}
		
		// 기존 이미지가 있으면 삭제
		if (movie.getImagePath() != null) {
			// 이미지 제거
			fileManager.deleteFile(movie.getImagePath());
		}
		
		movieMapper.deletePostById(id);
	}
}

