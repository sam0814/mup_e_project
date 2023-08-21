package com.mupe.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("user")
@Controller
public class UserController {

	@GetMapping("/start/start_view")
	public String startView() {
		return "start/start";
	}
	
	@GetMapping("/sign_in_view")
	public String signInView(Model model) {
		model.addAttribute("view", "user/signIn");
		return "user/sign_in";
	}
	
	@GetMapping("/sign_up_view")
	public String signUpView(Model model) {
		model.addAttribute("view", "user/signUp");
		return "user/sign_up";
	}
	
	/**
	 * 로그아웃
	 * @param session
	 * @return
	 */
	@RequestMapping("/sign_out")
	public String signOut(HttpSession session) {
		// 세션에 있는 내용을 비운다.
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		
		// 로그인 화면으로 이동 => redirect
		return "redirect:/user/sign_in_view";
	}
	
}