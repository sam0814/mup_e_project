package com.mupe.mupstar;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mupe.mupstar.bo.StarBO;

@RestController
@RequestMapping("/star")
public class MupstarRestController {
	
	@Autowired
	private StarBO starBO;
	
	@PostMapping("/create")
	public Map<String, Object> starCreate(
			@RequestParam("movieId") int movieId,
			@RequestParam("startCount") int starCount,
			HttpSession session) {
		
		int userId = (int) session.getAttribute("userId");
				
		//db insert
		starBO.addStar(movieId, starCount, userId);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		return result;
	}
	
	@PutMapping("/update")
	public Map<String, Object> update(
			@RequestParam("movieId") int movieId,
			@RequestParam("startCount") int starCount,
			@RequestParam("userId") int userId) {
		
		// BO 업데이트
		starBO.updateStar(starCount);
		
		// 응답
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		return result;
	}
	
	
}
