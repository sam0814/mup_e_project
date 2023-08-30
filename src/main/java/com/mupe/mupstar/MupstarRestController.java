package com.mupe.mupstar;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mupe.mupstar.bo.StarBO;

@RestController
@RequestMapping("/star")
public class MupstarRestController {
	
	@Autowired
	private StarBO starBO;

	@RequestMapping("/star/{postId}")
	public Map<String, Object> like(
			@PathVariable int postId,
			HttpSession session) {
		
		// 로그인 여부 체크
		Map<String, Object> result = new HashMap<>();
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			result.put("code", userId);
			result.put("errormessage", "로그인이 필요합니다.");
		}
		
		//BO
		starBO.StarToggle(postId, postId);
		
		// 응답
		result.put("code", 1);
		result.put("result", "성공");
		return result;
	}
	
}
