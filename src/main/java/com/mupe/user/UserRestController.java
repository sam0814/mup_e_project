package com.mupe.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mupe.common.EncryptUtils;
import com.mupe.user.bo.UserBO;
import com.mupe.user.entity.UserEntity;

@RequestMapping("/user")
@RestController
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	
	/**
	 * 이메일 중복확인 API
	 * @param email
	 * @return
	 */
	@RequestMapping("/is_duplicated_email")
	public Map<String, Object> isDuplicatedEmail(
			@RequestParam("email") String email) {
		Map<String, Object> result = new HashMap<>();
		result.put("isDupilcatedEmail", false);
		
		// select
		UserEntity userEntity = userBO.getUserEntityByLoginEmail(email);
		result.put("code", 1);
		
		if (userEntity != null ) {
			result.put("isDupilcatedEmail", true);
		}
		
		return result;
	}

	
	
	/**
	 * 아이디 중복확인 API
	 * @param loginId
	 * @return
	 */
	@RequestMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		Map<String, Object> result = new HashMap<>();
		result.put("isDupilcatedId", false);
		
		// select
		UserEntity userEntity = userBO.getUserEntityByLoginId(loginId);
		result.put("code", 1);
		
		if (userEntity != null ) {
			result.put("isDupilcatedId", true);
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
			@RequestParam("input-userId") String loginId,
			@RequestParam("input-pw") String password,
			@RequestParam("input-name") String name,
			@RequestParam("input-email") String email) {
		
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
	
	/**
	 * 로그인 API
	 * @param loginId
	 * @param password
	 * @param request
	 * @return
	 */
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request) {
		
		// password hashing
		String hashedPassword = EncryptUtils.md5(password);
		
		// loginId, hashedPassword로 UserEntity => null or 채워져있음
		UserEntity userEntity = userBO.getUserEntityByLoginIdPassword(loginId, hashedPassword);
		
		Map<String, Object> result = new HashMap<>();
		if (userEntity != null) {
			// 로그인 처리
			HttpSession session = request.getSession();
			session.setAttribute("userId", userEntity.getId());
			session.setAttribute("userLoginId", userEntity.getLoginId());
			session.setAttribute("userName", userEntity.getName());
			
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			// 로그인 불가
			result.put("code", 500);
			result.put("errorMessage", "존재하지 않는 사용자입니다.");
		}
		
		return result;
	}
}
