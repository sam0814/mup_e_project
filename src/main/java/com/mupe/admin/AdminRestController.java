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
	
	/**
	 * 영화 삭제 API
	 * @param id
	 * @return
	 */
	@PutMapping("/delete")
	public Map<String, Object> delete(
			@RequestParam("id") int id) {
	
	
	// BO 업데이트
	movieBO.deletePost(id);
	
	// 응답
	Map<String, Object> result = new HashMap<>();
	result.put("code", 1);
	result.put("result", "성공");
	return result;
	
	}
	
//	@PutMapping("/insert")
//	public Map<String, Object> insert(
//			@RequestParam("id") int id) {
//	
//	
//	// BO 업데이트
//	movieBO.insertPost(id);
//	
//	// 응답
//	Map<String, Object> result = new HashMap<>();
//	result.put("code", 1);
//	result.put("result", "성공");
//	return result;
//	
//	}
}
