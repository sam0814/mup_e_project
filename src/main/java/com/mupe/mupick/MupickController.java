package com.mupe.mupick;

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
	public String boardView(Model model) {
		model.addAttribute("view", "mupick/mupickBoard");
		return "mupick/mupick_board";
	}
	
	@GetMapping("/mupick_detail_view")
	public String boardWritingView(
			@RequestParam("postId") int postId,
			HttpSession session,
			Model model) {
		
		int userId = (int)session.getAttribute("userId");
		
		// post select by postId, userId
		Mupick post = mupickBO.getPostByPostIdAndUserId(postId, userId);
		model.addAttribute("mupick", post);
		model.addAttribute("view", "mupick/mupick_board_writing");
		return "mupick/mupick_board_writing";
	}
	
	@GetMapping("/mupick_create_view")
	public String mupickCreateView(Model model) {
		model.addAttribute("view", "post/postCreate");
		return "/mupick/mupick_board_writing";
	}
}
