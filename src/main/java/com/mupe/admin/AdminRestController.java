package com.mupe.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("subject") String subject,
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpSession session) {
		
		// db insert
		movieBO.addPost(subject, file);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		return result;
	}
	
	@DeleteMapping("/delete")
	public Map<String, Object> delete(
			@RequestParam("id") int id,
			HttpSession session) {
		
		int movieId = (int)session.getAttribute("id");
		
		//BO 삭제
		movieBO.deletePostById(movieId);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		return result;
	}
}
