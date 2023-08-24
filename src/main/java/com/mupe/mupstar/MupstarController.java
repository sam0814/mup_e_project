package com.mupe.mupstar;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mupe.mupstar.bo.StarBO;
import com.mupe.mupstar.domain.MupStar;

@RequestMapping("/star")
@Controller
public class MupstarController {
	
	@Autowired
	private StarBO starBO;

	@GetMapping("/movie_list_view")
	public String movieListView(Model model, HttpSession session) {
		
		// 로그인 여부 조회
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			//비로그인이면 로그인 페이지로 이동
			return "redirect:/user/sign_in_view";
		}
		
		// DB 글 목록 조회
		List<MupStar> postList = starBO.getPostListByUserId(userId);
		
		model.addAttribute("postList", postList);
		model.addAttribute("view", "mupstar/mupstar_board");
		
		return "mupstar/mupstar_board";
	}
	
	@GetMapping("/movie_star_view")
	public String movieStarView(Model model, HttpSession session) {
		return "mupstar/mupstar_board_detail";
	}
	
	@GetMapping("/movie_star_result_view")
	public String movieStarResultView() {
		return "mupstar/mupstar_board_detail_result";
	}
}
