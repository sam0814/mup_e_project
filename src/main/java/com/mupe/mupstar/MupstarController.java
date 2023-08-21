package com.mupe.mupstar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/star")
@Controller
public class MupstarController {

	@GetMapping("/movie_list_view")
	public String movieListView() {
		return "mupstar/mupstar_board";
	}
	
	@GetMapping("/movie_star_view")
	public String movieStarView() {
		return "mupstar/mupstar_board_detail";
	}
	
	@GetMapping("/movie_star_result_view")
	public String movieStarResultView() {
		return "mupstar/mupstar_board_detail_result";
	}
}
