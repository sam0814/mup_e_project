package com.mupe.mupick;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mupe.mupick.bo.MupickBO;
import com.mupe.mupick.domain.Mupick;

@Controller
@RequestMapping("/post")
public class MupickController {
	
	@Autowired
	private MupickBO mupickBO; 

	/**
	 * mupick 메인화면 API
	 * @param model
	 * @return
	 */
	@GetMapping("/mupick_list_view")
	public String boardView(HttpSession session, Model model) {
		
			// 로그인 여부 조회
			Integer userId = (Integer)session.getAttribute("userId");
			if (userId == null) {
				//비로그인이면 로그인 페이지로 이동
				return "redirect:/user/sign_in_view";
			}
		
		// DB 글 목록 조회
		List<Mupick> postList = mupickBO.getPostList();
		
		model.addAttribute("postList", postList);
		model.addAttribute("view", "mupick/mupick_board");
		return "mupick/mupick_board";
	}
	
	@GetMapping("/mupick_detail_view")
	public String boardWritingView(
			@RequestParam("postId") int postId,
			HttpSession session,
			Model model) {
		
		int userId = (int)session.getAttribute("userId");
		
		// post select by postId, userId
		Mupick post = mupickBO.getPostByPostId(postId);
		model.addAttribute("mupick", post);
		model.addAttribute("view", "mupick/mupick_board_detail");
		return "mupick/mupick_board_detail";
	}
	
	@GetMapping("/mupick_create_view")
	public String mupickCreateView(Model model) {
		model.addAttribute("view", "post/postCreate");
		return "/mupick/mupick_board_writing";
	}
}
