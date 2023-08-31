package com.mupe.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mupe.admin.bo.MovieBO;

@RestController
@RequestMapping("/admin")
public class AdminRestController {
	
	@Autowired
	private MovieBO movieBO; 

	/**
	 * 글 작성 API
	 * @param subject
	 * @param file
	 * @param session
	 * @return
	 */
	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("subject") String subject,
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpSession session) {
		
		// db insert
		movieBO.addPost(subject, file, false);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		return result;
	}
	
	
//	@PutMapping("/update")
//	public Map<String, Object> update(
//			@RequestParam("postId") int postId,
//			@RequestParam("subject") String subject,
//			@RequestParam("file") MultipartFile file,
//			@RequestParam("screen") boolean screen) {
//	
//	
//	// BO 업데이트
//	movieBO.updatePost(postId, subject, file, screen);
//	
//	// 응답
//	Map<String, Object> result = new HashMap<>();
//	result.put("code", 1);
//	result.put("result", "성공");
//	return result;
//	
//	}
}
