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

@Service
public class MovieBO {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private MovieMapper movieMapper;

	@Autowired
	private FileManagerService fileManager;

	public List<Movie> getPostList() {
		return movieMapper.selectPostList();
	}

	public Movie getPostById(int id) {
		return movieMapper.selectPostById(id);
	}

//	public Movie getPostByPostId(int postId) {
//		return movieMapper.selectPostByPostId(postId);
//	}

	public int addPost(String subject, MultipartFile file, boolean screen) {
		String imagePath = null;

		if (file != null) {
			imagePath = fileManager.saveFile(imagePath, file);
		}

		return movieMapper.insertPost(subject, imagePath, screen);
	}
	
	//영화 삭제
	public void deletePost(int id) {

		// 영화 업데이트
		movieMapper.deletePost(id);
	}
	
		//영화 나타내기
//		public void insertPost(int id) {
//
//			// 영화 업데이트
//			movieMapper.insertPost(id);
//		}
}
