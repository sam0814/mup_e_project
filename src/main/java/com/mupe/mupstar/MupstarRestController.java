package com.mupe.mupstar;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
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
			@RequestParam("startCount") int starCount) {
				
		//db insert
		starBO.addStar(movieId, starCount);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		return result;
	}
	
	
}
