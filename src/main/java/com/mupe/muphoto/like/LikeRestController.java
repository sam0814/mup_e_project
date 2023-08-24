package com.mupe.muphoto.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mupe.muphoto.like.bo.LikeBO;

@RestController
public class LikeRestController {
	@Autowired
	private LikeBO likeBO;
	
	@RequestMapping("/like/{postId}")
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
		likeBO.LikeToggle(postId, userId);
		
		// 응답
		result.put("code", 1);
		result.put("result", "성공");
		return result;
	}
}
