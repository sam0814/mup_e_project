package com.mupe.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mupe.common.EncryptUtils;
import com.mupe.user.bo.UserBO;
import com.mupe.user.entity.UserEntity;

@RequestMapping("user")
@RestController
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	
	
	@RequestMapping("/is_duplicated_email")
	public Map<String, Object> isDuplicatedEmail(
			@RequestParam("email") String email) {
		Map<String, Object> result = new HashMap<>();
		result.put("isDupilcatedEmail", false);
		
		// select
		UserEntity userEntity = userBO.getUserEntityByLoginEmail(email);
		result.put("code", 1);
		
		if (userEntity != null ) {
			result.put("isDuplicated", true);
		}
		
		return result;
	}

	
	
	@RequestMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		Map<String, Object> result = new HashMap<>();
		result.put("isDupilcatedId", false);
		
		// select
		UserEntity userEntity = userBO.getUserEntityByLoginId(loginId);
		result.put("code", 1);
		
		if (userEntity != null ) {
			result.put("isDuplicated", true);
		}
		
		return result;
	}

	/**
	 * 회원가입 API
	 * @param loginId
	 * @param password
	 * @param name
	 * @param email
	 * @return
	 */
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email) {
		
		// 비밀번호 해싱 - md5
		String hashedPassword = EncryptUtils.md5(password);
		
		//db insert
		Integer userId = userBO.addUser(loginId, hashedPassword, name, email);
		
		Map<String, Object> result = new HashMap<>();
		if (userId != null) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "회원가입");
		}
		return result;
	}
}
